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
            [dic setObject:model.reportSendNumber forKey:crankCallSendNumberKey];
            [dic setObject:model.reportAcceptNumber forKey:crankCallAcceptNumberKey];
            [dic setObject:@(model.reportType) forKey:crankCallTypeKey];
            [dic setObject:model.reportTime forKey:crankCallTimeKey];
            [dic setObject:model.reportTimeLength forKey:crankCallLengthKey];
            if (!EMPTY_STRING(model.reportContent)) {
                [dic setObject:model.reportContent forKey:crankCallContentKey];
            }
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportScamCall:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:model.reportSendNumber forKey:scamCallSendNumberKey];
            [dic setObject:model.reportAcceptNumber forKey:scamCallAcceptNumberKey];
            [dic setObject:@(model.reportType) forKey:scamCallTypeKey];
            [dic setObject:model.reportTime forKey:scamCallTimeKey];
            [dic setObject:model.reportTimeLength forKey:scamCallLengthKey];
            if (!EMPTY_STRING(model.reportContent)) {
                [dic setObject:model.reportContent forKey:scamCallContentKey];
            }
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportMessage:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:model.reportSendNumber forKey:messageSendNumberKey];
            [dic setObject:model.reportAcceptNumber forKey:messageAcceptNumberKey];
//            [dic setObject:@(model.reportType) forKey:scamCallTypeKey];
//            [dic setObject:model.reportTime forKey:scamCallTimeKey];
//            [dic setObject:model.reportTimeLength forKey:scamCallLengthKey];
            if (!EMPTY_STRING(model.reportContent)) {
                [dic setObject:model.reportContent forKey:messageContentKey];
            }
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWebsite:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:model.reportWebsiteURL forKey:websiteURLKey];
            [dic setObject:model.reportWebsiteType forKey:websiteTypeKey];
            if (!EMPTY_STRING(model.reportContent)) {
                [dic setObject:model.reportContent forKey:websiteContentKey];
            }
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWIFI:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:model.reportName forKey:WIFINameKey];
            [dic setObject:model.reportAdress forKey:WIFIAdressKey];
//            if (!EMPTY_STRING(model.reportContent)) {
//                [dic setObject:model.reportContent forKey:AppContentKey];
//            }
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportApp:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:model.reportName forKey:AppNameKey];
            [dic setObject:model.reportAppSource forKey:AppSourceKey];
            if (!EMPTY_STRING(model.reportContent)) {
                [dic setObject:model.reportContent forKey:AppContentKey];
            }
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportFakeBaseStation:
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:model.reportFakeBasicStationType forKey:fakeBasicStationTypeKey];
            [dic setObject:model.reportAdress forKey:fakeBasicStationAdressKey];
            if (!EMPTY_STRING(model.reportContent)) {
                [dic setObject:model.reportContent forKey:fakeBasicStationContentKey];
            }
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
            
        default:
            break;
    }

}


















@end
