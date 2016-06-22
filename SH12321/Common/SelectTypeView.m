//
//  SelectTypeView.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectTypeView.h"

#define viewH    24
#define imageWH  16

#define btnTag 223333

@implementation SelectTypeView{
    NSArray *titlesArr;
    NSString *selectTitleStr;
    NSInteger selectTitleIndex;
}

- (void)addTitles:(NSArray *)titles y:(CGFloat)y superview:(UIView *)superview{
    [superview addSubview:self];
    self.frame = CGRectMake(0, y, DEVICE_W, titles.count * viewH);
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
        [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        labelY += viewH;
        btnY += viewH;
    }
}

- (void)btnDidClick:(TGButton *)btn{
    if (!EMPTY_STRING(selectTitleStr)) {
        for (TGButton *btn in btn.superview.subviews) {
            btn.selected = NO;
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
