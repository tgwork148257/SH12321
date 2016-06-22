//
//  SelectTimeView.h
//  SH12321
//
//  Created by Tommy on 6/22/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTimeViewDelegate <NSObject>

- (void)selectTimeWithYear:(NSString *)yaer month:(NSString *)month day:(NSString *)day time:(NSString *)time;

@end

@interface SelectTimeView : UIView

@property(nonatomic, weak) id<SelectTimeViewDelegate> delegate;

+ (SelectTimeView *)initWithY:(CGFloat)y superView:(UIView *)superView;

- (void)addSubviews;

@end
