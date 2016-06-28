//
//  SelectTypeView.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTypeViewDelegate <NSObject>

- (void)selectTypeStr:(NSString *)str;

@end

@interface SelectTypeView : UIView

@property (nonatomic, weak) id<SelectTypeViewDelegate> delegate;

+ (SelectTypeView *)initWithY:(CGFloat)y superView:(UIView *)superView;

- (void)addTitles:(NSArray *)titles;

- (NSInteger)getSelectIndex;

- (NSString *)getSelectTypeStr;


@end
