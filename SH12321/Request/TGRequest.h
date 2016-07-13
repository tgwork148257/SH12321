//
//  TGRequest.h
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGRequest : NSObject

+(void)TestAFN;

#pragma mark -- 获取服务端token
+ (void)getServerTokenSuccess:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 获取手机验证码
+ (void)getVerificationCodeWithNumber:(NSString *)phoneNumber success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 获取手机验证码
+ (void)getUserTokenWithNumber:(NSString *)phoneNumber code:(NSString *)code success:(void(^)(id responseObject))success fail:(void(^)())fail;



#pragma mark -- 举报骚扰电话接口
+ (void)commitReportCrankCallWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报诈骗电话接口
+ (void)commitReportScamCallWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报短信接口
+ (void)commitReportMessageWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报网站接口
+ (void)commitReportWebsiteWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报App接口
+ (void)commitReportAppWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报伪基站接口
+ (void)commitReportBaseStationWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报Wifi接口
+ (void)commitReportWifiWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报信息泄露接口
+ (void)commitReportInfoRevealWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报不良舆情接口
+ (void)commitReportBadNewsWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报知识产权侵权接口
+ (void)commitReportInfrigmentWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报手机实名制接口
+ (void)commitReportPhoneNumberIdentificationWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报其他制接口
+ (void)commitReportOthersWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;


@end
