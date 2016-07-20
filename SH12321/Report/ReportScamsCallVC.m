//
//  ReportScamsCallVC.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportScamsCallVC.h"

@interface ReportScamsCallVC () <SelectTimeViewDelegate, UITextViewDelegate>

@end

@implementation ReportScamsCallVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    ReportItemLabel *reportSendNumberLabel;
    ReportItemTextField *reportSendNumberTextField;
    
    ReportItemLabel *reportAcceptNumberLabel;
    ReportItemTextField *reportAcceptNumberTextField;
    
    ReportItemLabel *reportScamTypeLabel;
    SelectTypeView *reportScamTypeView;
    
    ReportItemLabel *reportTimeLengthLabel;
    SelectTypeView *reportTimeLengthView;
    
    TGView *grayBgView;
    SelectItemView *selectTimeItemView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
    
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报诈骗电话";
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
    
    reportSendNumberLabel = [ReportItemLabel initWithY:0 title:@"诈骗电话" superView:reportView];
    reportSendNumberTextField = [ReportItemTextField initWithY:reportSendNumberLabel.y + reportSendNumberLabel.height placeholder:@"请填写诈骗电话号码" superView:reportView];
    
    reportAcceptNumberLabel = [ReportItemLabel initWithY:reportSendNumberTextField.y + reportSendNumberTextField.height title:@"被诈骗电话" superView:reportView];
    reportAcceptNumberTextField = [ReportItemTextField initWithY:reportAcceptNumberLabel.y + reportAcceptNumberLabel.height placeholder:@"请填写被诈骗电话号码" superView:reportView];
    
    reportScamTypeLabel = [ReportItemLabel initWithY:reportAcceptNumberTextField.y + reportAcceptNumberTextField.height title:@"诈骗类型" superView:reportView];
    reportScamTypeView = [SelectTypeView initWithY:reportScamTypeLabel.y + reportScamTypeLabel.height superView:reportView];
    [reportScamTypeView addTitles:scamTypeArr];
    
    reportTimeLengthLabel = [ReportItemLabel initWithY:reportScamTypeView.y + reportScamTypeView.height title:@"通话时长" superView:reportView];
    reportTimeLengthView = [SelectTypeView initWithY:reportTimeLengthLabel.y + reportTimeLengthLabel.height superView:reportView];
    [reportTimeLengthView addTitles:timeLengthArr];
    
    grayBgView = [TGView initWithFrame:CGRectMake(0, reportTimeLengthView.y + reportTimeLengthView.height, DEVICE_W, reportTimeLengthLabel.height) backgroundColor:grayBgColor superView:reportView];
    selectTimeItemView = [SelectItemView initWithY:grayBgView.y + grayBgView.height itemStr:@"来电时间" superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
    [selectTimeItemView addGestureRecognizer:tap];
    
    reportContentLabel = [ReportItemLabel initWithY:selectTimeItemView.y + selectTimeItemView.height title:@"诈骗内容" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请输入举报诈骗内容" superView:reportView];
    reportContentTextView.delegate = self;
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, reportContentTextView.y + reportContentTextView.height);
    
    
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height + commitBtnBottomGap);
    
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
    
    if (EMPTY_STRING([selectTimeItemView itemStr])) {
        [TGToast showWithText:@"请填写时间"];
        return;
    }
    
    if (EMPTY_STRING(reportTimeLengthView.typeTitle)) {
        [TGToast showWithText:@"请填写时长"];
        return;
    }
    
    if (EMPTY_STRING(reportContentTextView.text)) {
        [TGToast showWithText:@"举报描述内容不能为空"];
        return;
    }
    
    model.reportType = ReportScamCall;
    model.reportSendNumber = reportSendNumberTextField.text;
    model.reportAcceptNumber = reportAcceptNumberTextField.text;
    model.reportTypeStr = reportScamTypeView.typeTitle;
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
