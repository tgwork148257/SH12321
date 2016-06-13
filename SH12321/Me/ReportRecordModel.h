//
//  ReportRecordModel.h
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGModel.h"

@interface ReportRecordModel : TGModel

@property (nonatomic, copy) NSString *reportID; //举报ID

@property (nonatomic, copy) NSString *reportTime; //举报时间

@property (nonatomic, copy) NSString *reportStatus; //举报进度状态

@property (nonatomic, copy) NSString *reportType; //举报类型

@end
