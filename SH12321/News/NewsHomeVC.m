//
//  NewsHomeVC.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsHomeVC.h"
#import "NewsDetailModel.h"
#import "NewsDetailsVC.h"
#import "NewsHomeCell.h"

@interface NewsHomeVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation NewsHomeVC{
    UITableView *tableview;
    NSMutableArray *tableviewData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    tableviewData = [[NSMutableArray alloc] init];

}


#pragma mark -- 增加tableview
- (void)addTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = C_white;
    tableview.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    // 添加动效视图
//    [self addDynamicEffectView];
//    
//    // 自定义loading图
//    imageViewUpLoad = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_W - 40) / 2, -40, 40, 40)];
//    imageViewUpLoad.backgroundColor = [UIColor clearColor];
//    imageViewUpLoad.animationImages = [NSArray arrayWithObjects:
//                                       [UIImage imageNamed:@"loading_1"],
//                                       [UIImage imageNamed:@"loading_2"],
//                                       [UIImage imageNamed:@"loading_3"],
//                                       [UIImage imageNamed:@"loading_4"],nil];
//    [imageViewUpLoad setAnimationDuration:0.6f];
//    imageViewUpLoad.image = [UIImage imageNamed:@"loading_1"];
//    [self.view addSubview:imageViewUpLoad];
//    [self.view bringSubviewToFront:imageViewUpLoad];
    
//    if ([[UIDevice currentDevice] systemVersion].floatValue>=7.0) {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
}


//#pragma mark - 计算headView高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return [FriendsDetailTopView viewHeightWithModel:self.friendsDetailModel];
//}
//
//#pragma mark - build headview
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    friendsDetailTopView = [[FriendsDetailTopView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, [FriendsDetailTopView viewHeightWithModel:self.friendsDetailModel])];
//    friendsDetailTopView.friendsDetailModel = self.friendsDetailModel;
//    friendsDetailTopView.userListArr = friendsUserListDataArr;
//    [friendsDetailTopView addSubviews];
//    
//    return friendsDetailTopView;
//}
//
//#pragma mark - 计算footerView高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.1;
//}

#pragma mark - cell 数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!EMPTY_ARR(tableviewData)) {
        return tableviewData.count;
    }else{
        return 0;
    }
}

#pragma mark - 计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(tableviewData) && tableviewData.count > indexPath.row) {
        NewsDetailModel *model = [tableviewData objectAtIndex:indexPath.row];
        return 100;
    }else{
        return 0;
    }
}



#pragma mark - build cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(tableviewData) && tableviewData.count > indexPath.row ) {
        static NSString *str = @"NewsHomeCell";
        NewsHomeCell *cell = [[NewsHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.friendsPostCellDelegate = self;
//        cell.indexPath = indexPath;
//        cell.postDetailModel = [postCellDataArr objectAtIndex:indexPath.row];
//        [cell buildCell];
        return cell;
    }else{
        return nil;
    }
}

#pragma mark -- 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(tableviewData) && tableviewData.count > indexPath.row) {
        NewsDetailsVC *vc = [[NewsDetailsVC alloc] init];
        NewsDetailModel *model = [tableviewData objectAtIndex:indexPath.row];
//        vc.blogID = model.blog_id;
//        vc.indexRow = indexPath.row;
//        vc.postDetailBackDataDelegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
