//
//  ReportListViewController.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportListViewController.h"
#import "ReportCrankCallVC.h"
#import "ReportScamsCallVC.h"
#import "ReportShortMessageVC.h"
#import "ReportWebsiteVC.h"
#import "ReportAppVC.h"
#import "ReportWIFIVC.h"
#import "ReportFakeBasicStationVC.h"
#import "ReportEmailVC.h"
#import "ReportPhoneNumberIndentificationVC.h"
#import "ReportInfoRevealVC.h"
#import "ReportBadNewsVC.h"
#import "ReportInfringmentVC.h"
#import "ReportOthersInfoVC.h"
#import "SHAreasListVC.h"



#define viewW DEVICE_W/3
#define viewH                   150
#define imageViewLeft           (viewW - iamgeViewW)/2
#define imageViewTop            20
#define iamgeViewW              60
#define imageViewH              60
#define imageviewToLabelGap     5
#define labelH                  30
#define pageViewH               30
#define pageBtnWH               10

#define imageStrWithIndex(index)  ([reportIconArr objectAtIndex:index])


@interface ReportListViewController ()<UIAlertViewDelegate>

@end

@implementation ReportListViewController{
    UIView *reportFirstPageView;
    UIView *reportSecondPageView;
    
    UIView *pageView;
    TGButton *firstPageBtn;
    TGButton *secondPageBtn;
        
    NSString *versionUrlStr;
}

- (void)leftBtnDidClick{
    SHAreasListVC *vc = [[SHAreasListVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showTabbar];
}

- (void)viewDidLoad {
    self.navigationTitle = @"选择举报类别";
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    versionUrlStr = @"";
    [self addViews];
    
    [self updateNewVersion];
}

- (void)addViews{
    reportFirstPageView = [[UIView alloc] initWithFrame:CGRectMake(0, ORIGIN_Y, DEVICE_W, DEVICE_H - pageViewH)];
    reportSecondPageView = [[UIView alloc] initWithFrame:reportFirstPageView.frame];
    reportSecondPageView.hidden = YES;
    
    [self.view addSubview:reportFirstPageView];
    [self.view addSubview:reportSecondPageView];
    
    reportFirstPageView.userInteractionEnabled = YES;
    reportSecondPageView.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *firstPageSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(firstPageSwipe:)];
    firstPageSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [reportFirstPageView addGestureRecognizer:firstPageSwipe];
    
    UISwipeGestureRecognizer *secondPageSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(secondPageSwipe:)];
    [reportSecondPageView addGestureRecognizer:secondPageSwipe];
    secondPageSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    
    pageView = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_H - pageViewH - TABBAR_H, DEVICE_W, pageViewH)];
    [self.view addSubview:pageView];
    CGFloat pageBtnY = (pageViewH - pageBtnWH )/2;
    firstPageBtn = [TGButton initWithFrame:CGRectMake(DEVICE_W/2 - 10 - pageBtnWH, pageBtnY, pageBtnWH, pageBtnWH) superView:pageView];
    secondPageBtn = [TGButton initWithFrame:CGRectMake(DEVICE_W/2 + 10, pageBtnY, pageBtnWH, pageBtnWH) superView:pageView];
    firstPageBtn.backgroundColor = C_LABEL;
    
    [firstPageBtn addBorderWithRadius:pageBtnWH/2 borderColor:C_LABEL];
    [secondPageBtn addBorderWithRadius:pageBtnWH/2 borderColor:C_LABEL];
    
    CGFloat x = 0;
    CGFloat y = 0;
    for (NSInteger i = 0; i < 9; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, viewW, viewH)];
        view.tag  = i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToReportVC:)];
        [view addGestureRecognizer:tap];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewLeft, imageViewTop, iamgeViewW, imageViewH)];
        imageView.image = [UIImage imageNamed:imageStrWithIndex(i)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height + imageviewToLabelGap, viewW, labelH)];
        label.text = reportArr[i];
        label.textAlignment  = NSTextAlignmentCenter;
        label.textColor = C_BLACK;
        
        [view addSubview:imageView];
        [view addSubview:label];
        [reportFirstPageView addSubview:view];
        
        if ((i + 1 )%3 == 0) {
            x = 0;
        }else{
            x += viewW;
        }
        y = viewH * ((i + 1)/3);
    }
    
    x = 0;
    y = 0;
    for (NSInteger i = 9; i < 13; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, viewW, viewH)];
        view.tag  = i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToReportVC:)];
        [view addGestureRecognizer:tap];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewLeft, imageViewTop, iamgeViewW, imageViewH)];
        imageView.image = [UIImage imageNamed:imageStrWithIndex(i)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height + imageviewToLabelGap, viewW, labelH)];
        label.text = reportArr[i];
        label.textAlignment  = NSTextAlignmentCenter;
        label.textColor = C_BLACK;
        
        [view addSubview:imageView];
        [view addSubview:label];
        [reportSecondPageView addSubview:view];
        
        if ((i + 1 )%3 == 0) {
            x = 0;
        }else{
            x += viewW;
        }
        y = viewH * (((i - 9) + 1)/3);
    }
}


