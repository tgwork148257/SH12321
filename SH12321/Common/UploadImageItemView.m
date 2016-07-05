//
//  UploadImageItemView.m
//  SH12321
//
//  Created by Tommy on 6/28/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "UploadImageItemView.h"

#define viewH 48
#define imageViewW 48
#define imageViewH viewH

#define iconW 24
#define iconH 24
#define gap 24

#define itemLabelTag    443434
#define imageViewTag    443435
#define iconTag         443436

@implementation UploadImageItemView

+ (UploadImageItemView *)initWithY:(CGFloat)y title:(NSString *)title superView:(UIView *)superView{
    UploadImageItemView *view = [[UploadImageItemView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W - imageViewW - iconW - gap, viewH) text:title textColor:C_LABEL textFont:F_TEXT textAlignment:NSTextAlignmentLeft superView:view];
    label.tag = itemLabelTag;
    
    UIImageView *uploadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(label.x + label.width, 0, imageViewW, imageViewH)];
    uploadImageView.tag = imageViewTag;
    [view addSubview:uploadImageView];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(uploadImageView.x + uploadImageView.width + gap, (viewH - iconH)/2, iconW, iconH)];
    [view addSubview:icon];
    
    [superView addSubview:view];
    return view;
}

- (void)addImageView:(UIImage *)image{
    for (UIView *view in self.subviews) {
        if (view.tag == imageViewTag) {
            UIImageView *imageView = (UIImageView *)view;
            imageView.image = image;
        }
    }
}

- (void)addTitle:(NSString *)title{
    for (UIView *view in self.subviews) {
        if (view.tag == itemLabelTag) {
            TGLabel *label = (TGLabel *)view;
            label.text = title;
        }
    }
}

@end
