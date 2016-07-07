//
//  ReportAppVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportAppVC.h"

@interface ReportAppVC() <UITextViewDelegate>

@end

@implementation ReportAppVC{
    
    UIView *reportView;
    ReportItemLabel *AppNameLabel;
    ReportItemTextField *AppNameTextField;
    
    ReportItemLabel *AppSourceLabel;
    ReportItemTextField *AppSourceTextField;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报手机应用";
    [super viewDidLoad];
    
    
    self.view.backgroundColor = grayBgColor;
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    [self addSubviews];
}

- (void)addSubviews{
    AppNameLabel = [ReportItemLabel initWithY:0 title:@"不良App名称" superView:reportView];
    AppNameTextField = [ReportItemTextField initWithY:AppNameLabel.y + AppNameLabel.height placeholder:@"请输入不良App名称" superView:reportView];
    
    AppSourceLabel = [ReportItemLabel initWithY:AppNameTextField.y + AppNameTextField.height title:@"不良App来源" superView:reportView];
    AppSourceTextField = [ReportItemTextField initWithY:AppSourceLabel.y + AppSourceLabel.height placeholder:@"请输入不良App来源" superView:reportView];
    
    reportContentLabel = [ReportItemLabel initWithY:AppSourceTextField.y + AppSourceTextField.height title:@"不良App描述" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请输入不良App描述" superView:reportView];
    reportContentTextView.delegate = self;
    
    reportView.frame = CGRectMake(0, ORIGIN_Y, DEVICE_W, reportContentTextView.y + reportContentTextView.height);
    [self.view addSubview:reportView];
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:self.view];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
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
    if (EMPTY_STRING(AppNameTextField.text)) {
        [TGToast showWithText:@"请输入App名称"];
        return;
    }
    
    if (![TGUtils isNumber:AppSourceTextField.text]) {
        [TGToast showWithText:@"请输入App来源"];
        return;
    }
    
    model.reportSendNumber = AppNameTextField.text;
    model.reportAcceptNumber = AppSourceTextField.text;
    model.reportContent = reportContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}


@end
