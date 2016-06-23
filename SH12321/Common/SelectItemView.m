//
//  SelectItemView.m
//  SH12321
//
//  Created by Tommy on 6/23/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectItemView.h"

#define viewH 48
#define imageViewW 24
#define imageViewH viewH

#define itemLabelTag    443434
#define iconTag         443435

@implementation SelectItemView

+ (SelectItemView *)initWithY:(CGFloat)y itemStr:(NSString *)itemStr superView:(UIView *)superView{
    SelectItemView *view = [[SelectItemView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W - imageViewW, viewH) text:itemStr textColor:C_BLACK textFont:FONTSIZE12 textAlignment:NSTextAlignmentLeft superView:view];
    label.tag = itemLabelTag;
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(label.x + label.width, 0, imageViewW, imageViewH)];
    if ([itemStr isEqualToString:@"选择时间"]) {
        icon.image = [UIImage imageNamed:@""];
    }else{
        icon.image = [UIImage imageNamed:@""];
    }
    
    icon.backgroundColor = C_RED;
    [superView addSubview:view];
    return view;
}


- (void)addItemStr:(NSString *)itemStr{
    for (UIView *view in self.subviews) {
        if (view.tag == itemLabelTag) {
            TGLabel *label = (TGLabel *)view;
            label.text = itemStr;
        }
    }
}

- (NSString *)itemStr{
    for (UIView *view in self.subviews) {
        if (view.tag == itemLabelTag) {
            TGLabel *label = (TGLabel *)view;
            return label.text;
        }
    }
    return nil;
}

@end
