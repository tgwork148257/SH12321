//
//  ReportInfoRevealVC.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportInfoRevealVC.h"

@interface ReportInfoRevealVC () <UITextViewDelegate>

@end

@implementation ReportInfoRevealVC{
    
    UIView *reportView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报个人信息泄露";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    [self addSubviews];
}

- (void)addSubviews{
    
    reportContentLabel = [ReportItemLabel initWithY:0 title:@"个人信息泄露" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请输入个人信息泄露详情" superView:reportView];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [reportContentTextView resignFirstResponder];
}

- (void)commitReport{
    
    if (EMPTY_STRING(reportContentTextView.text)) {
        [TGToast showWithText:@"举报描述内容不能为空"];
        return;
    }
    
    model.reportType = ReportInfoReveal;
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
