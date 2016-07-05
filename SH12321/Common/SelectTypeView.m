//
//  SelectTypeView.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectTypeView.h"

#define viewH    35
#define imageWH  15

#define btnTag 223333


@implementation SelectTypeView{
    NSArray *titlesArr;
    NSString *selectTitleStr;
    NSInteger selectTitleIndex;
}

+ (SelectTypeView *)initWithY:(CGFloat)y superView:(UIView *)superView{
    SelectTypeView *view = [[SelectTypeView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, viewH)];
    [superView addSubview:view];
    return view;
}

- (void)addTitles:(NSArray *)titles{
    self.height = titles.count * viewH;
    titlesArr = titles;
    CGFloat labelX = L_R_EDGE;
    CGFloat labelY = 0;
    CGFloat btnX = DEVICE_W - L_R_EDGE - imageWH;
    CGFloat btnY = (viewH - imageWH)/2;
    for (NSInteger i=0; i < titles.count; i ++) {
        NSString *title = [titles objectAtIndex:i];
        TGLabel *label = [TGLabel initWithFrame:CGRectMake(labelX, labelY, 100, viewH - 1) text:title textColor:C_BLACK textFont:FONTSIZE10 textAlignment:NSTextAlignmentLeft superView:self];
        label.numberOfLines = 1;
        
        TGView *line = [TGView initWithFrame:CGRectMake(0, label.y + label.height, DEVICE_W, 1) superView:self];
        line.backgroundColor = C_LINE;
        
        TGButton *btn = [TGButton initWithFrame:CGRectMake(btnX, btnY, imageWH, imageWH) superView:self];
        [btn setImage:[UIImage imageNamed:selectNormalIconImageStr] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selectSelectedIconImageStr] forState:UIControlStateSelected];
        btn.tag = btnTag + i;
        [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        labelY += viewH;
        btnY += viewH;
    }
}

- (void)btnDidClick:(TGButton *)btn{
//    if (!EMPTY_STRING(selectTitleStr))
    
    for (int i = 0; i < btn.superview.subviews.count; i++) {
        UIView *view = btn.superview.subviews[i];
        if (view.tag >= btnTag ) {
            TGButton *b = (TGButton *)view;
            b.selected = NO;
        }
    }
    
    selectTitleIndex = btn.tag - btnTag;
    selectTitleStr = [titlesArr objectAtIndex:selectTitleIndex];
    btn.selected = YES;
    
    if ([self.delegate respondsToSelector:@selector(selectTypeStr:)]) {
        [self.delegate selectTypeStr:selectTitleStr];
    }
    
}
- (NSInteger)getSelectIndex{
    return selectTitleIndex;
}

- (NSString *)getSelectTypeStr{
    return selectTitleStr;
}

@end
