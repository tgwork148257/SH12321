//
//  TGService.h
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ReportDataType){
    ReportCrankCall,
    ReportScamCall,
};

@interface TGService : NSObject

+ (instancetype)sharedInstance;


- (void)commitReportDataWithType:(ReportDataType)type data:(TGModel *)model;

@end
