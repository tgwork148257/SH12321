//
//  ServerRequest.m
//  MM-Community
//
//  Created by meimi on 16/1/20.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import "ServerRequest.h"
#import "MyMD5.h"
#import "SBJson.h"
#import "ParseRequestErrorData.h"
#import "RequestUrl.h"
#import "AFNetworking.h"



// 获取文章列表
#define IOS_CLIENT_KEY @"5469a1629bbe4"
#define IOS_MD5_SECRET @"7aceb00416a6047810e63b7c7b1eafc9"

#define REQUEST_PORT @"RequestPort"

@implementation ServerRequest

#pragma mark --------*****************------网络配置请求
#pragma mark -- 配置网络请求
/***** ----传入参数示例
 * portStr:             请求网络端口参数
 * params:              请求其他参数包装成的字典
 *****/
//+ (RequsetData *)configASIFormDataRequestWithPortStr:(NSString *)portStr params:(NSDictionary *)paramsDic {
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@",MM_COMMUNITY_APP_API, portStr];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    [self addParametersWithRequest:request params:paramsDic]; // 增加请求表头
//    [self addHttpHeader:request];  // 添加表头
//    [request startSynchronous];
//    [request requestFinished];
//    NSError *error = [request error];
//    if ( !error ){
//        SBJsonParser *parser = [[SBJsonParser alloc] init];
//        NSString *htmlStr = [request responseString];
//        NSLog(@"/*********************************/");
////        NSLog(@"paramDic is %@, paramsDic");
//        NSLog(@"urlStr is %@ ",urlStr);
//        NSLog(@"htmlStr is %@ ",htmlStr);
//        NSLog(@"/*********************************/");
//        NSDictionary *dictionary = [parser objectWithString:htmlStr];
//        return [self getRequestDataWithDic:dictionary urlStr:urlStr];
//    }else{
//        RequsetData *requestData = [[RequsetData alloc] init];
//        requestData.isSuccess = NO;
//        requestData.dataDic = nil;
//        requestData.requsetCodeStr = @"网络请求错误";
//        requestData.requsetCode = 0;
//        requestData.isDicHasData = NO;
//        return requestData;
//    }
//}
//
//#pragma mark -- 网络请求增加参数
//+ (void)addParametersWithRequest:(ASIFormDataRequest *)request params:(NSDictionary *)paramsDic {
//    long nowTime = time(NULL);
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setObject:IOS_CLIENT_KEY forKey:@"client_key"];
//    [dic setObject:[NSString stringWithFormat:@"%ld", nowTime] forKey:@"time"];
//    
//    if (paramsDic != nil) {
//        NSArray* arr = [paramsDic allKeys];
//        for(NSString* str in arr){
//            [dic setObject:[NSString stringWithFormat:@"%@",[paramsDic objectForKey:str]] forKey:str];
//            [request setPostValue:[paramsDic objectForKey:str] forKey:str];
//        }
//    }
//    
//    [request setPostValue:[self createMd5Sign:dic] forKey:@"sign"];
//    [request setPostValue:IOS_CLIENT_KEY forKey:@"client_key"];
//    [request setPostValue:[NSNumber numberWithLong:nowTime] forKey:@"time"];
//    request.timeOutSeconds = REQUEST_TIMEOUT;
//}
//
//#pragma mark -- 获取解析数据
//+ (RequsetData *)getRequestDataWithDic:(NSDictionary *)dic urlStr:(NSString *)urlStr {
//    RequsetData *requestData = [[RequsetData alloc] init];
//    if ([[dic objectForKey:@"code"] intValue]== 200) {
//        requestData.isSuccess = YES;
//        requestData.requsetCodeStr = @"请求成功";
//        requestData.requsetCode = [[dic objectForKey:@"code"] integerValue];
//        requestData.dataDic = [dic objectForKey:@"data"];
//        
//        if ([requestData.dataDic isKindOfClass:[NSDictionary class]] && [requestData.dataDic allKeys].count != 0) {
//            requestData.dataDic = [dic objectForKey:@"data"];
//            requestData.isDicHasData = YES;
//        }else {
//            requestData.dataDic = nil;
//            requestData.isDicHasData = NO;
//        }
//        
//    }else {
//        requestData.isSuccess = NO;
//        NSInteger code = [[dic objectForKey:@"code"] integerValue];
//        requestData.requsetCodeStr = [ParseRequestErrorData parseRequestErrorCodeStrWithUrl:urlStr errorCode:code];
//        requestData.requsetCode = code;
//         requestData.dataDic = [dic objectForKey:@"data"];
//
//        if ([requestData.dataDic isKindOfClass:[NSDictionary class]] && [requestData.dataDic allKeys].count != 0) {
//            requestData.dataDic = [dic objectForKey:@"data"];
//            requestData.isDicHasData = YES;
//        }else {
//            requestData.dataDic = nil;
//            requestData.isDicHasData = NO;
//        }
//    }
//    return requestData;
//}
//
//#pragma mark -- 添加表头
//+ (void)addHttpHeader:(ASIFormDataRequest *)request {
//    
//    [request addRequestHeader:HTTP_VERSION_KEY value:HTTP_VERSION_VALUE];
//    NSString *deviceTokenValue = HTTP_DEVICETOKEN_VALUE;
////    NSString *accessTokenValue = HTTP_USERTOKEN_VALUE;
//    NSString *accessTokenValue = nil;
//
//    if (!EMPTY_STRING(deviceTokenValue)) {
//        [request addRequestHeader:HTTP_DEVICETOKEN_KEY value:deviceTokenValue];
//    }
//    if (!EMPTY_STRING(accessTokenValue)) {
//        [request addRequestHeader:HTTP_USERTOKEN_KEY value:accessTokenValue];
//    }
//}
//
//#pragma mark -- 获取Md5加密
//+ (NSString *)createMd5Sign:(NSMutableDictionary *)dic {
//    NSMutableString *contentString  =[NSMutableString string];
//    NSArray *keys = [dic allKeys];
//    //按字母顺序排序
//    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        return [obj1 compare:obj2 options:NSNumericSearch];
//    }];
//    //拼接字符串
//    
//    for (NSString *str in sortedArray) {
//        if (!EMPTY_STRING(str) && ![str isEqualToString:@"sign"] && ![str isEqualToString:@"key"]){
//            [contentString appendFormat:@"%@=%@&", str, [dic objectForKey:str]];
//        }
//    }
//    //添加key字段
//    [contentString appendFormat:@"key=%@", IOS_MD5_SECRET];
//    NSLog(@"[self createMd5Sign:dic]  %@", contentString);
//    //得到MD5 sign签名
//    NSString *md5Sign =[MyMD5 md5d:contentString];
//    return md5Sign;
//}
//
//
//#pragma mark  -- 获取服务端token
///*
// device_token	设备唯一标识	  Str	客户端手机的唯一标识	不可为空        214f we2e1
// device_os      客户端系统版本	  Str	客户端手机的系统版本	不可为空        8.4.1
// app_version	App版本号	      Str	客户端的版本          不可为空        1.1.0
// */
//+(void)getInstallDeviceToken {
//    NSString *device_token = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    NSString *device_os = [[UIDevice currentDevice] systemVersion];
//    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
//    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
//    NSString *app_version = currentVersion;
//    
//    NSString *str = MM_COMMUNITY_APP_API;
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@",str,PORT_DEVICE_CLIENT_INSTALL_TOKEN];
//    
//    // 当前时间戳
//    long nowTime = time(NULL);
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setObject:IOS_CLIENT_KEY forKey:@"client_key"];
//    [dic setObject:device_token forKey:@"device_token"];
//    [dic setObject:device_os forKey:@"device_os"];
//    [dic setObject:app_version forKey:@"app_version"];
//    [dic setObject:[NSString stringWithFormat:@"%ld", nowTime] forKey:@"time"];
//    
//    NSString *sign = [self createMd5Sign:dic];
//    
//
//    
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.timeOutSeconds = REQUEST_TIMEOUT ;
//    [request setPostValue:IOS_CLIENT_KEY     forKey:@"client_key"];
//    [request setPostValue:app_version   forKey:@"app_version"];
//    [request setPostValue:device_token  forKey:@"device_token"];
//    [request setPostValue:device_os     forKey:@"device_os"];
//    [request setPostValue:[NSNumber numberWithLong:nowTime]     forKey:@"time"];
//    [request setPostValue:sign          forKey:@"sign"] ;
//    [request addRequestHeader:HTTP_VERSION_KEY value:HTTP_VERSION_VALUE];
//    [request startSynchronous];
//    [request requestFinished];
//    
//    NSError *error = [request error];
//    NSString *response;
//    if (!error){
//        response = [request responseString];
//        SBJsonParser *parser = [[SBJsonParser alloc] init] ;
//        NSLog(@"获取服务端token  %@", response);
//        NSDictionary *dictionary = [parser objectWithString:response] ;
//        if ((![dictionary isKindOfClass:[NSNull class]]) &&([[dictionary objectForKey:@"code"] intValue] == 200)){
//            NSDictionary *dic = [dictionary objectForKey:@"data"];
//            NSString *token = [dic objectForKey:@"token"];
//            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//            [user setObject:token forKey:EQUIPMENT_TOKEN];
//        }
//    }else{
//        NSLog(@"获取服务端token失败");
//    }
//}
//
//#pragma mark -----------*****************************------------
//
//
//
//#pragma mark --------*****************-------获取数据请求
//#pragma mark -- 获取文章详情
//+ (RequsetData *)getArticleDetailData:(NSInteger)article_id {
//    //网络请求只需要传入两个参数
//    
//    /***** ----传入参数示例
//     * PORT_GETARTICLELIST:         请求网络端口参数
//     * paramsDic:                   请求其他参数包装成的字典
//     *****/
//    
//    // 1.若param为值类型,用语法糖包装，其中key与参数同名，值为@(param)  示例NSDictionary *paramsDic = @{@"param": @(param)};
//    // 2.若param为字符串类型,其中key与参数同名，值为param  示例NSDictionary *paramsDic = @{@"param": param};
//    NSDictionary *paramsDic = @{@"article_id": @(article_id)};
//    return [self configASIFormDataRequestWithPortStr:PORT_GETARTICLELIST params:paramsDic];
//}
//
///*******
// * version	版本号	String	客户端版本号	不可为空	  4
// * client   客户端	String	客户端名称	不可为空	  ios
// *******/
//#pragma mark - 版本---获取最新版本信息
//+ (RequsetData *)getNewVersionInfoWithVersion:(NSString *)version client:(NSString *)client {
//    NSDictionary *paramsDic = @{@"version": version,
//                                @"client": client};
//    return [self configASIFormDataRequestWithPortStr:PORT_VERSION_CHECKVERSION params:paramsDic];
//}
//
//
///*****
// * phone      手机号码      Str       用户手机号码               不可为空
// * ip         IP地址        Str       要填，但是没有做判断        可为空
// * area       国家区域代码	 Str       不填默认是86               可为空
// * verify     校验码	     Str       图片验证码	                可为空
// ******/
//#pragma mark - 获取验证码
//+ (RequsetData *)getVerificationCodeWithPhone:(NSString *)phone ip:(NSString *)ip area:(NSString *)area verify:(NSString *)verify {
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    if (!EMPTY_STRING(phone)) {
//        [dic setObject:phone forKey:@"phone"];
//    }
//    if (!EMPTY_STRING(ip)) {
//        [dic setObject:ip forKey:@"verify_code"];
//    }
//    if (!EMPTY_STRING(area)) {
//        [dic setObject:area forKey:@"area"];
//    }
//    if (!EMPTY_STRING(verify)) {
//        [dic setObject:verify forKey:@"verify"];
//    }
//    NSDictionary *paramsDic = dic;
//    return [self configASIFormDataRequestWithPortStr:PORT_PASSPORT_GETVERIFICATIONCODE params:paramsDic];
//}




@end
