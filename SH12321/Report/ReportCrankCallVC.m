//
//  ReportCrankCallVC.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportCrankCallVC.h"

@interface ReportCrankCallVC () <SelectTimeViewDelegate, UITextViewDelegate>

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
    
    NSArray *timeLengthArr;
    NSArray *crankFormArr;
    NSArray *crankTypeArr;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报骚扰电话";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    timeLengthArr = @[@"3分钟以下",@"3-5分钟",@"5-10分钟",@"10分钟以上"];
    crankFormArr = @[@"响一声就挂",@"自动语音骚扰",@"人工骚扰"];
    crankTypeArr = @[@"色情",@"发票",@"赌博",@"违禁品",@"高利贷",@"反动",@"广告骚扰"];
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    [scrollView addSubview:reportView];
    
    reportSendNumberLabel = [ReportItemLabel initWithY:0 title:@"骚扰电话" superView:reportView];
    reportSendNumberTextField = [ReportItemTextField initWithY:reportSendNumberLabel.y + reportSendNumberLabel.height placeholder:@"请填写骚扰电话号码" superView:reportView];
    
    reportAcceptNumberLabel = [ReportItemLabel initWithY:reportSendNumberTextField.y + reportSendNumberTextField.height title:@"被骚扰电话" superView:reportView];
    reportAcceptNumberTextField = [ReportItemTextField initWithY:reportAcceptNumberLabel.y + reportAcceptNumberLabel.height placeholder:@"请填写被骚扰电话号码" superView:reportView];
    
    reportCrankFormLabel = [ReportItemLabel initWithY:reportAcceptNumberTextField.y + reportAcceptNumberTextField.height title:@"骚扰形式" superView:reportView];
    reportCrankFormView = [SelectTypeView initWithY:reportCrankFormLabel.y + reportCrankFormLabel.height superView:reportView];
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
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请输入骚扰内容" superView:reportView];
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
    NSString *dateTimeStr = [[[yaer stringByAppendingString:month] stringByAppendingString:day] stringByAppendingString:time];
    [selectTimeItemView addItemStr:dateTimeStr];
}


- (void)commitReport{
    model.reportSendNumber = reportSendNumberTextField.text;
    model.reportAcceptNumber = reportAcceptNumberTextField.text;
    model.reportCrankCallType = [reportCrankTypeView getSelectIndex];
    model.reportCrankCallStatus = [reportCrankFormView getSelectIndex];
    model.reportTimeLength = [reportTimeLengthView getSelectIndex];
    model.reportTime = [selectTimeItemView itemStr];
    model.reportContent = reportContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}


@end
