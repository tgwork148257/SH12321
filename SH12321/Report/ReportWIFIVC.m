//
//  ReportWIFIVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportWIFIVC.h"

@implementation ReportWIFIVC{
    
    UIView *reportView;
    ReportItemLabel *reportWIFINameLabel;
    ReportItemTextField *reportWIFINameTextField;
    
    ReportItemLabel *reportWIFIAdressLabel;
    SelectTypeView *reportWebsiteTypeView;
    
    SelectTimeItemView *selectTimeItemView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报不良WIFI";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    [self addSubviews];
}

- (void)addSubviews{
    reportWIFINameLabel = [ReportItemLabel initWithY:0 title:@"不良WIFI名称" superView:reportView];
    reportWIFINameTextField = [ReportItemTextField initWithY:reportWIFINameLabel.y + reportWIFINameLabel.height placeholder:nil superView:reportView];
    
    reportWIFIAdressLabel = [ReportItemLabel initWithY:reportWIFINameTextField.y + reportWIFINameTextField.height title:@"不良WIFI地址" superView:reportView];
    reportWebsiteTypeView = [SelectTypeView initWithY:reportWIFIAdressLabel.y + reportWIFIAdressLabel.height superView:reportView];
    [reportWebsiteTypeView addTitles:@[@"不良类型1",@"不良类型2",@"不良类型3",@"不良类型4",@"不良类型5"]];
    
    selectTimeItemView = [SelectTimeItemView initWithY:reportWebsiteTypeView.y + reportWebsiteTypeView.height superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
    [selectTimeItemView addGestureRecognizer:tap];
    
    reportView.frame = CGRectMake(0, ORIGIN_Y, DEVICE_W, selectTimeItemView.y + selectTimeItemView.height);
    [self.view addSubview:reportView];
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + 20 superView:self.view];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)selectTime{
    SelectTimeView *selectTimeView = [SelectTimeView initWithY:DEVICE_H - selectTimeViewH superView:self.view];
    [selectTimeView addSubviews];
}

- (void)commitReport{
    
    model.reportWebsiteURL = reportWIFINameTextField.text;
    //    model.reportAcceptNumber = reportWebsiteTypeView.text;
    model.reportTime = [selectTimeItemView timeStr];
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}



@end
