//
//  SelectTypeView.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTypeView : UIView

+ (SelectTypeView *)initWithY:(CGFloat)y superView:(UIView *)superView;

- (void)addTitles:(NSArray *)titles;

@end
