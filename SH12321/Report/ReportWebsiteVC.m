//
//  ReportWebsiteVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportWebsiteVC.h"

@interface ReportWebsiteVC() <UITextViewDelegate>

@end

@implementation ReportWebsiteVC{
    
    UIView *reportView;
    ReportItemLabel *websiteURLLabel;
    ReportItemTextField *websiteURLTextField;
    
    ReportItemLabel *reportWebsiteTypeLabel;
    SelectTypeView *reportWebsiteTypeView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
    
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报网站";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    
    
    [self addSubviews];
}

- (void)addSubviews{
    websiteURLLabel = [ReportItemLabel initWithY:0 title:@"不良网址" superView:reportView];
    websiteURLTextField = [ReportItemTextField initWithY:websiteURLLabel.y + websiteURLLabel.height placeholder:@"请填写不良网址" superView:reportView];
    
    reportWebsiteTypeLabel = [ReportItemLabel initWithY:websiteURLTextField.y + websiteURLTextField.height title:@"不良类型" superView:reportView];
    reportWebsiteTypeView = [SelectTypeView initWithY:reportWebsiteTypeLabel.y + reportWebsiteTypeLabel.height superView:reportView];
    [reportWebsiteTypeView addTitles:websiteTypeArr];
    
    reportContentLabel = [ReportItemLabel initWithY:reportWebsiteTypeView.y + reportWebsiteTypeView.height title:@"不良网站内容" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请填写举报不良网站内容" superView:reportView];
    reportContentTextView.delegate = self;
    
    reportView.frame = CGRectMake(0, ORIGIN_Y, DEVICE_W, reportContentTextView.y + reportContentTextView.height);
    [self.view addSubview:reportView];
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:self.view];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *resignTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)];
    reportView.userInteractionEnabled = YES;
    [reportView addGestureRecognizer:resignTap];
}

- (void)resign{
    [websiteURLTextField resignFirstResponder];
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

- (void)commitReport{
    if (EMPTY_STRING(websiteURLTextField.text)) {
        [TGToast showWithText:@"请输入网址"];
        return;
    }
    
    if (EMPTY_STRING(websiteURLTextField.text)) {
        [TGToast showWithText:@"请输入网址"];
        return;
    }
    
    if (EMPTY_STRING(reportContentTextView.text)) {
        [TGToast showWithText:@"举报描述内容不能为空"];
        return;
    }
    
    model.reportType = ReportWebsite;
    model.reportWebsiteURL = websiteURLTextField.text;
    model.reportTypeStr = reportWebsiteTypeView.typeTitle;
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
