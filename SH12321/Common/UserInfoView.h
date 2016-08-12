//
//  UserInfoView.h
//  SH12321
//
//  Created by Tommy on 8/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGView.h"

@interface UserInfoView : TGView

+ (UserInfoView *)initY:(CGFloat) y preLabelTitle:(NSString *)title placeholder:(NSString *)placeholder superView:(UIView *)superView;

- (void)addTextFieldTitle:(NSString *)str;

- (BOOL)resignFirstResponder;

- (NSString *)textFieldTitle;


@end
