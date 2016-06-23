//
//  ReportFakeBasicStationVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportFakeBasicStationVC.h"

@interface ReportFakeBasicStationVC() <SelectTimeViewDelegate, SHAreasListVCDelegate, SHStreetsListVCDelegate, UITextViewDelegate>

@end

@implementation ReportFakeBasicStationVC{
    
    UIScrollView *scrollView;
    UIView *reportView;
    ReportItemLabel *reportFakeBasicStationLabel;
    SelectTypeView *reportFakeBasicStationView;
    
    ReportItemLabel *reportAdressLabel;
    SelectItemView *cityView;
    SelectItemView *areaView;
    SelectItemView *streetView;
    ReportItemTextView *detailAdressTextView;
    
    SelectItemView *selectTimeItemView;
    
    CommitButton *commitBtn;
    
    ReportDataModel *model;
    
    NSString *areaStr;
    NSString *streetStr;
    
    NSArray *fakeBasicStationTypeArr;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报伪基站";
    [super viewDidLoad];
    
    self.view.backgroundColor = grayBgColor;
    
    model = [[ReportDataModel alloc] init];
    model.reportType = ReportMessage;
    
    fakeBasicStationTypeArr = @[@"短信",@"电话"];
    
    [self addSubviews];
}

- (void)addSubviews{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H)];
    [self.view addSubview:scrollView];
    
    reportView = [[UIView alloc] init];
    reportView.backgroundColor = C_WHITE;
    [scrollView addSubview:reportView];
    
    reportFakeBasicStationLabel = [ReportItemLabel initWithY:0 title:@"伪基站类型" superView:reportView];
    reportFakeBasicStationView = [SelectTypeView initWithY:reportFakeBasicStationLabel.y + reportFakeBasicStationLabel.height superView:reportView];
    [reportFakeBasicStationView addTitles:fakeBasicStationTypeArr];
    
    reportAdressLabel = [ReportItemLabel initWithY:reportFakeBasicStationView.y + reportFakeBasicStationView.height title:@"不良WIFI地址" superView:reportView];
    cityView = [SelectItemView initWithY:reportAdressLabel.y + reportAdressLabel.height itemStr:@"上海市" superView:reportView];
    areaView = [SelectItemView initWithY:cityView.y + cityView.height itemStr:@"选择区县" superView:reportView];
    streetView = [SelectItemView initWithY:areaView.y + areaView.height itemStr:@"选择街道" superView:reportView];
    detailAdressTextView = [ReportItemTextView initWithY:streetView.y + streetView.height placeholder:@"请输入详细地址" superView:reportView];
    detailAdressTextView.delegate = self;
    
    areaView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectAreaTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectArea)];
    [areaView addGestureRecognizer:selectAreaTap];
    
    streetView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectStreetTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectStreet)];
    [streetView addGestureRecognizer:selectStreetTap];
    
    
    selectTimeItemView = [SelectItemView initWithY:detailAdressTextView.y + detailAdressTextView.height itemStr:@"选择时间" superView:reportView];
    selectTimeItemView.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectTimeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
    [selectTimeItemView addGestureRecognizer:selectTimeTap];
    
    reportView.frame = CGRectMake(0, 0, DEVICE_W, selectTimeItemView.y + selectTimeItemView.height);
    
    
    commitBtn = [CommitButton initWithY:reportView.y + reportView.height + commitBtnTopGap superView:scrollView];
    [commitBtn addTarget:self action:@selector(commitReport) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView.contentSize = CGSizeMake(DEVICE_W, commitBtn.y + commitBtn.height);
    
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

- (void)selectStreet{
    if (!EMPTY_STRING(areaStr)) {
        SHStreetsListVC *vc = [[SHStreetsListVC alloc] init];
        vc.title = areaStr;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [TGToast showWithText:@"请先选择区县"];
    }
}

- (void)backStreet:(NSString *)backStreetStr{
    streetStr = backStreetStr;
    [areaView addItemStr:backStreetStr];
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
    if (EMPTY_STRING(areaStr)) {
        [TGToast showWithText:@"请选择区县"];
    }
    
    if (EMPTY_STRING(streetStr)) {
        [TGToast showWithText:@"请选择街道"];
    }
    
    if (EMPTY_STRING(detailAdressTextView.text)) {
        [TGToast showWithText:@"请输入详细地址"];
    }
    
    model.reportFakeBasicStationTypeStr = [reportFakeBasicStationView getSelectTypeStr];
    model.reportTime = [selectTimeItemView itemStr];
    model.reportAdress = [[areaStr stringByAppendingString:streetStr] stringByAppendingString:detailAdressTextView.text];
    [[TGService sharedInstance] commitReportWithData:model success:^(id responseObject) {
        [TGToast showWithText:@"举报成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } fail:^{
        [TGToast showWithText:@"举报失败，请重试"];
    }];
}



@end
