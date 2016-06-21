//
//  ReportItemTextView.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportItemTextView.h"

@implementation ReportItemTextView

+ (ReportItemTextView *)initWithY:(CGFloat)y placeholder:(NSString *)placeholder superView:(UIView *)superView{
    ReportItemTextView *tv = [[ReportItemTextView alloc] initWithFrame:CGRectMake(L_R_EDGE, y, MIDDLE_W, reportItemTextViewH)];
    tv.textColor = C_BLACK;
    tv.backgroundColor = C_WHITE;
    tv.font = FONTSIZE12;
    tv.textAlignment = NSTextAlignmentLeft;
//    tv.placeholder = placeholder;
    [superView addSubview:tv];
    
    return tv;
}

@end
