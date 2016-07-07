//
//  ServiceDefine.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#ifndef ServiceDefine_h
#define ServiceDefine_h

static NSString *const crankCallSendNumberKey    = @"crankCallSendNumberKey";    //骚扰电话Key
static NSString *const crankCallAcceptNumberKey  = @"crankCallAcceptNumberKey";    //被骚扰电话Key
static NSString *const crankCallTypeKey          = @"scamTypeKey";                  //骚扰类型Key
static NSString *const crankCallLengthKey        = @"crankCallLengthKey";    //骚扰电话时间长度Key
static NSString *const crankCallTimeKey          = @"crankCallTimeKey";    //骚扰电话时间Key
static NSString *const crankCallContentKey       = @"scamCallContentKey";    //骚扰电话内容Key

static NSString *const scamCallSendNumberKey    = @"scamCallSendNumberKey";    //诈骗电话Key
static NSString *const scamCallAcceptNumberKey  = @"scamCallAcceptNumberKey";    //被诈骗电话Key
static NSString *const scamCallTypeKey          = @"scamTypeKey";    //诈骗类型Key
static NSString *const scamCallLengthKey        = @"scamCallLengthKey";    //诈骗电话时间长度Key
static NSString *const scamCallTimeKey          = @"scamCallTimeKey";    //诈骗电话时间Key
static NSString *const scamCallContentKey       = @"scamCallContentKey";    //诈骗电话内容Key

static NSString *const messageSendNumberKey = @"messageSendNumberKey";    //垃圾短信接收号码Key
static NSString *const messageAcceptNumberKey = @"messageAcceptNumberKey";    //垃圾短信发送号码Key
static NSString *const messageContentKey = @"messageContentKey";    //垃圾短信内容Key

static NSString *const websiteURLKey = @"websiteURLKey";    //不良网站URL Key
static NSString *const websiteTypeKey = @"websiteTypeKey";    //不良网站类型Key
static NSString *const websiteContentKey = @"websiteContentKey";    //不良网站内容描述Key

static NSString *const AppNameKey = @"AppNameKey";    //不良App名称Key
static NSString *const AppSourceKey = @"AppSourceKey";    //不良App来源Key
static NSString *const AppContentKey = @"AppContentKey";    //不良App描述Key

static NSString *const WIFINameKey = @"wifiNameKey";    //不良WIFI名称Key
static NSString *const WIFIAdressKey = @"WIFIAdressKey";    //不良WIFI地址Key

static NSString *const fakeBasicStationTypeKey = @"fakeBasicStationTypeKey";    //伪基站Key
static NSString *const fakeBasicStationAdressKey = @"fakeBasicStationAdressKey";    //伪基站地址Key
static NSString *const fakeBasicStationContentKey = @"fakeBasicStationContentKey";    //伪基站内容Key



#endif /* ServiceDefine_h */
