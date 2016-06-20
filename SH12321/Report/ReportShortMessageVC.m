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
    TGLabel *sendNumberLabel;
    UITextField *sendNumberTextField;
    
    
    TGLabel *acceptNumberLabel;
    UITextField *acceptNumberTextField;
    
    TGLabel *messageContentLabel;
    UITextView *messageContentTextView;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报短信";
    [super viewDidLoad];
    
    [self addSubviews];
}

- (void)addSubviews{
    
}

- (void)commitReport{
    
    if ([TGUtils isNumber:sendNumberTextField.text]) {
        [TGToast showWithText:@"发送号码输入错误"];
    }
    
    if ([TGUtils isNumber:acceptNumberTextField.text]) {
        [TGToast showWithText:@"接收号码输入错误"];
    }
    
    
}

@end
