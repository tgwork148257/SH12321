//
//  ReportEmailVC.m
//  SH12321
//
//  Created by Tommy on 6/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportEmailVC.h"

#define imageViewW  375 * SCALE_X
#define imageViewH  506 * SCALE_X

@implementation ReportEmailVC{
    UIScrollView *scrollView;
    UIImageView *imageView;
}

- (void)viewDidLoad {
    self.navigationTitle = @"举报邮箱";
    [super viewDidLoad];
    
//    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H)];
//    [self.view addSubview:scrollView];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ORIGIN_Y, imageViewW, imageViewH)];
    imageView.image = [UIImage imageNamed:@"report_email_big@3x"];
    [self.view addSubview:imageView];
    
}



@end