- (void)firstPageSwipe:(UISwipeGestureRecognizer *)tap{
    reportFirstPageView.hidden = YES;
    reportSecondPageView.hidden = NO;
    
    firstPageBtn.backgroundColor = C_WHITE;
    secondPageBtn.backgroundColor = C_LABEL;
}

- (void)secondPageSwipe:(UISwipeGestureRecognizer *)tap{
    reportFirstPageView.hidden = NO;
    reportSecondPageView.hidden = YES;
    
    firstPageBtn.backgroundColor = C_LABEL;
    secondPageBtn.backgroundColor = C_WHITE;
}

- (void)jumpToReportVC:(UITapGestureRecognizer *)tap{
    NSInteger tag = tap.view.tag;
    NSString *title = reportArr[tag];
    TGViewController *vc;
    switch (tag) {
        case 0:
        {
//            [TGRequest TestAFN];
            vc = [[ReportShortMessageVC alloc] init];
        }
            break;
        case 1:
        {
            vc = [[ReportScamsCallVC alloc] init];
        }
            break;
        case 2:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 3:
        {
            vc = [[ReportWebsiteVC alloc] init];
        }
            break;
        case 4:
        {
            vc = [[ReportEmailVC alloc] init];
        }
            break;
        case 5:
        {
            vc = [[ReportAppVC alloc] init];
        }
            break;
        case 6:
        {
            vc = [[ReportFakeBasicStationVC alloc] init];
        }
            break;
        case 7:
        {
            vc = [[ReportWIFIVC alloc] init];
        }
            break;
        case 8:
        {
            vc = [[ReportPhoneNumberIndentificationVC alloc] init];
        }
            break;
        case 9:
        {
            vc = [[ReportInfoRevealVC alloc] init];
        }
            break;
        case 10:
        {
            vc = [[ReportBadNewsVC alloc] init];
        }
            break;
        case 11:
        {
            vc = [[ReportInfoRevealVC alloc] init];
        }
            break;
        case 12:
        {
            vc = [[ReportOthersInfoVC alloc] init];
        }
            break;
            
            
        default:
            break;
    }
    vc.navigationTitle = title;
    [self.navigationController pushViewController:vc animated:YES];
    [self hiddenTabbar];
}


- (void)updateNewVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // 当前应用名称
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    // 当前应用软件版本  比如：1.0.1
    NSString *appCurVersion = [TGUtils getVersion];
    if (EMPTY_STRING(appCurVersion)) {
        appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        [TGUtils saveVersion:appCurVersion];
    }
    
    [TGRequest updateVerisonSuccess:^(id responseObject) {
        NSString *currentVersionStr = [TGUtils getVersion];
        NSString *newVersionStr = [responseObject objectForKey:versionKey];
        NSString *appType = [responseObject objectForKey:@"app_type"];
        if ([appType isEqualToString:@"ios"] &&
            ![currentVersionStr isEqualToString:newVersionStr]) {
            [TGUtils saveVersion:newVersionStr];
            versionUrlStr = [responseObject objectForKey:@"url"];
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:nil message:@"版本更新" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更新", nil];
            [alert show];
        }
    } fail:^{}];
}

#pragma mark -- actionSheet delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0://取消
        {
            break;
        }
        case 1://更新
        {
            if (!EMPTY_STRING(versionUrlStr)) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:versionUrlStr]];
            }
            break;
        }
        default:
            break;
    }
}

@end
