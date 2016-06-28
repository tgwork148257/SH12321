//
//  UploadImageItemView.h
//  SH12321
//
//  Created by Tommy on 6/28/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGView.h"

@interface UploadImageItemView : TGView

+ (UploadImageItemView *)initWithY:(CGFloat)y title:(NSString *)title superView:(UIView *)superView;

- (void)addImageView:(UIImage *)image;


@end
