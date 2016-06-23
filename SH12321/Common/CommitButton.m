//
//  CommitButton.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "CommitButton.h"

#define btnH 32.F
#define btnW 100.F

@implementation CommitButton
+ (CommitButton *)initWithY:(CGFloat)y superView:(UIView *)superView{
    CommitButton *btn = [CommitButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((DEVICE_W - btnW)/2, y, btnW, btnH);
    btn.backgroundColor = commitBtnBgColor;
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:C_WHITE forState:UIControlStateNormal];
    btn.titleLabel.font = FONTSIZE14;
    [superView addSubview:btn];
    
    return btn;
}

@end
