//
//  NewsDetailCellModel.m
//  SH12321
//
//  Created by Tommy on 7/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsDetailCellModel.h"

@implementation NewsDetailCellModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        if (!EMPTY_DIC(dic)) {
            self.type = [TGJson JsonStr:[dic objectForKey:@"type"]];
            self.text = [TGJson JsonStr:[dic objectForKey:@"text"]];
            self.imageURL = [TGJson JsonStr:[dic objectForKey:@"imageURL"]];
            self.width = [[TGJson JsonStr:[dic objectForKey:@"width"]] integerValue];
            self.height = [[TGJson JsonStr:[dic objectForKey:@"height"]] integerValue];
        }
    }
    return self;
}

@end
