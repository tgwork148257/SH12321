//
//  DetailItemView.m
//  SH12321
//
//  Created by Tommy on 7/4/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "DetailItemView.h"

#define labelH 35

@implementation DetailItemView

+ (DetailItemView *)initWithY:(CGFloat)y title:(NSString *)title content:(NSString *)content superView:(UIView *)superView{
    DetailItemView *view = [[DetailItemView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, 100)];
    [superView addSubview:view];
    
    if (EMPTY_STRING(content)) {
        view.height = 0;
        return view;
    }
    TGView *line = [TGView initWithFrame:CGRectMake(0, 0, DEVICE_W, 1) superView:view];
    line.backgroundColor = C_LINE;
    
    TGLabel *titleLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, line.y + line.height, 100, labelH) text:title textColor:C_LABEL textFont:F_TEXT textAlignment:NSTextAlignmentLeft superView:view];
    CGRect contentLabelRect = CGRectMake(titleLabel.x + titleLabel.width, titleLabel.y , 100, labelH);
    
    contentLabelRect = [TGManager rectWithString:content attrDic:@{NSFontAttributeName:F_TEXT} size:contentLabelRect.size];
    if (contentLabelRect.size.height > 20) {
        
    }
    TGLabel *contentLabel = [TGLabel initWithFrame:contentLabelRect text:title textColor:C_LABEL textFont:F_TEXT textAlignment:NSTextAlignmentLeft superView:view];
    
    view.height = contentLabel.y + contentLabel.height;
    
    
    return view;
}

@end
