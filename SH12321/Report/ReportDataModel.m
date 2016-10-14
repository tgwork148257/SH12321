//
//  ReportDataModel.m
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportDataModel.h"
#import "ServiceDefine.h"

@implementation ReportDataModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super initWithDictionary:dic]) {
        self.reportAdress = [TGJson JsonStr:[dic objectForKey:addressKey]];
        self.reportAcceptNumber = [TGJson JsonStr:[dic objectForKey:acceptNumberKey]];
        self.reportSendNumber = [TGJson JsonStr:[dic objectForKey:sendNumberKey]];
        self.reportTime = [TGJson JsonStr:[dic objectForKey:callTimeKey]];
        self.reportTimeLengthStr = [TGJson JsonStr:[dic objectForKey:callLengthKey]];
        self.reportName = [TGJson JsonStr:[dic objectForKey:nameKey]];
        self.reportContent = [TGJson JsonStr:[dic objectForKey:contentKey]];
        self.reportTypeStr = [TGJson JsonStr:[dic objectForKey:reportTypeKey]];
        
        self.reportCrankCallStatusStr = [TGJson JsonStr:[dic objectForKey:crankCallStatusKey]];
        self.reportWebsiteURL = [TGJson JsonStr:[dic objectForKey:websiteURLKey]];
        self.reportAppSource = [TGJson JsonStr:[dic objectForKey:AppSourceKey]];
        self.reportBuyNumber = [TGJson JsonStr:[dic objectForKey:buyNumberKey]];
        self.buyTime = [TGJson JsonStr:[dic objectForKey:buyTimeKey]];
        self.reportOperatorsTypeStr = [TGJson JsonStr:[dic objectForKey:operatorKey]];
        self.storeImageStr = [TGJson JsonStr:[dic objectForKey:storeImageKey]];
        self.userImageStr = [TGJson JsonStr:[dic objectForKey:userImageKey]];
        self.reportReasonTypeStr = [TGJson JsonStr:[dic objectForKey:reasonKey]];
        self.storeWebsite = [TGJson JsonStr:[dic objectForKey:storeWebsiteKey]];
        self.storeSaleWebsite = [TGJson JsonStr:[dic objectForKey:storeSaleWebsiteKey]];

        self.listReportID = [TGJson JsonStr:[dic objectForKey:@"jw_id"]];
        self.listReportTime = [TGJson JsonStr:[dic objectForKey:@"report_time"]];
        self.listReportFlag = [TGJson JsonStr:[dic objectForKey:@"con_flag"]];
        self.listReportTypeStr = [TGJson JsonStr:[dic objectForKey:@"type_name"]];
        
        self.reportProcessResult = [TGJson JsonStr:[dic objectForKey:@"operator_rs"]];
        self.handleResultIndex = [[TGJson JsonStr:[dic objectForKey:@"report_time"]] integerValue];
        self.handleResult = [TGJson JsonStr:[dic objectForKey:@"report_time"]];
        self.feedback = [TGJson JsonStr:[dic objectForKey:@"feedback"]];
        self.feedbackResult = [TGJson JsonStr:[dic objectForKey:@"feedback_result"]];
        self.feedbackScore = [TGJson JsonStr:[dic objectForKey:@"feedback_score"]];
    }
    return self;
}

@end
