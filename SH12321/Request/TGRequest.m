//
//  TGRequest.m
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGRequest.h"
#import "AFNetworking.h"

@implementation TGRequest

//获取Json GET方法
+ (void)getJsonDataWithUrl:(NSString*)url parameters:(id)parameters success:(void(^)(id json)) success fail:(void(^)())fail;

{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
    
    NSDictionary *dict = @{@"format":@"json"};
    
    // 网络访问是异步的,回调是主线程的,因此程序员不用管在主线程更新UI的事情
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation* operation,id responseObject) {
        
        if(success) {
            success(responseObject);
        }
        
    }failure:^(AFHTTPRequestOperation*operation,NSError*error){
        NSLog(@"%@",error);
        
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
    
    // 设置返回格式
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation* operation,id responseObject){
        
        //        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        if(success){
            success(responseObject);
        }
    }failure:^(AFHTTPRequestOperation* operation,NSError* error){
        NSLog(@"%@",error);
        
        if(fail){
            
            fail();
        }
    }];
}

+(void)TestAFN{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
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
#pragma mark -- 举报骚扰电话接口
+ (void)commitReportCrankCallWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail{
    [self getJsonDataWithUrl:urlStr parameters:parameters success:success fail:fail];
}



















@end
