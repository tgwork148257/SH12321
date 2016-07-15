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

#pragma mark -- 举报
- (void)commitReportWithData:(ReportDataModel *)model success:(void(^)(id responseObject))success fail:(void(^)())fail{
    ReportDataType type = model.reportType;
    NSString *urlStr;
    NSString *userToken = [TGUtils getUserToken];
    switch (type) {
        case ReportCrankCall:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_CRANK_CALL];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportSendNumber forKey:sendNumberKey];
            [dic setValue:model.reportAcceptNumber forKey:acceptNumberKey];
            [dic setValue:model.reportTypeStr forKey:reportTypeKey];
            [dic setValue:model.reportCrankCallStatusStr forKey:crankCallStatusKey];
            [dic setValue:model.reportTime forKey:callTimeKey];
            [dic setValue:model.reportTimeLengthStr forKey:callLengthKey];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
        }
            break;
        case ReportScamCall:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_SCRAM_CALL];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportSendNumber forKey:sendNumberKey];
            [dic setValue:model.reportAcceptNumber forKey:acceptNumberKey];
            [dic setValue:model.reportTypeStr forKey:reportTypeKey];
            [dic setValue:model.reportTime forKey:callTimeKey];
            [dic setValue:model.reportTimeLengthStr forKey:callLengthKey];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportScamCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
        }
            break;
        case ReportMessage:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_MESSAGE];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportSendNumber forKey:sendNumberKey];
            [dic setValue:model.reportAcceptNumber forKey:acceptNumberKey];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportMessageWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWebsite:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_WEBSITE];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportWebsiteURL forKey:websiteURLKey];
            [dic setValue:model.reportTypeStr forKey:reportTypeKey];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];

            [TGRequest commitReportWebsiteWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWIFI:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_WIFI];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportName forKey:nameKey];
            [dic setValue:model.reportAdress forKey:addressKey];
            [dic setValue:model.reportTime forKey:callTimeKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportWifiWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportEmail:
            break;
        case ReportApp:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_APP];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportName forKey:nameKey];
            [dic setValue:model.reportAppSource forKey:AppSourceKey];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportAppWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportFakeBaseStation:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_FAKE_BASIC_STATION];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportTypeStr forKey:reportTypeKey];
            [dic setValue:model.reportAdress forKey:addressKey];
            [dic setValue:model.reportTime forKey:callTimeKey];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportBaseStationWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
            
        case ReportPhoneNumberIndentification:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_PHONE_NUMBER_IDENTIFICATION];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportTypeStr forKey:reportTypeKey];
            [dic setValue:model.reportAdress forKey:addressKey];
            [dic setValue:model.reportName forKey:nameKey];
            [dic setValue:model.reportBuyNumber forKey:buyNumberKey];
            [dic setValue:model.reportTime forKey:buyTimeKey];
            [dic setValue:model.reportOperatorsTypeStr forKey:operatorKey];
            [dic setValue:model.storeImageStr forKey:storeImagerKey];
            [dic setValue:model.userImageStr forKey:userImagerKey];
            [dic setValue:model.reportReasonTypeStr forKey:reasonKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportPhoneNumberIdentificationWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportInfoReveal:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_INFO_REVEAL];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportInfoRevealWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportBadNews:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_BAD_NEWS];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportBadNewsWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportInfringment:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_FRIGMENT];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportInfrigmentWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportOthersVC:
        {
            urlStr = [BASIC_URL stringByAppendingString:COMMIT_REPORT_OTHERS];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setValue:model.reportContent forKey:contentKey];
            [dic setValue:userToken forKey:userTokenKey];
            
            [TGRequest commitReportOthersWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
            
        default:
            break;
    }

}


















@end
