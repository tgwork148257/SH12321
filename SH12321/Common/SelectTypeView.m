//
//  SelectTypeView.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectTypeView.h"

#define viewH    36
#define imageWH  24

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
        TGLabel *label = [TGLabel initWithFrame:CGRectMake(labelX, labelY, 100, viewH) text:title textColor:C_BLACK textFont:FONTSIZE10 textAlignment:NSTextAlignmentLeft superView:self];
        label.numberOfLines = 1;
        
        TGButton *btn = [TGButton initWithFrame:CGRectMake(btnX, btnY, imageWH, imageWH) superView:self];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        btn.tag = btnTag + i;
        btn.backgroundColor = C_RED;
        [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        labelY += viewH;
        btnY += viewH;
    }
}

- (void)btnDidClick:(TGButton *)btn{
    if (!EMPTY_STRING(selectTitleStr)) {
        for (UIView *view in btn.superview.subviews) {
            if (view.tag >= btnTag) {
                TGButton *btn = (TGButton *)view;
                btn.selected = NO;
            }
        }
    }
    
    selectTitleIndex = btn.tag - btnTag;
    selectTitleStr = [titlesArr objectAtIndex:selectTitleIndex];
    btn.selected = YES;
    
}
- (NSInteger)getSelectIndex{
    return selectTitleIndex;
}

- (NSString *)getSelectTypeStr{
    return selectTitleStr;
}

@end
