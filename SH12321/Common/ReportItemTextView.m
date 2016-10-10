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
    tv.font = FONTSIZE13;
    tv.textAlignment = NSTextAlignmentLeft;
    TGLabel *placeholderLabel = [TGLabel initWithFrame:CGRectMake(4, 3, MIDDLE_W, placeholderLabelH) text:placeholder textColor:C_INPUT textFont:FONTSIZE13 textAlignment:NSTextAlignmentLeft superView:tv];
    placeholderLabel.tag = placeholderLabelTag;
    [superView addSubview:tv];
    
    if ([placeholder isEqualToString:addressPlaceholder]) {
        TGView *line = [TGView initWithFrame:CGRectMake(0, y, DEVICE_W, 1) superView:superView.superview];
        line.backgroundColor = C_LINE;
    }
    
    return tv;
}

- (void)addText:(NSString *)text{
    if (!EMPTY_STRING(text)) {
        self.text = text;
        for (UIView *view in self.subviews) {
            if (view.tag == placeholderLabelTag) {
                [view removeFromSuperview];
            }
        }
    }
}

@end
