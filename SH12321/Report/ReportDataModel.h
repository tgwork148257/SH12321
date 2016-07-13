//
//  ReportDataModel.h
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGModel.h"

@interface ReportDataModel : TGModel

@property (nonatomic, copy) NSString *reportAcceptNumber;    //接收内容电话

@property (nonatomic, copy) NSString *reportSendNumber;    //发送内容电话

@property (nonatomic, copy) NSString *reportContent;        //举报内容

@property (nonatomic, copy) NSString *reportAdress;         //举报地址

@property (nonatomic, copy) NSString *reportTime;           //举报时间


@property (nonatomic, copy) NSString *reportAppSource;       //举报App来源

@property (nonatomic, copy) NSString *reportName;           //举报名称 (App, WIFI, 伪基站)

@property (nonatomic, copy) NSString *reportTimeLengthStr;     //举报时长字符串


@property (nonatomic, copy) NSString *reportWebsiteURL;         //举报网站URL

@property (nonatomic, copy) NSString *reportWebsiteTypeStr;         //举报网站类型字符串


@property (nonatomic, copy) NSString *reportCrankCallTypeStr;     //举报骚扰电话类型字符串

@property (nonatomic, copy) NSString *reportCrankCallStatusStr;    //举报骚扰电话形式字符串


@property (nonatomic, copy) NSString *reportScamCallTypeStr;     //举报诈骗电话类型字符串

@property (nonatomic, copy) NSString *reportScamCallStatusStr;    //举报诈骗电话形式字符串


@property (nonatomic, copy) NSString *reportFakeBasicStationTypeStr;           //举报伪基站类型字符串


@property (nonatomic, copy) NSString *reportStoreTypeStr;           //举报实体店或者网店字符串

@property (nonatomic, copy) NSString *reportReasonTypeStr;         //违规原因类型字符串

@property (nonatomic, copy) NSString *reportOperatorsTypeStr;     //运营商类型字符串

@property (nonatomic, copy) NSString *reportNumber;               //举报手机的手机号码



@property (nonatomic, assign) ReportDataType reportType;    //举报类型

@property (nonatomic, copy) NSString *handleResultStr;       //处理结果

@end
