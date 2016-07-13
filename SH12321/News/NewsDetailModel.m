//
//  NewsDetailModel.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsDetailModel.h"

@implementation NewsDetailModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        if (!EMPTY_DIC(dic)) {
            self.newsID = [TGJson JsonStr:[dic objectForKey:@"news_id"]];
            self.newsTime = [TGJson JsonStr:[dic objectForKey:@"add_time"]];
            self.newsTitle = [TGJson JsonStr:[dic objectForKey:@"title"]];
            self.newsSource = [TGJson JsonStr:[dic objectForKey:@"source"]];
//            self.newsContent = [TGJson JsonStr:[dic objectForKey:@"push_status"]];
            self.newsPicUrlStr = [TGJson JsonStr:[dic objectForKey:@"images"]];
        }
    }
    return self;
}

@end
