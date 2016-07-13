//
//  ReportShortMessageVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportShortMessageVC.h"

@interface ReportShortMessageVC() <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation ReportShortMessageVC{
    
    UIView *reportView;
    ReportItemLabel *sendNumberLabel;
    ReportItemTextField *sendNumberTextField;
    
    ReportItemLabel *acceptNumberLabel;
    ReportItemTextField *acceptNumberTextField;
    
    ReportItemLabel *messageContentLabel;
    ReportItemTextView *messageContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报短信";
    [super viewDidLoad];
    

    self.view.backgroundColor = grayBgColor;
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    [self addSubviews];
}

- (void)addSubviews{
    sendNumberLabel = [ReportItemLabel initWithY:0 title:@"发送短信号码" superView:reportView];
    sendNumberTextField = [ReportItemTextField initWithY:sendNumberLabel.y + sendNumberLabel.height placeholder:@"请输入发送短信的号码" superView:reportView];
    
    acceptNumberLabel = [ReportItemLabel initWithY:sendNumberTextField.y + sendNumberTextField.height title:@"接收短信号码" superView:reportView];
    acceptNumberTextField = [ReportItemTextField initWithY:acceptNumberLabel.y + acceptNumberLabel.height placeholder:@"请输入接收短信的号码" superView:reportView];
    
    messageContentLabel = [ReportItemLabel initWithY:acceptNumberTextField.y + acceptNumberTextField.height title:@"短信内容" superView:reportView];
    messageContentTextView = [ReportItemTextView initWithY:messageContentLabel.y + messageContentLabel.height placeholder:@"请输入短信内容" superView:reportView];
    messageContentTextView.delegate = self;
    
    reportView.frame = CGRectMake(0, ORIGIN_Y, DEVICE_W, messageContentTextView.y + messageContentTextView.height);
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
    
    if (![TGUtils isNumber:sendNumberTextField.text]) {
        [TGToast showWithText:@"发送号码输入错误"];
        return;
    }
    
    if (![TGUtils isNumber:acceptNumberTextField.text]) {
        [TGToast showWithText:@"接收号码输入错误"];
        return;
    }
    
    model.reportType = ReportMessage;
    model.reportSendNumber = sendNumberTextField.text;
    model.reportAcceptNumber = acceptNumberTextField.text;
    model.reportContent = messageContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}


@end
