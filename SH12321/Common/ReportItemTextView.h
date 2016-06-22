//
//  ReportItemTextView.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportItemTextView : UITextView

@property (nonatomic, strong) UILabel *placeholderLabel;

+ (ReportItemTextView *)initWithY:(CGFloat)y placeholder:(NSString *)placeholder superView:(UIView *)superView;

@end
