//
//  ReportRecordDetailVC.m
//  SH12321
//
//  Created by Tommy on 7/4/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportRecordDetailVC.h"
#import "DetailTypeView.h"

@interface ReportRecordDetailVC ()

@end

@implementation ReportRecordDetailVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    ReportItemLabel *handleResultTitleLabel;
    TGView *handleResultContentView;
    TGLabel *handleResultContentLabel;
    
    DetailTypeView *detailTypeView;
    
    ReportItemLabel *resultLabel;
    SelectTypeView *resultTypeView;
    
    CommitButton *commitBtn;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    [scrollView addSubview:reportView];
    
    handleResultTitleLabel = [ReportItemLabel initWithY:0 title:@"处理结果" superView:reportView];
    
    CGRect contentRect = [TGManager rectWithString:self.data.handleResultStr attrDic:@{NSFontAttributeName: F_TEXT} size:CGSizeMake(MIDDLE_W, MAXFLOAT)];
    
    CGRect handleResultContentRect = CGRectMake(0, handleResultTitleLabel.y + handleResultTitleLabel.height, DEVICE_W, contentRect.size.height);
    
    handleResultContentView = [TGView initWithFrame:handleResultContentRect superView:reportView];
    handleResultContentLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W, contentRect.size.height) text:self.data.handleResultStr textColor:C_LABEL textFont:F_TEXT textAlignment:NSTextAlignmentLeft superView:handleResultContentView];
    
    detailTypeView = [DetailTypeView initWithY:handleResultContentView.y + handleResultContentView.height data:self.data superView:reportView];
    
    resultLabel = [ReportItemLabel initWithY:0 title:@"伪基站类型" superView:reportView];
    resultTypeView = [SelectTypeView initWithY:resultLabel.y + resultLabel.height superView:reportView];
    [resultTypeView addTitles:@[@"已解决", @"未解决"]];
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, resultTypeView.y + resultTypeView.height);
    
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height);

}

- (void)commitReport{
    [[TGService sharedInstance] commitReportWithData:self.data success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}

@end