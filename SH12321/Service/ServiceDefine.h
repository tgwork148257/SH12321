//
//  ServiceDefine.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#ifndef ServiceDefine_h
#define ServiceDefine_h

static NSString *const serverTokenKey               = @"token";    //服务端返回token Key
static NSString *const userTokenKey                 = @"user_token";    //用户token Key
static NSString *const phoneVerificationCodeKey     = @"code";    //手机验证码Key
static NSString *const contentKey                   = @"content";    //举报内容Key





static NSString *const crankCallSendNumberKey    = @"report_mobile";    //骚扰电话Key
static NSString *const crankCallAcceptNumberKey  = @"crankCallAcceptNumberKey";    //被骚扰电话Key
static NSString *const crankCallTypeKey          = @"report_type";                  //骚扰类型Key
static NSString *const crankCallStatusKey        = @"harass_type";                  //骚扰形式Key
static NSString *const crankCallLengthKey        = @"talk_time";    //骚扰电话时间长度Key
static NSString *const crankCallTimeKey          = @"call_time";    //骚扰电话时间Key

static NSString *const scamCallSendNumberKey    = @"report_mobile";    //诈骗电话Key
static NSString *const scamCallAcceptNumberKey  = @"scamCallAcceptNumberKey";    //被诈骗电话Key
static NSString *const scamCallTypeKey          = @"report_type";    //诈骗类型Key
static NSString *const scamCallLengthKey        = @"talk_time";    //诈骗电话时间长度Key
static NSString *const scamCallTimeKey          = @"call_time";    //诈骗电话时间Key

static NSString *const messageSendNumberKey = @"report_mobile";    //垃圾短信接收号码Key
static NSString *const messageAcceptNumberKey = @"messageAcceptNumberKey";    //垃圾短信发送号码Key

static NSString *const websiteURLKey = @"report_www";    //不良网站URL Key
static NSString *const websiteTypeKey = @"report_type";    //不良网站类型Key

static NSString *const AppNameKey = @"AppNameKey";    //不良App名称Key
static NSString *const AppSourceKey = @"source";    //不良App来源Key

static NSString *const WIFINameKey = @"wifi_name";    //不良WIFI名称Key
static NSString *const WIFIAdressKey = @"report_adress";    //不良WIFI地址Key

static NSString *const fakeBasicStationTypeKey = @"report_type";    //伪基站Key
static NSString *const fakeBasicStationAdressKey = @"report_adress";    //伪基站地址Key

static NSString *const storeTypeNameKey = @"report_type";    //店类型
static NSString *const storeNameKey = @"report_title";    //实体店名称
static NSString *const storeAdressKey = @"report_adress";    //实体店地址
static NSString *const buyNumberKey = @"report_mobile";    //伪基站地址Key
static NSString *const buyTimeKey = @"buy_time";            //购买时间Key
static NSString *const operatorKey = @"operator";           //运营商Key
static NSString *const storeImagerKey = @"img";             //实体店照片Key
static NSString *const userImagerKey = @"card_img";         //用户持卡照片Key
static NSString *const reasonKey = @"reason";              //违规原因Key



#endif /* ServiceDefine_h */
