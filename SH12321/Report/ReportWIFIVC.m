//
//  ReportWIFIVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportWIFIVC.h"

@interface ReportWIFIVC() <SelectTimeViewDelegate>

@end

@implementation ReportWIFIVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    ReportItemLabel *reportWIFINameLabel;
    ReportItemTextField *reportWIFINameTextField;
    
    ReportItemLabel *reportWIFIAdressLabel;
    SelectTypeView *reportWebsiteTypeView;
    
    SelectItemView *selectTimeItemView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
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
    reportWebsiteTypeView = [SelectTypeView initWithY:reportWIFIAdressLabel.y + reportWIFIAdressLabel.height superView:reportView];
    [reportWebsiteTypeView addTitles:@[@"不良类型1",@"不良类型2",@"不良类型3",@"不良类型4",@"不良类型5"]];
    
    selectTimeItemView = [SelectItemView initWithY:reportWebsiteTypeView.y + reportWebsiteTypeView.height itemStr:@"选择时间" superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
    [selectTimeItemView addGestureRecognizer:tap];
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, selectTimeItemView.y + selectTimeItemView.height);
   
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + 40 superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height);
    
}

- (void)selectTime{
    SelectTimeView *selectTimeView = [SelectTimeView initWithY:DEVICE_H - selectTimeViewH superView:self.view];
    selectTimeView.delegate = self;
    [selectTimeView addSubviews];
}

- (void)selectTimeWithYear:(NSString *)yaer month:(NSString *)month day:(NSString *)day time:(NSString *)time{
    NSString *dateTimeStr = [[[yaer stringByAppendingString:month] stringByAppendingString:day] stringByAppendingString:time];
    [selectTimeItemView addItemStr:dateTimeStr];
}


- (void)commitReport{
    
//    model.reportWebsiteURL = reportWIFINameTextField.text;
    //    model.reportAcceptNumber = reportWebsiteTypeView.text;
    model.reportTime = [selectTimeItemView itemStr];
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}



@end
