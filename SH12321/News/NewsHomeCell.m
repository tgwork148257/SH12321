//
//  NewsHomeCell.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsHomeCell.h"

@implementation NewsHomeCell{
    UIImageView *imageview;
    TGLabel *textLabel;
    TGLabel *sourceLabel;
    TGLabel *timeLabel;
}

- (void)buildCell{
    imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, 50)];
    imageview.backgroundColor = C_RED;
    [self.contentView addSubview:imageview];
}

+ (CGFloat)cellHeight{
    return 0;
}

@end
