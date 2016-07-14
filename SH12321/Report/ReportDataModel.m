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
        self.reportID = [TGJson JsonStr:[dic objectForKey:reportIDKey]];
        self.reportAcceptNumber = [TGJson JsonStr:[dic objectForKey:acceptNumberKey]];
        self.reportSendNumber = [TGJson JsonStr:[dic objectForKey:sendNumberKey]];
        self.reportTime = [TGJson JsonStr:[dic objectForKey:callTimeKey]];
        self.reportTimeLengthStr = [TGJson JsonStr:[dic objectForKey:callLengthKey]];
        self.reportName = [TGJson JsonStr:[dic objectForKey:nameKey]];
        self.reportContent = [TGJson JsonStr:[dic objectForKey:contentKey]];
        self.reportTypeStr = [TGJson JsonStr:[dic objectForKey:reportTypeKey]];
        self.typeStr = [TGJson JsonStr:[dic objectForKey:typeKey]];

        self.reportCrankCallStatusStr = [TGJson JsonStr:[dic objectForKey:crankCallStatusKey]];
        self.reportWebsiteURL = [TGJson JsonStr:[dic objectForKey:websiteURLKey]];
        self.reportAppSource = [TGJson JsonStr:[dic objectForKey:AppSourceKey]];
        self.reportBuyNumber = [TGJson JsonStr:[dic objectForKey:buyNumberKey]];
        self.buyTime = [TGJson JsonStr:[dic objectForKey:buyTimeKey]];
        self.reportOperatorsTypeStr = [TGJson JsonStr:[dic objectForKey:operatorKey]];
        self.storeImageStr = [TGJson JsonStr:[dic objectForKey:storeImagerKey]];
        self.userImageStr = [TGJson JsonStr:[dic objectForKey:userImagerKey]];
        self.reportReasonTypeStr = [TGJson JsonStr:[dic objectForKey:reasonKey]];

        
    }
    return self;
}

@end
