//
//  NewsHomeCell.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsHomeCell.h"

#define imageViewW 100
#define imageViewH 72
#define gap 12.0F
#define cellH 96

@implementation NewsHomeCell{
    UIImageView *imageview;
    TGLabel *titleLabel;
    TGLabel *sourceLabel;
    TGLabel *timeLabel;
    
    UIView *line;
}

- (void)buildCell{
    
    CGFloat originY = (cellH - imageViewH)/2;
    imageview = [[UIImageView alloc] initWithFrame:CGRectMake(L_R_EDGE, originY, imageViewW, imageViewH)];
    [imageview sd_setImageWithURL:[NSURL URLWithString:self.model.newsPicUrlStr]];
    [self.contentView addSubview:imageview];
    
    CGFloat titleLabelX = imageview.x + imageview.width + gap;
    CGFloat titleLabelW = DEVICE_W - titleLabelX - L_R_EDGE;
    CGFloat titleLabelH = 48;
    titleLabel = [TGLabel initWithFrame:CGRectMake(titleLabelX, originY, titleLabelW, titleLabelH) text:self.model.newsTitle textColor:C_BLACK textFont:FONTSIZE18 textAlignment:NSTextAlignmentLeft superView:self.contentView];
    titleLabel.numberOfLines = 2;
    
    
    CGFloat bottomLabelY = titleLabel.y + titleLabel.height + gap;
    CGFloat bottomLabelW = 76;
    CGFloat bottomLabelH = 16;
    sourceLabel = [TGLabel initWithFrame:CGRectMake(titleLabel.x, bottomLabelY, bottomLabelW, bottomLabelH) text:self.model.newsTime textColor:C_BLACK textFont:FONTSIZE10 textAlignment:NSTextAlignmentLeft superView:self.contentView];
    
    CGFloat timeLabelX = sourceLabel.x + sourceLabel.width + 12;
    timeLabel = [TGLabel initWithFrame:CGRectMake(timeLabelX, bottomLabelY, bottomLabelW, bottomLabelH) text:[NSString stringWithFormat:@"来源:%@",self.model.newsSource] textColor:C_BLACK textFont:FONTSIZE10 textAlignment:NSTextAlignmentRight superView:self.contentView];
    
    line = [[UIView alloc] initWithFrame:CGRectMake(0, cellH - 1, DEVICE_W, 1)];
    line.backgroundColor = C_LINE;
    [self.contentView addSubview:line];
}

+ (CGFloat)cellHeight{
    return cellH;
}

@end
