//
//  MyInfoVC.m
//  SH12321
//
//  Created by Tommy on 8/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "MyInfoVC.h"
#import "UserInfoView.h"
#import "LoginVC.h"

@interface MyInfoVC ()<SHAreasListVCDelegate, UITextViewDelegate>

@end

@implementation MyInfoVC{
    
    UIScrollView *scrollView;
    UIView *contentView;
    UserInfoView *phoneView;
    UserInfoView *nameView;
    UserInfoView *genderView;
    UserInfoView *ageView;
    
    ReportItemLabel *reportWIFIAdressLabel;
    SelectItemView *areaView;
    ReportItemTextView *detailAdressTextView;
    
    CommitButton *commitBtn;
    
    NSString *areaStr;
    NSString *streetStr;
}

- (void)viewDidLoad {
    self.navigationTitle = @"个人信息";
    [super viewDidLoad];
    
    self.rightBtn.hidden = NO;
    [self.rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:C_WHITE forState:UIControlStateNormal];
    
    self.view.backgroundColor = grayBgColor;
    
    [self getUserInfo];
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    contentView = [[UIView alloc] init];
    contentView.backgroundColor = C_WHITE;
    [scrollView addSubview:contentView];
    
    phoneView = [UserInfoView initY:0 preLabelTitle:@"手机号：" placeholder:@"" superView:contentView];
    nameView = [UserInfoView initY:phoneView.y + phoneView.height preLabelTitle:@"姓名：" placeholder:@"请输入真实姓名" superView:contentView];
    genderView = [UserInfoView initY:nameView.y + nameView.height preLabelTitle:@"性别：" placeholder:@"请填写性别" superView:contentView];
    ageView = [UserInfoView initY:genderView.y + genderView.height preLabelTitle:@"年龄：" placeholder:@"请填写年龄" superView:contentView];
    
    reportWIFIAdressLabel = [ReportItemLabel initWithY:ageView.y + ageView.height title:@"地址" superView:contentView];
    areaView = [SelectItemView initWithY:reportWIFIAdressLabel.y + reportWIFIAdressLabel.height itemStr:@"选择区县" superView:contentView];
    detailAdressTextView = [ReportItemTextView initWithY:areaView.y + areaView.height placeholder:addressPlaceholder superView:contentView];
    detailAdressTextView.delegate = self;
    
    areaView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectAreaTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectArea)];
    [areaView addGestureRecognizer:selectAreaTap];
    
    
    contentView.frame = CGRectMake(0, 0, DEVICE_W, detailAdressTextView.y + detailAdressTextView.height);
    
    commitBtn = [CommitButton initWithY:contentView.y + contentView.height + commitBtnTopGap title:@"退出登录" superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height);
    UITapGestureRecognizer *resignTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)];
    [scrollView addGestureRecognizer:resignTap];
}

- (void)resign{
    [detailAdressTextView resignFirstResponder];
    [nameView resignFirstResponder];
    [genderView resignFirstResponder];
}

- (void)selectArea{
    SHAreasListVC *vc = [[SHAreasListVC alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)backArea:(NSString *)backAreaStr{
    areaStr = backAreaStr;
    [areaView addItemStr:backAreaStr];
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

- (void)rightBtnDidClick{
    if (![TGUtils isNumber:[ageView textFieldTitle]]) {
        [TGToast showWithText:@"请输入有效的年龄"];
        return;
    }
    
    if ([[ageView textFieldTitle] integerValue] >= 100 || [[ageView textFieldTitle] integerValue] < 16) {
        [TGToast showWithText:@"请输入有效的年龄"];
        return;
    }
    
    if (! ([[genderView textFieldTitle] isEqualToString:@"男"] || [[genderView textFieldTitle] isEqualToString:@"女"])) {
        [TGToast showWithText:@"请输入有效性别"];
        return;
    }
    
    if (EMPTY_STRING(areaStr)) {
        [TGToast showWithText:@"请选择区县"];
        return;
    }
    
    if (EMPTY_STRING(detailAdressTextView.text)) {
        [TGToast showWithText:@"请输入详细地址"];
        return;
    }

    NSString *address = [areaStr stringByAppendingString:detailAdressTextView.text];
    if (EMPTY_STRING(address)) {
        address = @"";
    }
    
    [TGRequest modifyUserInfoWithName:[nameView textFieldTitle] gender:[genderView textFieldTitle] age:[ageView textFieldTitle] adress:address success:^(id responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            [TGToast showWithText:@"修改个人信息成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [TGToast showWithText:@"修改个人信息失败，请重试"];
        }
    } fail:^{
        [TGToast showWithText:@"修改个人信息失败，请重试"];
    }];
}


- (void)getUserInfo{
    [TGRequest getUserInfoSuccess:^(id responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            NSDictionary *data = [responseObject objectForKey:@"data"];
            NSString *mobile = [data objectForKey:@"mobile"];
            NSString *name = [data objectForKey:@"name"];
            NSString *age = [data objectForKey:@"age"];
            NSString *gender = [data objectForKey:@"sex"];
            NSString *address = [data objectForKey:@"address"];
            NSString *userAreaStr = @"选择区县";
            NSString *userDetailAddress = @"";
            if (!EMPTY_STRING(address)) {
                userAreaStr = [address substringToIndex:2];
                userDetailAddress = [address substringFromIndex:3];
            }
            [phoneView addTextFieldTitle:mobile];
            [nameView addTextFieldTitle:name];
            [genderView addTextFieldTitle:gender];
            [ageView addTextFieldTitle:age];
            [areaView addItemStr:userAreaStr];
            detailAdressTextView.text = userDetailAddress;
        }else if ([[responseObject objectForKey:@"code"] integerValue] == 4007){
            [TGToast showWithText:@"没有用户信息"];
        }else{
            [TGToast showWithText:@"获取个人信息失败，请重试"];
        }
    } fail:^{
        [TGToast showWithText:@"获取个人信息失败，请重试"];
    }];
}

- (void)commitReport{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:userTokenKey];
    
    LoginVC *loginVC = [[LoginVC alloc] init];
    loginVC.isPresent = YES;
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
