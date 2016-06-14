//
//  ReportDataModel.h
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGModel.h"


typedef NS_ENUM(NSInteger, ReportDataType){
    ReportCrankCall = 0,        //举报骚扰电话
    ReportScamCall,         //举报诈骗电话
    ReportMessage,          //举报短信
    ReportWIFI,             //举报WIFI
    ReportWebsite,          //举报网站
    ReportApp,              //举报APP
    ReportFakeBaseStation,  //举报伪基站
};

@interface ReportDataModel : TGModel

@property (nonatomic, copy) NSString *reportPhoneNumber;    //举报电话

@property (nonatomic, copy) NSString *reportContent;        //举报内容

@property (nonatomic, copy) NSString *reportAdress;         //举报地址

@property (nonatomic, copy) NSString *reportTime;           //举报时间

@property (nonatomic, copy) NSString *reportTimeLength;     //举报时长

@property (nonatomic, copy) NSString *reportAppSource;       //举报App来源

@property (nonatomic, copy) NSString *reportName;           //举报名称 (App, WIFI, 伪基站)


@property (nonatomic, copy) NSString *reportCrankCallType;     //举报骚扰电话类型

@property (nonatomic, copy) NSString *reportCrankCallStatus;    //举报骚扰电话形式

@property (nonatomic, assign) ReportDataType reportType;    //举报类型

@end
