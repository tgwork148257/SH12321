//
//  ReportOthersInfoVC.m
//  SH12321
//
//  Created by Tommy on 6/23/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportOthersInfoVC.h"

@interface ReportOthersInfoVC ()

@end

@implementation ReportOthersInfoVC{
    UIView *reportView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报其他信息";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    [self addSubviews];
}

- (void)addSubviews{
    
    reportContentLabel = [ReportItemLabel initWithY:0 title:@"举报其他信息" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:@"请输入其他信息详情" superView:reportView];
    
    reportView.frame = CGRectMake(0, ORIGIN_Y, DEVICE_W, reportContentTextView.y + reportContentTextView.height);
    [self.view addSubview:reportView];
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:self.view];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)commitReport{
    
    model.reportContent = reportContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}

@end
