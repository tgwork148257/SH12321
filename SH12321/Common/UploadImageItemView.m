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
#define iconH viewH

#define itemLabelTag    443434
#define imageViewTag    443435
#define iconTag         443436

@implementation UploadImageItemView

+ (UploadImageItemView *)initWithY:(CGFloat)y title:(NSString *)title superView:(UIView *)superView{
    UploadImageItemView *view = [[UploadImageItemView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W - imageViewW - iconW, viewH) text:title textColor:C_BLACK textFont:FONTSIZE12 textAlignment:NSTextAlignmentLeft superView:view];
    label.tag = itemLabelTag;
    
    UIImageView *uploadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(label.x + label.width, 0, imageViewW, imageViewH)];
    label.tag = imageViewTag;
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(uploadImageView.x + uploadImageView.width, 0, iconW, iconH)];
    icon.backgroundColor = C_RED;
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

@end
