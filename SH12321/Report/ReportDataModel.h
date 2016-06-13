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

@property (nonatomic, copy) NSString *reportID; //举报ID

@property (nonatomic, copy) NSString *reportTime; //举报时间

@property (nonatomic, copy) NSString *reportStatus; //举报进度状态

@property (nonatomic, assign) ReportDataType reportType;  //举报类型

@end
