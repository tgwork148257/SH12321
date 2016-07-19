//
//  NewsHomeCell.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsHomeCell.h"

#define imageViewW 100
#define imageViewH 64
#define gap 12.0F
#define cellH 88

@implementation NewsHomeCell{
    UIImageView *imageview;
    TGLabel *titleLabel;
    TGLabel *sourceLabel;
    TGLabel *timeLabel;
    
    UIView *line;
}

- (void)buildCell{
//    self.model.newsTitle = @"This is the news title";
//    self.model.newsSource = @"法制日报";
//    self.model.newsTime = @"2016年03月20日";
    
    CGFloat originY = (cellH - imageViewH)/2;
    imageview = [[UIImageView alloc] initWithFrame:CGRectMake(L_R_EDGE, originY, imageViewW, imageViewH)];
    imageview.backgroundColor = C_RED;
    [imageview sd_setImageWithURL:[NSURL URLWithString:self.model.newsPicUrlStr]];
    [self.contentView addSubview:imageview];
    
    CGFloat titleLabelX = imageview.x + imageview.width + gap;
    CGFloat titleLabelW = DEVICE_W - titleLabelX - L_R_EDGE;
    CGFloat titleLabelH = 36;
    titleLabel = [TGLabel initWithFrame:CGRectMake(titleLabelX, originY, titleLabelW, titleLabelH) text:self.model.newsTitle textColor:C_BLACK textFont:FONTSIZE24 textAlignment:NSTextAlignmentLeft superView:self.contentView];
    
    
    CGFloat bottomLabelY = titleLabel.y + titleLabel.height + gap;
    CGFloat bottomLabelW = 64;
    CGFloat bottomLabelH = 16;
    sourceLabel = [TGLabel initWithFrame:CGRectMake(titleLabel.x, bottomLabelY, bottomLabelW, bottomLabelH) text:self.model.newsTime textColor:C_BLACK textFont:FONTSIZE10 textAlignment:NSTextAlignmentLeft superView:self.contentView];
    
    CGFloat timeLabelX = DEVICE_W - L_R_EDGE - bottomLabelW;
    timeLabel = [TGLabel initWithFrame:CGRectMake(timeLabelX, bottomLabelY, bottomLabelW, bottomLabelH) text:[NSString stringWithFormat:@"来源:%@",self.model.newsSource] textColor:C_BLACK textFont:FONTSIZE10 textAlignment:NSTextAlignmentRight superView:self.contentView];
    
    line = [[UIView alloc] initWithFrame:CGRectMake(0, cellH - 1, DEVICE_W, 1)];
    line.backgroundColor = C_LINE;
    [self.contentView addSubview:line];
}

+ (CGFloat)cellHeight{
    return cellH;
}

@end
