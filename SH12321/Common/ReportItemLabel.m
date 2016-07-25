//
//  ReportItemLabel.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportItemLabel.h"

@implementation ReportItemLabel

+ (ReportItemLabel *)initWithY:(CGFloat)y title:(NSString *)title superView:(UIView *)superView{
    ReportItemLabel *label = [[ReportItemLabel alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, reportItemLabelH)];
    label.backgroundColor = commitBtnBgColor;
    label.text = [NSString stringWithFormat:@"    %@",title];
    label.textColor = C_LABEL;
    label.backgroundColor = grayBgColor;
    label.font = F_TITLE;
    label.textAlignment = NSTextAlignmentLeft;
    [superView addSubview:label];
    
    return label;
}

- (void)addText:(NSString *)text{
    self.text = [NSString stringWithFormat:@"    %@",text];
}

@end
