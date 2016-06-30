//
//  SelectTimeView.m
//  SH12321
//
//  Created by Tommy on 6/22/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SelectTimeView.h"

#define topViewH  36

#define btnW 72
#define btnH topViewH

@interface SelectTimeView () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation SelectTimeView{
    UIView *topView;
    TGButton *cancelBtn;
    TGButton *confirmBtn;
    
    UIPickerView *timePickView;
    
    NSMutableArray *yearDataArr;
    NSMutableArray *monthDataArr;
    NSMutableArray *dayDataArr;
    NSMutableArray *timeDataArr;
    
    NSString *selectedYear;
    NSString *selectedMonth;
    NSString *selectedDay;
    NSString *selectedTime;
    
    NSInteger currentYear;
    NSInteger currentMonth;
    NSInteger currentDay;
    NSInteger currentTime;
}

+ (SelectTimeView *)initWithY:(CGFloat)y superView:(UIView *)superView{
    SelectTimeView *view = [[SelectTimeView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, selectTimeViewH)];
    view.backgroundColor = C_WHITE;
    [superView addSubview:view];
    return view;
}

- (void)addSubviews{
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, topViewH)];
    [self addSubview:topView];
    cancelBtn = [TGButton initTitleBtnWithFrame:CGRectMake(L_R_EDGE, 0, btnW, btnH) title:@"取消" titleColor:C_RED titleFont:FONTSIZE12 backgroundColor:C_WHITE superView:topView];
    [cancelBtn addTarget:self action:@selector(cancelBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    confirmBtn = [TGButton initTitleBtnWithFrame:CGRectMake(DEVICE_W - L_R_EDGE - btnW, 0, btnW, btnH) title:@"确定" titleColor:C_BLUE titleFont:FONTSIZE12 backgroundColor:C_WHITE superView:topView];
    [confirmBtn addTarget:self action:@selector(confirmBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    currentTime = 0;
    currentDay = [TGUtils currentDayWithDate:[NSDate date]];
    currentMonth = [TGUtils currentMonthWithDate:[NSDate date]];
    currentYear = [TGUtils currentYearWithDate:[NSDate date]];
    
    
    selectedYear = IntegerToStr([TGUtils currentYearWithDate:[NSDate date]]);
    selectedMonth = [TGUtils dayOrMonthConvertToStr:[TGUtils currentMonthWithDate:[NSDate date]]];
    selectedDay = [TGUtils dayOrMonthConvertToStr:[TGUtils currentDayWithDate:[NSDate date]]];
    selectedTime = @"0时-1时";
    
    [self initArr];
    
    timePickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, topView.y + topView.height, DEVICE_W, selectTimeViewH - topViewH)];
    timePickView.delegate = self;
    timePickView.dataSource = self;
    [self addSubview:timePickView];
    
    
    [timePickView selectRow:(currentYear - 2000 - 1) inComponent:0 animated:NO];
    [timePickView selectRow:(currentMonth - 1) inComponent:1 animated:NO];
    [timePickView selectRow:(currentDay - 1) inComponent:2 animated:NO];
    [timePickView selectRow:0 inComponent:3 animated:NO];
}

- (void)initArr{
    yearDataArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 2000 ; i < 2050; i ++) {
        NSString *str = [NSString stringWithFormat:@"%ld",i];
        [yearDataArr addObject:str];
    }
    
    monthDataArr = [[NSMutableArray alloc] init];
    for (int i = 1 ; i < 13; i ++) {
        NSString *str;
        if (i < 10) {
            str = [@"0" stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        }else{
            str = [NSString stringWithFormat:@"%d",i];
        }
        [monthDataArr addObject:str];
    }
    
    dayDataArr = [[NSMutableArray alloc] init];
    for (int i = 1 ; i < 32; i ++) {
        NSString *str;
        if (i < 10) {
            str = [@"0" stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        }else{
            str = [NSString stringWithFormat:@"%d",i];
        }
        [dayDataArr addObject:str];
    }
    
    timeDataArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 24; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d时-%d时",i, (i+1)];
        [timeDataArr addObject:str];
    }
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return yearDataArr.count;
    }else if(component == 1){
        return monthDataArr.count;
    }else if(component == 2){
        return dayDataArr.count;
    }else if(component == 3){
        return timeDataArr.count;
    }else{
        return 0;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 0) {
        return DEVICE_W*3/10;
    }else if(component == 1){
        return DEVICE_W*2/10;
    }else if(component == 2){
        return DEVICE_W*2/10;
    }else if(component == 3){
        return DEVICE_W*3/10;
    }else{
        return 0;
    }
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return  [yearDataArr objectAtIndex:row];;
    }else if(component == 1){
        return [monthDataArr objectAtIndex:row];
    }else if(component == 2){
        return [dayDataArr objectAtIndex:row];
    }else if(component == 3){
        return [timeDataArr objectAtIndex:row];
    }else{
        return nil;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        selectedYear = [yearDataArr objectAtIndex:row];;
    }else if(component == 1){
        selectedMonth = [monthDataArr objectAtIndex:row];
    }else if(component == 2){
        selectedDay = [dayDataArr objectAtIndex:row];
    }else if(component == 3){
        selectedTime = [timeDataArr objectAtIndex:row];
    }
}


- (void)cancelBtnDidClick{
    [self removeFromSuperview];
}

- (void)confirmBtnDidClick{
//    if ([self isDateSettingCorrect]) {
        if ([self.delegate respondsToSelector:@selector(selectTimeWithYear:month:day:time:)]) {
            [self.delegate selectTimeWithYear:selectedYear month:selectedMonth day:selectedDay time:selectedTime];
            [self removeFromSuperview];;
        }
//    }else{
//        [TGToast showWithText:@"时间选择错误"];
//    }
    
}


//- (BOOL)isDateSettingCorrect{
//    BOOL isDateSettingCorrect = NO;
//    if (([selectedYear integerValue] > currentYear)) {
//        isDateSettingCorrect = YES;
//    }else if (([selectedYear integerValue] == currentYear)){
//        if ([selectedMonth integerValue] > currentMonth) {
//            isDateSettingCorrect = YES;
//        }else if ([selectedMonth integerValue] == currentMonth){
//            if ([selectedDay integerValue] >= currentDay) {
//                isDateSettingCorrect = YES;
//            }else{
//                isDateSettingCorrect = NO;
//            }
//        }else{
//            isDateSettingCorrect = NO;
//        }
//    }else{
//        isDateSettingCorrect = NO;
//    }
//    return isDateSettingCorrect;
//}

@end
