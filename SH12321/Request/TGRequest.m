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

//post提交json数据：
+ (void)postJSONWithUrl:(NSString*)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail

{
    AFHTTPRequestOperationManager*manager = [AFHTTPRequestOperationManager manager];
    
    // 设置请求格式
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
//    // 设置返回格式
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
//    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation* operation,id responseObject){
//        
//        //        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        if(success){
//            success(responseObject);
//        }
//    }failure:^(AFHTTPRequestOperation* operation,NSError* error){
//        NSLog(@"%@",error);
//        
//        if(fail){
//            
//            fail();
//        }
//    }];
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
    NSString *token = [TGUtils getServerToken];
    NSString *imageStr = [TGUtils imageToBase64Str:image];
    NSDictionary *parameters = @{@"file":imageStr,
                                 @"token":token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取举报列表接口
+ (void)getReportListWithPage:(NSInteger)page success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_REPORT_LIST];
    NSString *token = [TGUtils getServerToken];
    NSDictionary *parameters = @{@"page":@(page),
                                 @"token":token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取举报详情接口
+ (void)getReportDetailWithId:(NSString *)reportID success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_REPORT_DETAIL];
    NSString *token = [TGUtils getServerToken];
    NSDictionary *parameters = @{@"id":reportID,
                                 @"token":token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取新闻列表接口
+ (void)getNewsListWithPage:(NSInteger)page success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_NEWS_LIST];
    NSString *token = [TGUtils getServerToken];
    NSDictionary *parameters = @{@"page":@(page),
                                 @"token":token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

#pragma mark -- 获取新闻详情接口
+ (void)getNewsDetailWithId:(NSString *)reportID success:(void(^)(id responseObject))success fail:(void(^)())fail{
    NSString *urlStr = [BASIC_URL stringByAppendingString:GET_NEWS_DETAIL];
    NSString *token = [TGUtils getServerToken];
    NSDictionary *parameters = @{@"id":reportID,
                                 @"token":token};
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}

















@end
