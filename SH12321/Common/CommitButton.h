//
//  CommitButton.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGButton.h"

@interface CommitButton : TGButton

+ (CommitButton *)initWithY:(CGFloat)y superView:(UIView *)superView;

+ (CommitButton *)initWithY:(CGFloat)y title:(NSString *)title superView:(UIView *)superView;

@end
