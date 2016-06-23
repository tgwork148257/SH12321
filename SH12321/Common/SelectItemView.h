//
//  SelectItemView.h
//  SH12321
//
//  Created by Tommy on 6/23/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectItemView : UIView

+ (SelectItemView *)initWithY:(CGFloat)y itemStr:(NSString *)itemStr superView:(UIView *)superView;

- (void)addItemStr:(NSString *)itemStr;

- (NSString *)itemStr;

@end
