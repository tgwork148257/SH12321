//
//  MeHomeVC.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "MeHomeVC.h"
#import "ReportRecordCell.h"

@interface MeHomeVC () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MeHomeVC{
    UITableView *meHomeTableView;
    NSMutableArray *cellDataArr;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    cellDataArr = [[NSMutableArray alloc] init];
    
    [self addTableView];
}

#pragma mark -- 增加tableview
- (void)addTableView{
    meHomeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, ORIGIN_Y, DEVICE_W, DEVICE_H) style:UITableViewStyleGrouped];
    meHomeTableView.delegate = self;
    meHomeTableView.dataSource = self;
    meHomeTableView.backgroundColor = C_white;
    meHomeTableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.view addSubview:meHomeTableView];
    // 添加动效视图

    
    if ([[UIDevice currentDevice] systemVersion].floatValue>=7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark - 计算headView高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return [meHomeTopView viewHeightWithModel:self.meHomeModel];
    return 0;
}

#pragma mark - build headview
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    meHomeTopView = [[meHomeTopView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, [meHomeTopView viewHeightWithModel:self.meHomeModel])];
//    meHomeTopView.meHomeModel = self.meHomeModel;
//    meHomeTopView.userListArr = friendsUserListDataArr;
//    [meHomeTopView addSubviews];
//    
//    return meHomeTopView;
    return nil;
}

#pragma mark - 计算footerView高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

#pragma mark - 计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(cellDataArr) && cellDataArr.count > indexPath.row) {
        ReportRecordModel *model = [cellDataArr objectAtIndex:indexPath.row];
        return [ReportRecordCell cellHeight];
        return 0;
    }else{
        return 0;
    }
}

#pragma mark - cell 数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!EMPTY_ARR(cellDataArr)) {
        return cellDataArr.count;
    }else{
        return 0;
    }
}

#pragma mark - build cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(cellDataArr) && cellDataArr.count > indexPath.row ) {
        static NSString *str = @"ReportRecordCell";
        ReportRecordCell *cell = [[ReportRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.friendsPostCellDelegate = self;
        cell.model = [cellDataArr objectAtIndex:indexPath.row];
        [cell buildCell];
        return cell;
    }else{
        return nil;
    }
}

#pragma mark -- 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (!EMPTY_ARR(cellDataArr) && cellDataArr.count > indexPath.row) {
//        PostDetialViewController *vc = [[PostDetialViewController alloc] init];
//        PostDetailModel *model = [cellDataArr objectAtIndex:indexPath.row];
//        vc.blogID = model.blog_id;
//        vc.indexRow = indexPath.row;
//        vc.postDetailBackDataDelegate = self;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
}



@end
