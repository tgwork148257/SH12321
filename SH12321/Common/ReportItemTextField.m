//
//  ReportItemTextField.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportItemTextField.h"

@implementation ReportItemTextField

+ (ReportItemTextField *)initWithY:(CGFloat)y placeholder:(NSString *)placeholder superView:(UIView *)superView{
    ReportItemTextField *tf = [[ReportItemTextField alloc] initWithFrame:CGRectMake(L_R_EDGE, y, MIDDLE_W, reportItemTextFieldH)];
    tf.textColor = C_INPUT;
    tf.backgroundColor = C_WHITE;
    tf.font = FONTSIZE13;
    tf.textAlignment = NSTextAlignmentLeft;
    tf.placeholder = placeholder;
    [superView addSubview:tf];
    
    return tf;
}

@end
