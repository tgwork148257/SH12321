//
//  SelectItemView.m
//  SH12321
//
//  Created by Tommy on 6/23/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectItemView.h"

#define viewH 35
#define imageViewWH 15

#define itemLabelTag    443434
#define iconTag         443435

@implementation SelectItemView

+ (SelectItemView *)initWithY:(CGFloat)y itemStr:(NSString *)itemStr superView:(UIView *)superView{
    SelectItemView *view = [[SelectItemView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W - imageViewWH, viewH) text:itemStr textColor:C_LABEL textFont:F_TITLE textAlignment:NSTextAlignmentLeft superView:view];
    label.tag = itemLabelTag;
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(label.x + label.width, (viewH - imageViewWH)/2, imageViewWH, imageViewWH)];
    if ([itemStr isEqualToString:@"选择时间"] || [itemStr isEqualToString:@"来电时间"] || [itemStr isEqualToString:@"选择区县"] || [itemStr isEqualToString:@"购卡时间"] || [itemStr isEqualToString:@"所属运营商"] || [itemStr isEqualToString:@"实体店照片"] || [itemStr isEqualToString:@"本人持卡照片"] || [itemStr isEqualToString:@"订单确认截图"] || [itemStr isEqualToString:@"违规原因"]) {
        icon.image = [UIImage imageNamed:nextIconImageStr];
    }else{
        icon.image = [UIImage imageNamed:selectNormalIconImageStr];
    }
    [view addSubview:icon];
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
