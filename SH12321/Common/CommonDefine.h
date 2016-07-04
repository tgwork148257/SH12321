//
//  CommonDefine.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

typedef NS_ENUM(NSInteger, ReportDataType){
    ReportCrankCall = 0,                //举报骚扰电话
    ReportScamCall,                     //举报诈骗电话
    ReportMessage,                      //举报短信
    ReportWIFI,                         //举报WIFI
    ReportEmail,                        //举报邮件
    ReportWebsite,                      //举报网站
    ReportApp,                          //举报APP
    ReportFakeBaseStation,              //举报伪基站
    ReportPhoneNumberIndentification,   //举报手机实名制
    ReportInfoReveal,                   //举报个人信息泄露
    ReportBadNews,                      //举报不良舆情
    ReportInfringment,                  //举报知识产权侵权
    ReportOthersVC,                     //举报其他
};



#define grayBgColor  [TGManager colorWithString:@"EEEEEE"] //灰色背景
#define commitBtnBgColor greenBgColor //提交按钮背景
#define greenBgColor C_GREEN
#define placeholderTextColor grayBgColor

static const CGFloat reportItemLabelH = 40.0F;
static const CGFloat reportItemTextFieldH = 35.0F;
static const CGFloat reportItemTextViewH = 70.0F;
static const CGFloat selectTimeViewH = 240.0F;
static const CGFloat commitBtnTopGap = 40.0F;
static const CGFloat commitBtnBottomGap = 64.0F;

#define C_LABEL [TGManager colorWithString:@"707070"]
#define C_INPUT [TGManager colorWithString:@"b7b7b7"]

#define F_TEXT FONTSIZE15


#endif /* CommonDefine_h */
