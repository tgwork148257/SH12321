//
//  ServerRequest.h
//  MM-Community
//
//  Created by meimi on 16/1/20.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequsetData.h"

@interface ServerRequest : NSObject

#pragma mark ----Demo
#pragma mark - 获取文章详情

#pragma mark - 安装---安装设备时请求设备token
+ (void)getInstallDeviceToken;

#pragma mark - 版本---获取最新版本信息
+ (RequsetData *)getNewVersionInfoWithVersion:(NSString *)version client:(NSString *)client;


#pragma mark - 验证码---获取验证码
+ (RequsetData *)getVerificationCodeWithPhone:(NSString *)phone ip:(NSString *)ip area:(NSString *)area verify:(NSString *)verify;

#pragma mark - 验证码---获取国家区域代码 
+ (RequsetData *)getCountryPhoneCode;

/***************************
 *圈子部分
 ***************************/

@end
