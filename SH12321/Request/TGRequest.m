//
//  TGRequest.m
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGRequest.h"
#import "AFNetworking.h"
#import "ServiceConfig.h"

@implementation TGRequest

//获取Json GET方法
+ (void)getJsonDataWithUrl:(NSString*)url parameters:(id)parameters success:(void(^)(id json)) success fail:(void(^)())fail;

{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];

    NSLog(@"url is %@",url);
    NSLog(@"parameters is %@",parameters);
    // 网络访问是异步的,回调是主线程的,因此程序员不用管在主线程更新UI的事情
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation* operation,id responseObject) {
        if(success) {
            NSLog(@"responseObject is %@",responseObject);
            success(responseObject);
        }
    }failure:^(AFHTTPRequestOperation*operation,NSError*error){
        NSLog(@"error is %@",error);
        if(fail){
            fail();
        }
    }];
}

//post提交json数据：
+ (void)postJSONWithUrl:(NSString*)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail

{
    AFHTTPRequestOperationManager*manager = [AFHTTPRequestOperationManager manager];
    
    // 设置请求格式
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
//    // 设置返回格式
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSLog(@"url is %@",urlStr);
    NSLog(@"parameters is %@",parameters);
    
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation* operation,id responseObject){
        if(success){
            NSLog(@"responseObject is %@",responseObject);
            success(responseObject);
        }
    }failure:^(AFHTTPRequestOperation* operation,NSError* error){
        NSLog(@"%@",error);
        if(fail){
            fail();
        }
    }];
}


//上传图片：
+ (void)uploadImageUrl:(NSString*)urlStr parameters:(id)parameters data:(NSData *)imageData success:(void(^)(id responseObject))success fail:(void(^)())fail
{
    NSLog(@"url is %@",urlStr);
    
    
    //1.创建一个名为mgr的请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"test.jpg" forHTTPHeaderField:@"fileName"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *imageName = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",imageName];
    
//    NSString *user_token = [TGUtils getUserToken];
//    parameters = @{@"file":imageData,
//                            @"filename":fileName,
//                            userTokenKey:user_token};
    
    NSLog(@"parameters is %@",parameters);
    //3.发送请求
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg/jpg"];
        /*
         Data: 要上传的二进制数据
         name:保存在服务器上时用的Key值
         fileName:保存在服务器上时用的文件名,注意要加 .jpg或者.png
         mimeType:让服务器知道我上传的是哪种类型的文件
         */
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {//发送成功会来到这里
        if(success){
            NSLog(@"请求图片接口成功 responseObject is %@",responseObject);
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {//发送成功会来到这里
        NSLog(@"请求图片接口失败  error is %@",error);
        if(fail){
            fail();
        }
    }];

}



//检测网络状态：
+ (void)netWorkStatus

{
    /**
     
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     
     */
    
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        NSLog(@"%ld",status);
    }];
}

+(void)TestAFN{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
//    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
    NSURL *URL = [NSURL URLWithString:@"http://www.66liuliang.com/12321/index.php/App/getToken"];

    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}



/************************************接口************************************/
#pragma mark -- server token
+ (void)getServerTokenSuccess:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_TOKEN];
    NSString *device_token = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSDictionary *parameters = @{@"app_version":@"1.0",
                                 @"server_version":@"iOS",
                                 @"appid":device_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取手机验证码
+ (void)getVerificationCodeWithNumber:(NSString *)phoneNumber success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_CODE];
    NSString *token = [TGUtils getServerToken];
    NSDictionary *parameters = @{@"mobile":phoneNumber,
                                 @"token":token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取用户token
+ (void)getUserTokenWithNumber:(NSString *)phoneNumber code:(NSString *)code success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_USER_TOKEN];
    NSString *token = [TGUtils getServerToken];
    NSDictionary *parameters = @{@"mobile":phoneNumber,
                                 @"code":code,
                                 @"token":token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报骚扰电话接口
+ (void)commitReportCrankCallWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}


#pragma mark -- 举报诈骗电话接口
+ (void)commitReportScamCallWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报短信接口
+ (void)commitReportMessageWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报网站接口
+ (void)commitReportWebsiteWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报App接口
+ (void)commitReportAppWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报伪基站接口
+ (void)commitReportBaseStationWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报WIFI接口
+ (void)commitReportWifiWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报信息泄露接口
+ (void)commitReportInfoRevealWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报不良舆情接口
+ (void)commitReportBadNewsWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报知识产权侵权接口
+ (void)commitReportInfrigmentWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报手机实名制接口
+ (void)commitReportPhoneNumberIdentificationWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 举报其他制接口
+ (void)commitReportOthersWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 上传图片接口
+ (void)uploadImageWithImage:(UIImage *)image success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_UPLOAD_PIC];
    NSString *user_token = [TGUtils getUserToken];
    NSData *imageData = [TGUtils imageToData:image];
//    NSDictionary *parameters = @{@"file":imageData,
//                                 userTokenKey:user_token};
    NSDictionary *parameters = @{ userTokenKey:user_token};
    [self uploadImageUrl:urlStr parameters:parameters data:imageData success:success fail:fail];
}

#pragma mark -- 获取举报列表接口
+ (void)getReportListWithPage:(NSInteger)page success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_REPORT_LIST];
    NSString *user_token = [TGUtils getUserToken];
    NSDictionary *parameters = @{@"page":@(page),
                                 userTokenKey:user_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取举报详情接口
+ (void)getReportDetailWithId:(NSString *)reportID success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_REPORT_DETAIL];
    NSString *user_token = [TGUtils getUserToken];
    NSDictionary *parameters = @{@"jw_id":reportID,
                                 userTokenKey:user_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取新闻列表接口
+ (void)getNewsListWithPage:(NSInteger)page success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_NEWS_LIST];
    NSString *user_token = [TGUtils getUserToken];
    NSDictionary *parameters = @{@"page":@(page),
                                 userTokenKey:user_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取新闻详情接口
+ (void)getNewsDetailWithId:(NSString *)newsID success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_NEWS_DETAIL];
    NSString *user_token = [TGUtils getUserToken];
    NSDictionary *parameters = @{@"news_id":newsID,
                                 userTokenKey:user_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}


#pragma mark -- 举报反馈接口
+ (void)reportFeedbackWithId:(NSString *)reportID feedback:(NSString *)feedback success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_FEEDBACK];
    NSString *user_token = [TGUtils getUserToken];
    NSDictionary *parameters = @{@"jw_id":reportID,
                                 @"feedback":feedback,
                                 userTokenKey:user_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 更新版本接口
+ (void)updateVerisonSuccess:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:COMMIT_UPDATE_VERSION];
    NSString *user_token = [TGUtils getUserToken];
    NSDictionary *parameters = @{@"device":@"ios",
                                 userTokenKey:user_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 修改个人信息
+ (void)modifyUserInfoWithName:(NSString *)name gender:(NSString *)gender adress:(NSString *)address success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:COMMIT_UPDATE_VERSION];
    NSString *user_token = [TGUtils getUserToken];
    NSDictionary *parameters = @{@"device":@"ios",
                                 userTokenKey:user_token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}







@end
