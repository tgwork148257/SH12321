//
//  MeItemView.m
//  SH12321
//
//  Created by Tommy on 7/4/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "MeItemView.h"

#define viewH  35
#define iconWH 15


@implementation MeItemView

+ (MeItemView *)initWithY:(CGFloat)y itemStr:(NSString *)itemStr superView:(UIView *)superView{
    MeItemView *view = [[MeItemView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    [superView addSubview:view];
    
    TGView *line = [TGView initWithFrame:CGRectMake(0, viewH -1, DEVICE_W, 1) superView:view];
    line.backgroundColor = C_LINE;
    
    UIImageView *leftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(L_R_EDGE, (viewH - iconWH)/2, iconWH, iconWH)];
    [view addSubview:leftIcon];
    
    CGFloat labelW = (MIDDLE_W - iconWH - L_R_EDGE)/2;
    CGFloat leftLabelW = labelW - 20;
    TGLabel *leftLabel = [TGLabel initWithFrame:CGRectMake(leftIcon.x + leftIcon.width + L_R_EDGE, 0, leftLabelW, viewH) text:itemStr textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:view];
    leftLabel.numberOfLines = 1;
    
    CGFloat rightLabelW = labelW + 20;
    TGLabel *rightLabel = [TGLabel initWithFrame:CGRectMake(leftLabel.x + leftLabel.width, 0, rightLabelW, viewH) text:@"" textColor:C_INPUT textFont:F_TITLE textAlignment:NSTextAlignmentRight superView:view];
    
    
    NSString *leftIconStr;
    NSString *rightLabelStr;
    if ([itemStr isEqualToString:@"我的举报"]) {
        UIImageView *rightIcon = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICE_W - L_R_EDGE - iconWH, (viewH - iconWH)/2, iconWH, iconWH)];
        rightIcon.image = [UIImage imageNamed:@"next_icon"];
        [view addSubview:rightIcon];
        
        leftIconStr = @"me_report_record";
    }else if([itemStr isEqualToString:@"官方微信"]){
        
        rightLabelStr = @"上海12321举报中心";
        leftIconStr = @"official_wechat";
    }else if([itemStr isEqualToString:@"官方网站"]){
        
        rightLabelStr = @"www.sh12321.com";
        leftIconStr = @"official_website";
    }else if([itemStr isEqualToString:@"举报电话"]){
        
        rightLabelStr = @"021-12321";
        leftIconStr = @"official_phone";
    }else if([itemStr isEqualToString:@"投诉建议"]){
        
        rightLabelStr = @"021-64031915";
        leftIconStr = @"official_phone";
    }else if([itemStr isEqualToString:@"版本信息"]){
        NSString *currentVersionStr = [TGUtils getVersion];
        rightLabelStr = currentVersionStr;
        leftIconStr = @"me_version";
    }
    
    rightLabel.text = rightLabelStr;
    leftIcon.image = [UIImage imageNamed:leftIconStr];
    return view;
}

@end
