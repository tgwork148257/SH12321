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
        self.reportAcceptNumber = [TGJson JsonStr:[dic objectForKey:acceptNumberKey]];
        self.reportSendNumber = [TGJson JsonStr:[dic objectForKey:sendNumberKey]];
        self.reportTime = [TGJson JsonStr:[dic objectForKey:callTimeKey]];
        self.reportTimeLengthStr = [TGJson JsonStr:[dic objectForKey:callLengthKey]];
        self.reportName = [TGJson JsonStr:[dic objectForKey:nameKey]];
        self.reportContent = [TGJson JsonStr:[dic objectForKey:contentKey]];
        self.reportTypeStr = [TGJson JsonStr:[dic objectForKey:typeKey]];
//
//        
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
//        self.reportName = [TGJson strForKey:AppNameKey];
        
    }
    return self;
}

@end
