//
//  SelectTypeView.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectTypeView.h"

#define viewH    24
#define imageWH  16

@implementation SelectTypeView

+ (SelectTypeView *)initY:(CGFloat)Y titles:(NSArray *)titles superview:(UIView *)superview{
    SelectTypeView *view = [[SelectTypeView alloc] initWithFrame:CGRectMake(0, Y, DEVICE_W, viewH * titles.count)];
    
    CGFloat labelX = L_R_EDGE;
    CGFloat labelY = 0;
    CGFloat btnX = DEVICE_W - L_R_EDGE - imageWH;
    CGFloat btnY = (viewH - imageWH)/2;
    for (NSInteger i=0; i < titles.count; i ++) {
        NSString *title = [titles objectAtIndex:i];
        TGLabel *label = [TGLabel initWithFrame:CGRectMake(labelX, labelY, 100, viewH) text:title textColor:C_BLACK textFont:FONTSIZE10 textAlignment:NSTextAlignmentLeft superView:view];
        label.numberOfLines = 1;
        
        TGButton *btn = [TGButton initWithFrame:CGRectMake(btnX, btnY, imageWH, imageWH) superView:view];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        
        labelY += viewH;
        btnY += viewH;
        
    }
    
    return view;
}

@end
