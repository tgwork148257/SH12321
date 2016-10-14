//
//  ReportRecordCell.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportRecordCell.h"

#define labelH  35

@implementation ReportRecordCell{
    TGView *line;
    
    TGLabel *reportNumberPreLabel;
    TGLabel *reportNumberLabel;
    
    TGLabel *reportPreTypeLabel;
    TGLabel *reportTypeLabel;
    
    TGLabel *reportPreDateLabel;
    TGLabel *reportDateLabel;
    
    TGLabel *reportPreResultLabel;
    TGLabel *reportResultLabel;
    
    UIImageView *icon;
}

- (void)buildCell{
    line = [TGView initWithFrame:CGRectMake(0, 0, DEVICE_W, 1) backgroundColor:C_LINE superView:self.contentView];

    CGFloat preLabelW = 72;
    CGFloat iconWH = 15;
    CGFloat labelW = MIDDLE_W - preLabelW - iconWH;
    reportNumberPreLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, preLabelW, labelH) text:@"举报编号: " textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    reportNumberLabel = [TGLabel initWithFrame:CGRectMake(reportNumberPreLabel.x + reportNumberPreLabel.width, reportNumberPreLabel.y, labelW, labelH) text:self.model.listReportID textColor:redTextColor textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    
    reportPreTypeLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, reportNumberPreLabel.y + reportNumberPreLabel.height, preLabelW, labelH) text:@"举报类别: " textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    reportTypeLabel = [TGLabel initWithFrame:CGRectMake(reportPreTypeLabel.x + reportPreTypeLabel.width, reportPreTypeLabel.y, labelW, labelH) text:self.model.listReportTypeStr textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    
    reportPreDateLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, reportPreTypeLabel.y + reportPreTypeLabel.height, preLabelW, labelH) text:@"举报日期: " textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    reportDateLabel = [TGLabel initWithFrame:CGRectMake(reportPreDateLabel.x + reportPreDateLabel.width, reportPreDateLabel.y, labelW, labelH) text:[self.model.listReportTime substringToIndex:11] textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    
    reportPreResultLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, reportDateLabel.y + reportDateLabel.height, preLabelW, labelH) text:@"处理结果: " textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    reportResultLabel = [TGLabel initWithFrame:CGRectMake(reportPreResultLabel.x + reportPreResultLabel.width, reportPreResultLabel.y, labelW, labelH) text:self.model.reportProcessResult textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:self.contentView];
    
    icon = [[UIImageView alloc] initWithFrame:CGRectMake(reportNumberLabel.x + reportNumberLabel.width, labelH + (labelH - iconWH)/2, iconWH, iconWH)];
    icon.image = [UIImage imageNamed:nextIconImageStr];
}

+ (CGFloat)cellHeight{
    return labelH * 4;
}

@end
