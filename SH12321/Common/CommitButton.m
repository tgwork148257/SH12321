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
   return [self initWithY:y title:@"提交" superView:superView];
}

+ (CommitButton *)initWithY:(CGFloat)y title:(NSString *)title superView:(UIView *)superView{
    CommitButton *btn = [CommitButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((DEVICE_W - btnW)/2, y, btnW, btnH);
    btn.backgroundColor = commitBtnBgColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:C_WHITE forState:UIControlStateNormal];
    btn.titleLabel.font = FONTSIZE15;
    [superView addSubview:btn];
    
    return btn;
}

@end
