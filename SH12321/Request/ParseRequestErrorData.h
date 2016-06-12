//
//  ParseRequestErrorData.h
//  MM-Community
//
//  Created by meimi on 16/1/20.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseRequestErrorData : NSObject

/*
 * 解析错误码
 * url 接口网址
 * code 接口返回code值
 */
+ (NSString *)parseRequestErrorCodeStrWithUrl:(NSString *)url errorCode:(NSInteger)code;

@end
