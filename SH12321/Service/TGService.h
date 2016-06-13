//
//  TGService.h
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReportDataModel;
@interface TGService : NSObject

+ (instancetype)sharedInstance;


- (void)commitReportWithData:(ReportDataModel *)model success:(void(^)(id responseObject))success fail:(void(^)())fail;

@end
