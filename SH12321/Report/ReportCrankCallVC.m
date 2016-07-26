//
//  ReportCrankCallVC.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportCrankCallVC.h"

@interface ReportCrankCallVC () <SelectTimeViewDelegate, UITextViewDelegate, SelectTypeViewDelegate>

@end

@implementation ReportCrankCallVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    ReportItemLabel *reportSendNumberLabel;
    ReportItemTextField *reportSendNumberTextField;
    
    ReportItemLabel *reportAcceptNumberLabel;
    ReportItemTextField *reportAcceptNumberTextField;
    
    ReportItemLabel *reportCrankFormLabel;
    SelectTypeView *reportCrankFormView;
    
    ReportItemLabel *reportCrankTypeLabel;
    SelectTypeView *reportCrankTypeView;
    
    ReportItemLabel *reportTimeLengthLabel;
    SelectTypeView *reportTimeLengthView;
    
    SelectItemView *selectTimeItemView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
    
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报骚扰电话";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    

    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    [scrollView addSubview:reportView];
    
    reportSendNumberLabel = [ReportItemLabel initWithY:0 title:@"骚扰电话" superView:reportView];
    reportSendNumberTextField = [ReportItemTextField initWithY:reportSendNumberLabel.y + reportSendNumberLabel.height placeholder:phoneNumberPlaceholder superView:reportView];
    
    reportAcceptNumberLabel = [ReportItemLabel initWithY:reportSendNumberTextField.y + reportSendNumberTextField.height title:@"被骚扰电话" superView:reportView];
    reportAcceptNumberTextField = [ReportItemTextField initWithY:reportAcceptNumberLabel.y + reportAcceptNumberLabel.height placeholder:phoneNumberPlaceholder superView:reportView];
    
    reportCrankFormLabel = [ReportItemLabel initWithY:reportAcceptNumberTextField.y + reportAcceptNumberTextField.height title:@"骚扰形式" superView:reportView];
    reportCrankFormView = [SelectTypeView initWithY:reportCrankFormLabel.y + reportCrankFormLabel.height superView:reportView];
    reportCrankFormView.delegate = self;
    [reportCrankFormView addTitles:crankFormArr];
    
    
    reportCrankTypeLabel = [ReportItemLabel initWithY:reportCrankFormView.y + reportCrankFormView.height title:@"骚扰类型" superView:reportView];
    reportCrankTypeView = [SelectTypeView initWithY:reportCrankTypeLabel.y + reportCrankTypeLabel.height superView:reportView];
    [reportCrankTypeView addTitles:crankTypeArr];
    
    reportTimeLengthLabel = [ReportItemLabel initWithY:reportCrankTypeView.y + reportCrankTypeView.height title:@"通话时长" superView:reportView];
    reportTimeLengthView = [SelectTypeView initWithY:reportTimeLengthLabel.y + reportTimeLengthLabel.height superView:reportView];
    [reportTimeLengthView addTitles:timeLengthArr];
    
    selectTimeItemView = [SelectItemView initWithY:reportTimeLengthView.y + reportTimeLengthView.height itemStr:@"选择时间" superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
    [selectTimeItemView addGestureRecognizer:tap];
    
    reportContentLabel = [ReportItemLabel initWithY:selectTimeItemView.y + selectTimeItemView.height title:@"骚扰内容" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请输入举报骚扰内容" superView:reportView];
    reportContentTextView.delegate = self;
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, reportContentTextView.y + reportContentTextView.height);
    
    [reportCrankFormView addTitles:crankFormArr];
    
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height + commitBtnBottomGap);
    UITapGestureRecognizer *resignTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)];
    [scrollView addGestureRecognizer:resignTap];
}

