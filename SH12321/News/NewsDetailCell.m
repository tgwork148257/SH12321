//
//  NewsDetailCell.m
//  SH12321
//
//  Created by Tommy on 7/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsDetailCell.h"

@implementation NewsDetailCell{
    TGLabel *textLabel;
    UIImageView *imageView;
}

- (void)buildCell{
    if ([self.model.type isEqualToString:@"1"]) {
        CGRect rect = [TGManager rectWithString:self.model.text attrDic:@{NSFontAttributeName: FONTSIZE14}];
        textLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W, rect.size.height) text:self.model.text textColor:C_BLACK textFont:FONTSIZE14 textAlignment:NSTextAlignmentLeft superView:self.contentView];
        textLabel.numberOfLines = 0;
    }else{
        CGFloat width = self.model.width;
        CGFloat height = self.model.height;
        if (self.model.width > MIDDLE_W) {
            width = MIDDLE_W;
            height = MIDDLE_W/self.model.width *self.model.height;
        }
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_W - width)/2, 0, width, height)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.model.imageURL]];
        [self.contentView addSubview:imageView];
    }
}

+ (CGFloat)cellHeightWithModel:(NewsDetailCellModel *)model{
    CGFloat height = 0;
    if ([model.type isEqualToString:@"1"]) {
        CGRect rect = [TGManager rectWithString:model.text attrDic:@{NSFontAttributeName: FONTSIZE14}];
        height = rect.size.height;
    }else{
        if (model.width > MIDDLE_W) {
            height = MIDDLE_W/model.width *model.height;
        }else{
            height = model.height;
        }
    }
    return height;
}

@end
