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

@property (nonatomic, copy) NSString *reportAdress;         //举报地址

@property (nonatomic, copy) NSString *reportTime;           //举报时间

@property (nonatomic, copy) NSString *reportTimeLengthStr;     //举报时长字符串

@property (nonatomic, copy) NSString *reportSendNumber;    //发送内容电话

@property (nonatomic, copy) NSString *reportTypeStr;         //(诈骗电话类型，骚扰电话类型，伪基站类型，实名制实体店或者网店类型)

@property (nonatomic, copy) NSString *reportName;           //举报名称 (App, WIFI, 伪基站,实体店或者网店名字)

@property (nonatomic, copy) NSString *reportContent;        //举报内容


@property (nonatomic, copy) NSString *reportAppSource;       //举报App来源


@property (nonatomic, copy) NSString *reportWebsiteURL;         //举报网站URL


@property (nonatomic, copy) NSString *reportCrankCallStatusStr;    //举报骚扰电话形式字符串


@property (nonatomic, copy) NSString *reportReasonTypeStr;         //违规原因类型字符串

@property (nonatomic, copy) NSString *reportOperatorsTypeStr;     //运营商类型字符串

@property (nonatomic, copy) NSString *reportBuyNumber;               //举报购买手机的手机号码

@property (nonatomic, copy) NSString *userImageStr;               //用户持卡照片

@property (nonatomic, copy) NSString *storeImageStr;               //实体店或者订单照片

@property (nonatomic, copy) NSString *buyTime;                      //购买时间


@property (nonatomic, assign) ReportDataType reportType;    //举报类型

@property (nonatomic, copy) NSString *handleResultStr;       //处理结果

@end