- (void)resign{
    [reportSendNumberTextField resignFirstResponder];
    [reportAcceptNumberTextField resignFirstResponder];
    [reportContentTextView resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView{
    if (!EMPTY_STRING(textView.text)) {
        for (UIView *view in textView.subviews) {
            if (view.tag == placeholderLabelTag) {
                TGLabel *placeholderLabel = (TGLabel *)view;
                placeholderLabel.hidden = YES;
            }
        }
    }else{
        for (UIView *view in textView.subviews) {
            if (view.tag == placeholderLabelTag) {
                TGLabel *placeholderLabel = (TGLabel *)view;
                placeholderLabel.hidden = NO;
            }
        }
    }
}

- (void)selectTypeStr:(NSString *)str{
    if ([str isEqualToString:[crankFormArr objectAtIndex:0]]) {
        reportCrankTypeLabel.hidden = YES;
        reportCrankTypeView.hidden = YES;
        
        reportTimeLengthLabel.hidden = YES;
        reportTimeLengthView.hidden = YES;
        
        reportContentLabel.hidden = YES;
        reportContentTextView.hidden = YES;
        
        selectTimeItemView.y = reportCrankFormView.y + reportCrankFormView.height;
        reportView.height = selectTimeItemView.y + selectTimeItemView.height;
        
    }else{
        reportCrankTypeLabel.hidden = NO;
        reportCrankTypeView.hidden = NO;
        
        reportTimeLengthLabel.hidden = NO;
        reportTimeLengthView.hidden = NO;
        
        selectTimeItemView.hidden = NO;
        
        reportContentLabel.hidden = NO;
        reportContentTextView.hidden = NO;
        
        reportView.height = reportContentTextView.y + reportContentTextView.height;
    }
    
    commitBtn.y = reportView.y + reportView.height + commitBtnTopGap;
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height + commitBtnBottomGap);
}

- (void)selectTime{
    SelectTimeView *selectTimeView = [SelectTimeView initWithY:DEVICE_H - selectTimeViewH superView:self.view];
    selectTimeView.delegate = self;
    [selectTimeView addSubviews];
}

- (void)selectTimeWithYear:(NSString *)yaer month:(NSString *)month day:(NSString *)day time:(NSString *)time{
    NSString *dateTimeStr = [NSString stringWithFormat:@"%@年%@月%@日: %@",yaer, month, day, time];
    [selectTimeItemView addItemStr:dateTimeStr];
}


- (void)commitReport{
    if (EMPTY_STRING(reportSendNumberTextField.text)) {
        [TGToast showWithText:@"请输入发送号码"];
        return;
    }
    
    if (EMPTY_STRING(reportAcceptNumberTextField.text)) {
        [TGToast showWithText:@"请输入接收号码"];
        return;
    }
    
    if (EMPTY_STRING([selectTimeItemView itemStr]) || ([[selectTimeItemView itemStr] isEqualToString:@"选择时间"]) ) {
        [TGToast showWithText:@"请填写时间"];
        return;
    }
    
    if (EMPTY_STRING(reportTimeLengthView.typeTitle) && ![[reportCrankFormView typeTitle] isEqualToString:@"响一声就挂"]) {
        [TGToast showWithText:@"请填写时长"];
        return;
    }
    
    if (EMPTY_STRING(reportContentTextView.text) && ![[reportCrankFormView typeTitle] isEqualToString:@"响一声就挂"]) {
        [TGToast showWithText:@"举报描述内容不能为空"];
        return;
    }
    
    model.reportType = ReportCrankCall;
    model.reportSendNumber = reportSendNumberTextField.text;
    model.reportAcceptNumber = reportAcceptNumberTextField.text;
    model.reportTypeStr = reportCrankTypeView.typeTitle;
    model.reportCrankCallStatusStr = reportCrankFormView.typeTitle;
    model.reportTimeLengthStr = reportTimeLengthView.typeTitle;
    model.reportTime = [selectTimeItemView itemStr];
    model.reportContent = reportContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            [TGToast showWithText:@"举报成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [TGToast showWithText:@"举报失败"];
        }
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}


@end
