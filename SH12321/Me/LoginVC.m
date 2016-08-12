//
//  LoginVC.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "LoginVC.h"
#import "ReportListViewController.h"

#define Y  100
#define viewH  45
#define loginBtnW 280
#define loginBtnH 35

#define labelW 88

#define sendVerifyCodeBtnW 64

#define preverifyCodeImageViewWH 25

#define lineW loginBtnW

#define gap 36


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
    TGView *phoneNumberLine;
    
    UIView *verifyCodeView;
    UIView *preverifyCodeView;
    UIImageView *preverifyCodeImageView;
    UITextField *verifyCodeTextField;
    TGButton *sendVerifyCodeBtn;
    TGView *verifyCodeLine;
    
    TGButton *loginBtn;
    NSString *verifyCode;
    
    NSTimer *timer;
    NSInteger timeUpdate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    timeUpdate = 60;
    [self hiddenTabbar];
    
    [self addSubviews];
}

- (void)addSubviews{
    logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_W - logoW)/2, Y, logoW, logoH)];
    logoImageView.image = [UIImage imageNamed:@"app_logo"];
    [self.view addSubview:logoImageView];
    
    titleLabel = [TGLabel initWithFrame:CGRectMake(0, logoImageView.y + logoImageView.height + gap, MIDDLE_W, 32) text:@"上海12321举报受理中心" textColor:C_BLACK textFont:FONTSIZE20 textAlignment:NSTextAlignmentCenter superView:self.view];
    
    phoneNumberView = [[UIView alloc] initWithFrame:CGRectMake(L_R_EDGE, titleLabel.y + titleLabel.height + gap, DEVICE_W, viewH)];
    [self.view addSubview:phoneNumberView];
    prePhoneNumberLabel = [TGLabel initWithFrame:CGRectMake(0, 0, labelW, viewH) text:@"+86" textColor:C_BLACK textFont:FONTSIZE16 textAlignment:NSTextAlignmentCenter superView:phoneNumberView];
    phoneNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(prePhoneNumberLabel.x + prePhoneNumberLabel.width, 0, MIDDLE_W - prePhoneNumberLabel.width, viewH)];
    phoneNumberTextField.borderStyle = UITextBorderStyleNone;
    phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneNumberTextField.font = FONTSIZE16;
    phoneNumberTextField.placeholder = @"手机号";
    [phoneNumberView addSubview:phoneNumberTextField];
    
    CGFloat lineX = (MIDDLE_W - lineW)/2;
    phoneNumberLine = [TGView initWithFrame:CGRectMake(lineX, viewH - 1, lineW, 1) superView:phoneNumberView];
    phoneNumberLine.backgroundColor = C_LINE;
    
    verifyCodeView = [[UIView alloc] initWithFrame:CGRectMake(L_R_EDGE, phoneNumberView.y + phoneNumberView.height, MIDDLE_W, viewH)];
    [self.view addSubview:verifyCodeView];
    preverifyCodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, labelW, viewH)];
    [verifyCodeView addSubview:preverifyCodeView];
    
    preverifyCodeImageView = [[UIImageView alloc] initWithFrame:CGRectMake((labelW - preverifyCodeImageViewWH)/2, (viewH - preverifyCodeImageViewWH)/2, preverifyCodeImageViewWH, preverifyCodeImageViewWH)];
    preverifyCodeImageView.image = [UIImage imageNamed:@"login_phone"];
    [preverifyCodeView addSubview:preverifyCodeImageView];
    
    verifyCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(preverifyCodeView.x + preverifyCodeView.width, 0, MIDDLE_W - sendVerifyCodeBtnW - preverifyCodeView.width - 36, viewH)];
    verifyCodeTextField.font = FONTSIZE16;
    verifyCodeTextField.placeholder = @"验证码";
    verifyCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    verifyCodeTextField.borderStyle = UITextBorderStyleNone;
    [verifyCodeView addSubview:verifyCodeTextField];
    
    sendVerifyCodeBtn = [TGButton initTitleBtnWithFrame:CGRectMake(verifyCodeTextField.x + verifyCodeTextField.width, 0, sendVerifyCodeBtnW, viewH) title:@"获取验证码" titleColor:C_BLACK titleFont:FONTSIZE12 backgroundColor:C_WHITE superView:verifyCodeView];
    sendVerifyCodeBtn.backgroundColor = C_WHITE;
    [sendVerifyCodeBtn addTarget:self action:@selector(sendVerifyCodeBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    verifyCodeLine = [TGView initWithFrame:CGRectMake(lineX, viewH - 1, lineW, 1) superView:verifyCodeView];
    verifyCodeLine.backgroundColor = C_LINE;
    
    loginBtn = [TGButton initTitleBtnWithFrame:CGRectMake((DEVICE_W - loginBtnW)/2, verifyCodeView.y + verifyCodeView.height + gap, loginBtnW, loginBtnH) title:@"登录" titleColor:C_WHITE titleFont:FONTSIZE16 backgroundColor:nil superView:self.view];
    loginBtn.backgroundColor = greenBgColor;
    [loginBtn addTarget:self action:@selector(loginBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *resignTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:resignTap];
}

- (void)resign{
    [verifyCodeTextField resignFirstResponder];
    [phoneNumberTextField resignFirstResponder];
}

- (void)sendVerifyCodeBtnDidClick{
    if (![TGUtils isNumber:phoneNumberTextField.text]) {
        [TGToast showWithText:@"手机号输入不正确"];
        return;
    }
    
    sendVerifyCodeBtn.userInteractionEnabled = NO;
    timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    [TGRequest getVerificationCodeWithNumber:phoneNumberTextField.text success:^(id responseObject) {
        [TGToast showWithText:@"验证码已发送，请查收"];
        verifyCode = [responseObject objectForKey:phoneVerificationCodeKey];
    } fail:^{
        [TGToast showWithText:@"发送验证码失败，请查收"];
    }];
}

- (void)updateTimer{
    if (timeUpdate <= 0) {
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
    if (![TGUtils isNumber:phoneNumberTextField.text]) {
        [TGToast showWithText:@"手机号输入不正确"];
        return;
    }
    
    if (![verifyCode isEqualToString:verifyCodeTextField.text] ) {
        [TGToast showWithText:@"验证码输入不正确"];
        return;
    }
    [TGRequest getUserTokenWithNumber:phoneNumberTextField.text code:verifyCode success:^(id responseObject) {
        [TGToast showWithText:@"登录成功"];
        [TGUtils saveUserToken:responseObject];
        if (self.isPresent) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self.navigationController pushViewController:[[ReportListViewController alloc] init] animated:YES];
        }
        
        
    } fail:^{
        [TGToast showWithText:@"登录失败，请重试"];
    }];
    
//    [self.navigationController pushViewController:[[ReportListViewController alloc] init] animated:YES];
    
}

@end
