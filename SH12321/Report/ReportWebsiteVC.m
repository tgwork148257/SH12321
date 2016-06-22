//
//  ReportWebsiteVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportWebsiteVC.h"

@implementation ReportWebsiteVC{
    
    UIView *reportView;
    ReportItemLabel *websiteURLLabel;
    ReportItemTextField *websiteURLTextField;
    
    ReportItemLabel *reportWebsiteTypeLabel;
    SelectTypeView *reportWebsiteTypeView;
    
    ReportItemLabel *reportContentLabel;
    ReportItemTextView *reportContentTextView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报网站";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    [self addSubviews];
}

- (void)addSubviews{
    websiteURLLabel = [ReportItemLabel initWithY:0 title:@"不良网址" superView:reportView];
    websiteURLTextField = [ReportItemTextField initWithY:websiteURLLabel.y + websiteURLLabel.height placeholder:nil superView:reportView];
    
    reportWebsiteTypeLabel = [ReportItemLabel initWithY:websiteURLTextField.y + websiteURLTextField.height title:@"不良类型" superView:reportView];
    reportWebsiteTypeView = [SelectTypeView initWithY:reportWebsiteTypeLabel.y + reportWebsiteTypeLabel.height superView:reportView];
    [reportWebsiteTypeView addTitles:@[@"不良类型1",@"不良类型2",@"不良类型3",@"不良类型4",@"不良类型5"]];
    
    reportContentLabel = [ReportItemLabel initWithY:reportWebsiteTypeView.y + reportWebsiteTypeView.height title:@"不良网站内容" superView:reportView];
    reportContentTextView = [ReportItemTextView initWithY:reportContentLabel.y + reportContentLabel.height placeholder:nil superView:reportView];
    
    reportView.frame = CGRectMake(0, ORIGIN_Y, DEVICE_W, reportContentTextView.y + reportContentTextView.height);
    [self.view addSubview:reportView];
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + 20 superView:self.view];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)commitReport{
    
    model.reportSendNumber = websiteURLTextField.text;
//    model.reportAcceptNumber = reportWebsiteTypeView.text;
    model.reportContent = reportContentTextView.text;
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}

@end
