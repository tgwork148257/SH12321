//
//  UserInfoView.m
//  SH12321
//
//  Created by Tommy on 8/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "UserInfoView.h"

#define viewH  48
#define itemLabelTag 33333
#define tfTag 33334

@implementation UserInfoView

+ (UserInfoView *)initY:(CGFloat) y preLabelTitle:(NSString *)title placeholder:(NSString *)placeholder superView:(UIView *)superView{
    UserInfoView *view = [[UserInfoView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W/5, viewH) text:title textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:view];
    label.tag = itemLabelTag;
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(L_R_EDGE+ MIDDLE_W/5, 0, MIDDLE_W * 4/5, viewH)];
    tf.textColor = C_INPUT;
    tf.backgroundColor = C_WHITE;
    tf.font = FONTSIZE13;
    tf.textAlignment = NSTextAlignmentLeft;
    tf.placeholder = placeholder;
    tf.tag = tfTag;
    [view addSubview:tf];
    
    [superView addSubview:view];
    return view;
}

- (void)addTextFieldTitle:(NSString *)str{
    for (UIView *view in self.subviews) {
        if (view.tag == tfTag) {
            UITextField *tf = (UITextField *)view;
            tf.text = str;
            tf.placeholder = @"";
        }
    }
}

- (BOOL)resignFirstResponder{
    for (UIView *view in self.subviews) {
        if (view.tag == tfTag) {
            UITextField *tf = (UITextField *)view;
            return [tf resignFirstResponder];
        }
    }
    return YES;
}

- (NSString *)textFieldTitle{
    for (UIView *view in self.subviews) {
        if (view.tag == tfTag) {
            UITextField *tf = (UITextField *)view;
            return tf.text;
        }
    }
    return @"";
}
@end
