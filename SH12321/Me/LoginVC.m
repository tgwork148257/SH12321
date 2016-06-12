//
//  LoginVC.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "LoginVC.h"

#define viewY  300
#define viewH  100

@interface LoginVC ()

@end

@implementation LoginVC{
    UIView *phoneNumberView;
    TGLabel *prePhoneNumberLabel;
    UITextField *phoneNumberTextField;
    
    UIView *verifyCodeView;
    TGLabel *preverifyCodeLabel;
    UITextField *verifyCodeTextField;
    TGButton *sendVerifyCodeBtn;
    
    NSTimer *timer;
    NSInteger timeUpdate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    timeUpdate = 60;
    
    [self initViews];
}

- (void)initViews{
    phoneNumberView = [[UIView alloc] initWithFrame:CGRectMake(0, viewY, DEVICE_W, viewH)];
    prePhoneNumberLabel = [TGLabel initWithFrame:CGRectMake(0, 0, 100, viewH) text:@"请输入手机号码" textColor:C_BLACK textFont:FONTSIZE12 textAlignment:NSTextAlignmentLeft superView:phoneNumberView];
    phoneNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(prePhoneNumberLabel.x + prePhoneNumberLabel.width, 0, MIDDLE_W - prePhoneNumberLabel.width, viewH)];
    phoneNumberTextField.borderStyle = UITextBorderStyleLine;
    phoneNumberTextField.font = FONTSIZE12;
    [phoneNumberView addSubview:phoneNumberTextField];
    
    verifyCodeView = [[UIView alloc] initWithFrame:CGRectMake(0, phoneNumberView.y + phoneNumberView.height, DEVICE_W, viewH)];
    preverifyCodeLabel = [TGLabel initWithFrame:CGRectMake(0, 0, 100, viewH) text:@"验证码" textColor:C_BLACK textFont:FONTSIZE12 textAlignment:NSTextAlignmentLeft superView:verifyCodeView];
    verifyCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(preverifyCodeLabel.x + preverifyCodeLabel.width, 0, 100, viewH)];
    verifyCodeTextField.font = FONTSIZE12;
    verifyCodeTextField.borderStyle = UITextBorderStyleBezel;
    [verifyCodeView addSubview:verifyCodeTextField];
    
    sendVerifyCodeBtn = [TGButton initTitleBtnWithFrame:CGRectMake(0, 0, MIDDLE_W - preverifyCodeLabel.width - verifyCodeTextField.width, viewH) title:@"点击获取验证码" titleColor:C_BLACK titleFont:FONTSIZE12 backgroundColor:nil superView:verifyCodeView];
    [sendVerifyCodeBtn addTarget:self action:@selector(sendVerifyCodeBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)sendVerifyCodeBtnDidClick{
    sendVerifyCodeBtn.userInteractionEnabled = NO;
    timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)updateTimer{
    if (time <= 0) {
        [timer invalidate];
        sendVerifyCodeBtn.userInteractionEnabled = YES;
        [sendVerifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        timeUpdate = 60;
        return;
    }
    
    [sendVerifyCodeBtn setTitle:[NSString stringWithFormat:@"%lds", (long)timeUpdate] forState:UIControlStateNormal];
    timeUpdate--;
}

@end
