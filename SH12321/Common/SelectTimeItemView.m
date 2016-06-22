//
//  SelectTimeItemView.m
//  SH12321
//
//  Created by Tommy on 6/22/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectTimeItemView.h"

#define viewH 48
#define imageViewW 24
#define imageViewH viewH

#define timeLabelTag 443434
#define iconTag 443435

@implementation SelectTimeItemView

+ (SelectTimeItemView *)initWithY:(CGFloat)y superView:(UIView *)superView{
    SelectTimeItemView *view = [[SelectTimeItemView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W - imageViewW, viewH) text:@"选择时间" textColor:C_BLACK textFont:FONTSIZE12 textAlignment:NSTextAlignmentLeft superView:view];
    label.tag = timeLabelTag;
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(label.x + label.width, 0, imageViewW, imageViewH)];
    icon.image = [UIImage imageNamed:@""];
    icon.backgroundColor = C_RED;
    [superView addSubview:view];
    return view;
}

- (void)addTimeStr:(NSString *)timeStr{
    for (UIView *view in self.subviews) {
        if (view.tag == timeLabelTag) {
            TGLabel *label = (TGLabel *)view;
            label.text = timeStr;
        }
    }
}

- (NSString *)timeStr{
    for (UIView *view in self.subviews) {
        if (view.tag == timeLabelTag) {
            TGLabel *label = (TGLabel *)view;
            return label.text;
        }
    }
    return nil;
}
@end
