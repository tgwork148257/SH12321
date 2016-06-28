//
//  ReportDataModel.h
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGModel.h"


typedef NS_ENUM(NSInteger, ReportDataType){
    ReportCrankCall = 0,                //举报骚扰电话
    ReportScamCall,                     //举报诈骗电话
    ReportMessage,                      //举报短信
    ReportWIFI,                         //举报WIFI
    ReportWebsite,                      //举报网站
    ReportApp,                          //举报APP
    ReportFakeBaseStation,              //举报伪基站
    ReportPhoneNumberIndentification,   //举报手机实名制
    ReportInfoReveal,                   //举报个人信息泄露
    ReportBadNews,                      //举报不良舆情
    ReportInfringment,                  //举报知识产权侵权
    ReportOthersVC,                     //举报其他
};

@interface ReportDataModel : TGModel

@property (nonatomic, copy) NSString *reportAcceptNumber;    //接收内容电话

@property (nonatomic, copy) NSString *reportSendNumber;    //发送内容电话

@property (nonatomic, copy) NSString *reportContent;        //举报内容

@property (nonatomic, copy) NSString *reportAdress;         //举报地址

@property (nonatomic, copy) NSString *reportTime;           //举报时间


@property (nonatomic, copy) NSString *reportAppSource;       //举报App来源

@property (nonatomic, copy) NSString *reportName;           //举报名称 (App, WIFI, 伪基站)

@property (nonatomic, assign) NSInteger reportTimeLength;     //举报时长索引

@property (nonatomic, copy) NSString *reportTimeLengthStr;     //举报时长字符串


@property (nonatomic, copy) NSString *reportWebsiteURL;         //举报网站URL

@property (nonatomic, copy) NSString *reportWebsiteTypeStr;         //举报网站类型字符串

@property (nonatomic, assign) NSInteger reportWebsiteType;         //举报网站类型


@property (nonatomic, copy) NSString *reportCrankCallTypeStr;     //举报骚扰电话类型字符串

@property (nonatomic, copy) NSString *reportCrankCallStatusStr;    //举报骚扰电话形式字符串

@property (nonatomic, assign) NSInteger reportCrankCallType;     //举报骚扰电话类型索引

@property (nonatomic, assign) NSInteger reportCrankCallStatus;    //举报骚扰电话形式索引


@property (nonatomic, copy) NSString *reportScamCallTypeStr;     //举报诈骗电话类型字符串

@property (nonatomic, copy) NSString *reportScamCallStatusStr;    //举报诈骗电话形式字符串

@property (nonatomic, assign) NSInteger reportScamCallType;     //举报诈骗电话类型索引

@property (nonatomic, assign) NSInteger reportScamCallStatus;    //举报诈骗电话形式索引


@property (nonatomic, copy) NSString *reportFakeBasicStationTypeStr;           //举报伪基站类型字符串

@property (nonatomic, assign) NSInteger reportFakeBasicStationType;           //举报伪基站类型索引

@property (nonatomic, copy) NSString *reportStoreTypeStr;           //举报实体店或者网店字符串

@property (nonatomic, assign) NSInteger reportStoreType;           //举报实体店或者网店索引

@property (nonatomic, assign) ReportDataType reportType;    //举报类型

@end
