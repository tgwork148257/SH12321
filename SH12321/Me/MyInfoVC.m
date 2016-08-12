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
    UserInfoView *nameView;
    UserInfoView *genderView;
    
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
    
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    contentView = [[UIView alloc] init];
    contentView.backgroundColor = C_WHITE;
    [scrollView addSubview:contentView];
    
    nameView = [UserInfoView initY:0 preLabelTitle:@"姓名：" placeholder:@"请输入真实姓名" superView:contentView];
    genderView = [UserInfoView initY:nameView.y + nameView.height preLabelTitle:@"性别：" placeholder:@"请填写性别" superView:contentView];
    
    reportWIFIAdressLabel = [ReportItemLabel initWithY:genderView.y + genderView.height title:@"地址" superView:contentView];
    areaView = [SelectItemView initWithY:reportWIFIAdressLabel.y + reportWIFIAdressLabel.height itemStr:@"选择区县" superView:contentView];
    detailAdressTextView = [ReportItemTextView initWithY:areaView.y + areaView.height placeholder:addressPlaceholder superView:contentView];
    detailAdressTextView.delegate = self;
    
    areaView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectAreaTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectArea)];
    [areaView addGestureRecognizer:selectAreaTap];
    
    
    contentView.frame = CGRectMake(0, 0, DEVICE_W, detailAdressTextView.y + detailAdressTextView.height);
    
    commitBtn = [CommitButton initWithY:contentView.y + contentView.height + commitBtnTopGap title:@"退出" superView:scrollView];
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
    //    if (EMPTY_STRING(reportWIFINameTextField.text)) {
    //        [TGToast showWithText:@"请输入WIFI名称"];
    //        return;
    //    }
    //
    //    if (EMPTY_STRING(areaStr)) {
    //        [TGToast showWithText:@"请选择区县"];
    //        return;
    //    }
    //
    //
    //    if (EMPTY_STRING(detailAdressTextView.text)) {
    //        [TGToast showWithText:@"请输入详细地址"];
    //        return;
    //    }
    
    NSString *address = [areaStr stringByAppendingString:detailAdressTextView.text];
    
    [TGRequest modifyUserInfoWithName:[nameView textFieldTitle] gender:[genderView textFieldTitle] adress:address success:^(id responseObject) {
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

- (void)commitReport{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:userTokenKey];
    
    LoginVC *loginVC = [[LoginVC alloc] init];
    loginVC.isPresent = YES;
    [self.navigationController presentViewController:loginVC animated:YES completion:nil];
}

@end
