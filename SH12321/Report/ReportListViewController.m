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


#define viewW DEVICE_W/3
#define viewH                   150
#define imageViewLeft           20
#define imageViewTop            20
#define iamgeViewW              100
#define imageViewH              100
#define imageviewToLabelGap     5
#define labelH                  30

#define imageStrWithIndex(index)  ([NSString stringWithFormat:@"%ld",((long)index)])


@interface ReportListViewController ()

@end

@implementation ReportListViewController{
    UIView *reportView;
    NSArray *labelArr;
    
    
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报";
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    
    labelArr = @[@"举报骚扰电话",@"举报诈骗电话",@"举报短信",@"举报电话",@"举报电话",@"举报电话",@"举报电话",@"举报电话"];
    [self addViews];
}

- (void)addViews{
    reportView = [[UIView alloc] initWithFrame:CGRectMake(0, ORIGIN_Y, DEVICE_W, DEVICE_H)];
    [self.view addSubview:reportView];
    
    CGFloat x = 0;
    CGFloat y = 0;
    for (NSInteger i = 0; i < 8; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, viewW, viewH)];
        view.tag  = i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToReportVC:)];
        [view addGestureRecognizer:tap];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewLeft, imageViewTop, iamgeViewW, imageViewH)];
        imageView.image = [UIImage imageNamed:imageStrWithIndex(i)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height + imageviewToLabelGap, viewH, labelH)];
        label.text = labelArr[i];
        label.textAlignment  = NSTextAlignmentCenter;
        label.textColor = C_BLUE;
        
        [view addSubview:imageView];
        [view addSubview:label];
        [reportView addSubview:view];
        
        if ((i + 1 )%3 == 0) {
            x = 0;
        }else{
            x += viewW;
        }
        y = viewH * ((i + 1)/3);
    }
}

- (void)jumpToReportVC:(UITapGestureRecognizer *)tap{
    NSInteger tag = tap.view.tag;
    NSString *title = labelArr[tag];
    TGViewController *vc;
    switch (tag) {
        case 0:
        {
            [TGRequest TestAFN];
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 1:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 2:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 3:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 4:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 5:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 6:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
        case 7:
        {
            vc = [[ReportCrankCallVC alloc] init];
        }
            break;
//        case 0:
//        {
//            ReportCrankCallVC *vc = [[ReportCrankCallVC alloc] init];
//            vc.navigationTitle = title;
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
            
            
        default:
            break;
    }
    vc.navigationTitle = title;
    [self.navigationController pushViewController:vc animated:YES];
    [self hiddenTabbar];
}

@end
