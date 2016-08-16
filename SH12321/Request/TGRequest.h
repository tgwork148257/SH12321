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

#pragma mark -- 上传图片接口
+ (void)uploadImageWithImage:(UIImage *)image success:(void(^)(id responseObject))success fail:(void(^)())fail;


#pragma mark -- 获取举报列表接口
+ (void)getReportListWithPage:(NSInteger)page success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 获取举报详情接口
+ (void)getReportDetailWithId:(NSString *)reportID success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 获取新闻列表接口
+ (void)getNewsListWithPage:(NSInteger)page success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 获取新闻详情接口
+ (void)getNewsDetailWithId:(NSString *)newsID success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 举报反馈接口
+ (void)reportFeedbackWithId:(NSString *)reportID feedback:(NSString *)feedback score:(NSString *)grade success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 更新版本接口
+ (void)updateVerisonSuccess:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 修改个人信息
+ (void)modifyUserInfoWithName:(NSString *)name gender:(NSString *)gender age:(NSString *)age adress:(NSString *)address success:(void(^)(id responseObject))success fail:(void(^)())fail;

#pragma mark -- 获取个人信息
+ (void)getUserInfoSuccess:(void(^)(id responseObject))success fail:(void(^)())fail;
@end
