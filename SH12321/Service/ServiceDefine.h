//
//  ServiceDefine.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#ifndef ServiceDefine_h
#define ServiceDefine_h

static NSString *const serverTokenKey               = @"token";         //服务端返回token Key
static NSString *const userTokenKey                 = @"user_token";    //用户token Key
static NSString *const phoneVerificationCodeKey     = @"code";          //手机验证码Key



static NSString *const sendNumberKey = @"report_mobile";    //发送骚扰电话， 诈骗电话 ，垃圾短信的号码Key
static NSString *const acceptNumberKey = @"accept_mobile";    //接收骚扰电话， 诈骗电话 ，垃圾短信的号码Key
static NSString *const adressKey = @"report_adress";        //实体店地址， 不良WIFI地址 ，伪基站地址的号码Key
static NSString *const callLengthKey    = @"talk_time";        //骚扰电话, 诈骗电话时间长度Key
static NSString *const callTimeKey      = @"call_time";        //骚扰电话, 诈骗电话时间Key
static NSString *const nameKey          = @"name";        //举报名称 (App, WIFI, 伪基站,实体店或者网店名字) Key
static NSString *const typeKey          = @"report_type";        //骚扰电话, 诈骗电话时间Key
static NSString *const contentKey       = @"content";       //举报内容Key

static NSString *const crankCallStatusKey        = @"harass_type";      //骚扰形式Key

static NSString *const websiteURLKey = @"report_www";       //不良网站URL Key

static NSString *const AppSourceKey = @"source";        //不良App来源Key

static NSString *const buyNumberKey = @"buy_mobile";           //购买的号码Key
static NSString *const buyTimeKey = @"buy_time";                //购买时间Key
static NSString *const operatorKey = @"operator";               //运营商Key
static NSString *const storeImagerKey = @"img";                 //实体店照片Key
static NSString *const userImagerKey = @"card_img";             //用户持卡照片Key
static NSString *const reasonKey = @"reason";                   //违规原因Key



#endif /* ServiceDefine_h */
