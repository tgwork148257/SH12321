//
//  ReportItemLabel.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGLabel.h"

@interface ReportItemLabel : TGLabel

+ (ReportItemLabel *)initWithY:(CGFloat)y title:(NSString *)title superView:(UIView *)superView;

- (void)addText:(NSString *)text;

@end
