//
//  ReportRecordListVC.m
//  SH12321
//
//  Created by Tommy on 7/4/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "ReportRecordListVC.h"
#import "ReportRecordCell.h"
#import "ReportRecordDetailVC.h"
#import "MJRefresh.h"

@interface ReportRecordListVC () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ReportRecordListVC{
    UITableView *tableView;
    NSMutableArray *cellDataArr;
    NSInteger page;
}

- (void)viewDidLoad{
    self.navigationTitle = @"我";
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    page = 1;
    
    cellDataArr = [[NSMutableArray alloc] init];
    
    [self addTableView];
}

#pragma mark -- 增加tableview
- (void)addTableView{
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, ORIGIN_Y, DEVICE_W, DEVICE_H) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = C_WHITE;
    tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    
    //上拉刷新
    __unsafe_unretained __typeof(self) weakSelf = self;
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getReportList];
    }];
    
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

#pragma mark - cell 数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!EMPTY_ARR(cellDataArr)) {
        return cellDataArr.count;
    }else{
        return 0;
    }
}

#pragma mark - 计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ReportRecordCell cellHeight];
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
        if (!EMPTY_ARR(cellDataArr) && cellDataArr.count > indexPath.row) {
            ReportRecordDetailVC *vc = [[ReportRecordDetailVC alloc] init];
            ReportDataModel *model = [cellDataArr objectAtIndex:indexPath.row];
            vc.data = model;
            [self.navigationController pushViewController:vc animated:YES];
        }
}


- (void)getReportList{
    [TGRequest getReportListWithPage:page  success:^(id responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            NSDictionary *listDic = [responseObject objectForKey:@"code"];
            for (NSDictionary *dic in [listDic objectForKey:@"list"]) {
                ReportDataModel *model = [[ReportDataModel alloc] initWithDictionary:dic];
                [cellDataArr addObject:model];
            }
            page ++;
            dispatch_async(main_queue, ^{
                [tableView.mj_header endRefreshing]; //没有更多数据
                [tableView reloadData];
            });
        }
    } fail:^{
        dispatch_async(main_queue, ^{
            [tableView.mj_header endRefreshing]; //没有更多数据
        });
    }];
}

@end
