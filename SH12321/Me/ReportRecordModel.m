//
//  ReportRecordModel.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportRecordModel.h"

@implementation ReportRecordModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        if (!EMPTY_DIC(dic)) {
            self.reportID = [TGJson JsonStr:[dic objectForKey:@"club_id"]];
            self.reportTime = [TGJson JsonStr:[dic objectForKey:@"club_status"]];
            self.reportType = [TGJson JsonStr:[dic objectForKey:@"join_status"]];
            self.reportStatus = [TGJson JsonStr:[dic objectForKey:@"push_status"]];
//            self.user_number = [MMJsonUtils JsonInteger:[dic objectForKey:@"user_number"]];
//            self.add_time = [MMJsonUtils JsonInteger:[dic objectForKey:@"add_time"]];
//            self.club_dsc = [MMJsonUtils JsonStr:[dic objectForKey:@"club_desc"]];
//            self.club_name = [MMJsonUtils JsonStr:[dic objectForKey:@"club_name"]];
//            self.club_header = [MMJsonUtils JsonStr:[dic objectForKey:@"club_header"]];
//            self.background = [MMJsonUtils JsonStr:[dic objectForKey:@"background"]];
//            self.my = [MMJsonUtils JsonInteger:[dic objectForKey:@"my"]];
//            self.userModel = [[MMUserModel alloc] initWithDictionary:[dic objectForKey:@"user"]];
//            self.scheduleDetailModel = [[ScheduleDetailModel alloc] initWithDictionary:[dic objectForKey:@"plan"]];
//            self.blog_number = [MMJsonUtils JsonInteger:[dic objectForKey:@"blog_number"]];
        }
    }
    return self;
}



@end
