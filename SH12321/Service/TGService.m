//
//  TGService.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGService.h"
#import "ServiceConfig.h"
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
            NSDictionary *dic = @{@"parameter1":@"A",
                                  @"parameter1":@"B",
                                  @"parameter1":@"C",
                                  @"parameter1":@"D",
                                  };
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportScamCall:
        {
            NSDictionary *dic = @{@"parameter1":@"A",
                                  @"parameter1":@"B",
                                  @"parameter1":@"C",
                                  @"parameter1":@"D",
                                  };
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportMessage:
        {
            NSDictionary *dic = @{@"parameter1":@"A",
                                  @"parameter1":@"B",
                                  @"parameter1":@"C",
                                  @"parameter1":@"D",
                                  };
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWebsite:
        {
            NSDictionary *dic = @{@"parameter1":@"A",
                                  @"parameter1":@"B",
                                  @"parameter1":@"C",
                                  @"parameter1":@"D",
                                  };
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportWIFI:
        {
            NSDictionary *dic = @{@"parameter1":@"A",
                                  @"parameter1":@"B",
                                  @"parameter1":@"C",
                                  @"parameter1":@"D",
                                  };
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportApp:
        {
            NSDictionary *dic = @{@"parameter1":@"A",
                                  @"parameter1":@"B",
                                  @"parameter1":@"C",
                                  @"parameter1":@"D",
                                  };
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
        case ReportFakeBaseStation:
        {
            NSDictionary *dic = @{@"parameter1":@"A",
                                  @"parameter1":@"B",
                                  @"parameter1":@"C",
                                  @"parameter1":@"D",
                                  };
            [TGRequest commitReportCrankCallWithUrlStr:urlStr parameters:dic success:success fail:fail];
            
        }
            break;
            
        default:
            break;
    }

}


















@end
