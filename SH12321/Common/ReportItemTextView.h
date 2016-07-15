//
//  ReportItemTextView.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

#define placeholderLabelTag 9887

@interface ReportItemTextView : UITextView 

+ (ReportItemTextView *)initWithY:(CGFloat)y placeholder:(NSString *)placeholder superView:(UIView *)superView;


@property (nonatomic, strong)TGLabel *placeholderLabel;
@end
