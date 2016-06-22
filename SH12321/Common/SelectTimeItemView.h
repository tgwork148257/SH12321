//
//  SelectTimeItemView.h
//  SH12321
//
//  Created by Tommy on 6/22/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTimeItemView : UIView

+ (SelectTimeItemView *)initWithY:(CGFloat)y superView:(UIView *)superView;

- (void)addTimeStr:(NSString *)timeStr;

- (NSString *)timeStr;

@end
