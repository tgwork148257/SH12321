//
//  ReportItemTextView.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportItemTextView.h"

#define placeholderLabelH 24.0F

@implementation ReportItemTextView

+ (ReportItemTextView *)initWithY:(CGFloat)y placeholder:(NSString *)placeholder superView:(UIView *)superView{
    ReportItemTextView *tv = [[ReportItemTextView alloc] initWithFrame:CGRectMake(L_R_EDGE - 4, y, MIDDLE_W, reportItemTextViewH)];
    tv.textColor = C_INPUT;
    tv.backgroundColor = C_WHITE;
    tv.font = FONTSIZE15;
    tv.textAlignment = NSTextAlignmentLeft;
    TGLabel *placeholderLabel = [TGLabel initWithFrame:CGRectMake(4, 3, MIDDLE_W, placeholderLabelH) text:placeholder textColor:C_INPUT textFont:F_TEXT textAlignment:NSTextAlignmentLeft superView:tv];
    placeholderLabel.tag = placeholderLabelTag;
    [superView addSubview:tv];
    
    
    return tv;
}

@end
