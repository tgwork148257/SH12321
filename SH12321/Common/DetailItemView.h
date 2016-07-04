//
//  DetailItemView.h
//  SH12321
//
//  Created by Tommy on 7/4/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGView.h"

@interface DetailItemView : TGView

+ (DetailItemView *)initWithY:(CGFloat)y title:(NSString *)title content:(NSString *)content superView:(UIView *)superView;

@end
