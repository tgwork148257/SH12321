//
//  ReportWIFIVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportWIFIVC.h"

@interface ReportWIFIVC() <SelectTimeViewDelegate, SHAreasListVCDelegate, UITextViewDelegate>

@end

@implementation ReportWIFIVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    ReportItemLabel *reportWIFINameLabel;
    ReportItemTextField *reportWIFINameTextField;
    
    ReportItemLabel *reportWIFIAdressLabel;
    SelectItemView *areaView;
    ReportItemTextView *detailAdressTextView;
    
    SelectItemView *selectTimeItemView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
    
    NSString *areaStr;
    NSString *streetStr;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报不良WIFI";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;

    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
     [scrollView addSubview:reportView];
    
    reportWIFINameLabel = [ReportItemLabel initWithY:0 title:@"不良WIFI名称" superView:reportView];
    reportWIFINameTextField = [ReportItemTextField initWithY:reportWIFINameLabel.y + reportWIFINameLabel.height placeholder:nil superView:reportView];
    
    reportWIFIAdressLabel = [ReportItemLabel initWithY:reportWIFINameTextField.y + reportWIFINameTextField.height title:@"不良WIFI地址" superView:reportView];
    areaView = [SelectItemView initWithY:reportWIFIAdressLabel.y + reportWIFIAdressLabel.height itemStr:@"选择区县" superView:reportView];
    detailAdressTextView = [ReportItemTextView initWithY:areaView.y + areaView.height placeholder:@"请输入详细地址" superView:reportView];
    detailAdressTextView.delegate = self;
    
    areaView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectAreaTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectArea)];
    [areaView addGestureRecognizer:selectAreaTap];
    
    selectTimeItemView = [SelectItemView initWithY:detailAdressTextView.y + detailAdressTextView.height itemStr:@"选择时间" superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectTimeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
    [selectTimeItemView addGestureRecognizer:selectTimeTap];
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, selectTimeItemView.y + selectTimeItemView.height);
   
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height);
    UITapGestureRecognizer *resignTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)];
    [scrollView addGestureRecognizer:resignTap];
}

- (void)resign{
    [detailAdressTextView resignFirstResponder];
    [reportWIFINameTextField resignFirstResponder];
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

- (void)selectTime{
    SelectTimeView *selectTimeView = [SelectTimeView initWithY:DEVICE_H - selectTimeViewH superView:self.view];
    selectTimeView.delegate = self;
    [selectTimeView addSubviews];
}

- (void)selectTimeWithYear:(NSString *)yaer month:(NSString *)month day:(NSString *)day time:(NSString *)time{
    NSString *dateTimeStr = [NSString stringWithFormat:@"%@年%@月%@日: %@",yaer, month, day, time];
    [selectTimeItemView addItemStr:dateTimeStr];
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
    if (EMPTY_STRING(reportWIFINameTextField.text)) {
        [TGToast showWithText:@"请输入WIFI名称"];
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
    
    if (EMPTY_STRING([selectTimeItemView itemStr]) || ([[selectTimeItemView itemStr] isEqualToString:@"选择时间"])) {
        [TGToast showWithText:@"请填写时间"];
        return;
    }

    
    model.reportType = ReportWIFI;
    model.reportName = reportWIFINameTextField.text;
    model.reportTime = [selectTimeItemView itemStr];
    model.reportAdress = [areaStr stringByAppendingString:detailAdressTextView.text];
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
