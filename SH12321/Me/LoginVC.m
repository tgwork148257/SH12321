//
//  LoginVC.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "LoginVC.h"

#define Y  200
#define viewH  45
#define loginBtnW 300
#define loginBtnH 35

#define labelW 100

#define preverifyCodeImageViewWH 25


#define logoW 79
#define logoH 83

@interface LoginVC ()

@end

@implementation LoginVC{
    UIImageView *logoImageView;
    TGLabel *titleLabel;
    
    UIView *phoneNumberView;
    TGLabel *prePhoneNumberLabel;
    UITextField *phoneNumberTextField;
    
    UIView *verifyCodeView;
    UIView *preverifyCodeView;
    UIImageView *preverifyCodeImageView;
    UITextField *verifyCodeTextField;
    TGButton *sendVerifyCodeBtn;
    
    TGButton *loginBtn;
    
    NSTimer *timer;
    NSInteger timeUpdate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    timeUpdate = 60;
    
    [self addSubviews];
}

- (void)addSubviews{
    logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_W - logoW)/2, Y, logoW, logoH)];
    logoImageView.image = [UIImage imageNamed:@""];
    [self.view addSubview:logoImageView];
    
    titleLabel = [TGLabel initWithFrame:CGRectMake(0, logoImageView.y + logoImageView.height + 50, MIDDLE_W, 32) text:@"上海12321举报受理中心" textColor:C_BLACK textFont:FONTSIZE20 textAlignment:NSTextAlignmentCenter superView:self.view];
    
    phoneNumberView = [[UIView alloc] initWithFrame:CGRectMake(L_R_EDGE, titleLabel.y + titleLabel.height, DEVICE_W, viewH)];
    [self.view addSubview:phoneNumberView];
    prePhoneNumberLabel = [TGLabel initWithFrame:CGRectMake(0, 0, labelW, viewH) text:@"+86" textColor:C_BLACK textFont:FONTSIZE16 textAlignment:NSTextAlignmentCenter superView:phoneNumberView];
    phoneNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(prePhoneNumberLabel.x + prePhoneNumberLabel.width, 0, MIDDLE_W - prePhoneNumberLabel.width, viewH)];
    phoneNumberTextField.borderStyle = UITextBorderStyleLine;
    phoneNumberTextField.font = FONTSIZE16;
    phoneNumberTextField.placeholder = @"手机号";
    [phoneNumberView addSubview:phoneNumberTextField];
    
    verifyCodeView = [[UIView alloc] initWithFrame:CGRectMake(L_R_EDGE, phoneNumberView.y + phoneNumberView.height, MIDDLE_W, viewH)];
    [self.view addSubview:verifyCodeView];
    preverifyCodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, labelW, viewH)];
    [verifyCodeView addSubview:preverifyCodeView];
    
    preverifyCodeImageView = [[UIImageView alloc] initWithFrame:CGRectMake((labelW - preverifyCodeImageViewWH)/2, (viewH - preverifyCodeImageViewWH)/2, preverifyCodeImageViewWH, preverifyCodeImageViewWH)];
    [preverifyCodeView addSubview:preverifyCodeImageView];
    
    verifyCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(preverifyCodeView.x + preverifyCodeView.width, 0, 100, viewH)];
    verifyCodeTextField.font = FONTSIZE16;
    verifyCodeTextField.placeholder = @"验证码";
    verifyCodeTextField.borderStyle = UITextBorderStyleBezel;
    [verifyCodeView addSubview:verifyCodeTextField];
    
    sendVerifyCodeBtn = [TGButton initTitleBtnWithFrame:CGRectMake(0, 0, MIDDLE_W - preverifyCodeView.width - preverifyCodeView.width, viewH) title:@"获取验证码" titleColor:C_BLACK titleFont:FONTSIZE12 backgroundColor:C_WHITE superView:verifyCodeView];
    sendVerifyCodeBtn.backgroundColor = C_WHITE;
    [sendVerifyCodeBtn addTarget:self action:@selector(sendVerifyCodeBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    loginBtn = [TGButton initTitleBtnWithFrame:CGRectMake((DEVICE_W - loginBtnW)/2, verifyCodeView.y + verifyCodeView.height + 43, loginBtnW, loginBtnH) title:@"登录" titleColor:C_WHITE titleFont:FONTSIZE16 backgroundColor:nil superView:self.view];
    loginBtn.backgroundColor = greenBgColor;
    [loginBtn addTarget:self action:@selector(loginBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
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


- (void)loginBtnDidClick{
    
}

@end
