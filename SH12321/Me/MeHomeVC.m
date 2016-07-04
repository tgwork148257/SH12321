//
//  MeHomeVC.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "MeHomeVC.h"
#import "ReportRecordCell.h"
#import "MeItemView.h"
#import "ReportRecordListVC.h"

@interface MeHomeVC ()

@end

@implementation MeHomeVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    MeItemView *myReportView;
    ReportItemLabel *aboutOursLabel;
    MeItemView *wechatView;
    MeItemView *websiteView;
    MeItemView *phoneView;
    MeItemView *adviceView;
    
}

- (void)viewDidLoad{
    self.navigationTitle = @"我";
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    [scrollView addSubview:reportView];
    
    myReportView = [MeItemView initWithY:0 itemStr:@"我的举报" superView:reportView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToReportList)];
    myReportView.userInteractionEnabled = YES;
    [myReportView addGestureRecognizer:tap];
    
    aboutOursLabel = [ReportItemLabel initWithY:myReportView.y + myReportView.height title:@"关于我们" superView:reportView];
    wechatView = [MeItemView initWithY:aboutOursLabel.y + aboutOursLabel.height itemStr:@"官方微信" superView:reportView];
    websiteView = [MeItemView initWithY:wechatView.y + wechatView.height itemStr:@"官方网站" superView:reportView];
    phoneView = [MeItemView initWithY:websiteView.y + websiteView.height itemStr:@"举报电话" superView:reportView];
    adviceView = [MeItemView initWithY:phoneView.y + phoneView.height itemStr:@"投诉建议" superView:reportView];
    
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, adviceView.y + adviceView.height);
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, reportView.y + reportView.height);
}

- (void)jumpToReportList{
    ReportRecordListVC *vc = [[ReportRecordListVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
