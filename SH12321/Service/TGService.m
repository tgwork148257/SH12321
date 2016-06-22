//
//  TGService.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGService.h"
#import "ServiceConfig.h"
#import "ServiceDefine.h"
#import "ReportDataModel.h"

@implementation TGService

+ (instancetype)sharedInstance
{
    static TGService *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc ] init];
    });
    
    return _sharedInstance;
}

- (NSString *)requestUrlStr:(NSString *)urlInterfaceName{
    NSString *urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_CRANK_CALL];
    return urlStr;
}

#pragma mark -- 举报
- (void)commitReportWithData:(ReportDataModel *)model success:(void(^)(id responseObject))success fail:(void(^)())fail{
    ReportDataType type = model.reportType;
    NSArray *interfaceArr = @[COMMIT_REPORT_CRANK_CALL, COMMIT_REPORT_SCRAM_CALL, COMMIT_REPORT_MESSAGE, COMMIT_REPORT_WEBSITE, COMMIT_REPORT_WIFI, COMMIT_REPORT_APP, COMMIT_REPORT_FAKE_BASIC_STATION];
    NSString *urlStr = [self requestUrlStr:interfaceArr[type]];
    switch (type) {
        case ReportCrankCall:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportSendNumber forKey:crankCallSendNumberKey];
            [dic setValue:model.reportAcceptNumber forKey:crankCallAcceptNumberKey];
            [dic setValue:@(model.reportType) forKey:crankCallTypeKey];
            [dic setValue:model.reportTime forKey:crankCallTimeKey];
            [dic setValue:model.reportTimeLength forKey:crankCallLengthKey];
            [dic setValue:model.reportContent forKey:crankCallContentKey];
            
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
        }
            break;
        case ReportScamCall:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportSendNumber forKey:scamCallSendNumberKey];
            [dic setValue:model.reportAcceptNumber forKey:scamCallAcceptNumberKey];
            [dic setValue:@(model.reportType) forKey:scamCallTypeKey];
            [dic setValue:model.reportTime forKey:scamCallTimeKey];
            [dic setValue:model.reportTimeLength forKey:scamCallLengthKey];
            [dic setValue:model.reportContent forKey:scamCallContentKey];
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportMessage:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportSendNumber forKey:messageSendNumberKey];
            [dic setValue:model.reportAcceptNumber forKey:messageAcceptNumberKey];
//            [dic setValue:@(model.reportType) forKey:scamCallTypeKey];
//            [dic setValue:model.reportTime forKey:scamCallTimeKey];
//            [dic setValue:model.reportTimeLength forKey:scamCallLengthKey];
            [dic setValue:model.reportContent forKey:messageContentKey];
            
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWebsite:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportWebsiteURL forKey:websiteURLKey];
            [dic setValue:model.reportWebsiteType forKey:websiteTypeKey];
            [dic setValue:model.reportContent forKey:websiteContentKey];

            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWIFI:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportName forKey:WIFINameKey];
            [dic setValue:model.reportAdress forKey:WIFIAdressKey];
//          [dic setValue:model.reportContent forKey:AppContentKey];
            
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportApp:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportName forKey:AppNameKey];
            [dic setValue:model.reportAppSource forKey:AppSourceKey];
            [dic setValue:model.reportContent forKey:AppContentKey];
            
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportFakeBaseStation:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportFakeBasicStationType forKey:fakeBasicStationTypeKey];
            [dic setValue:model.reportAdress forKey:fakeBasicStationAdressKey];
            [dic setValue:model.reportContent forKey:fakeBasicStationContentKey];
            
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
            
        default:
            break;
    }

}


















@end
