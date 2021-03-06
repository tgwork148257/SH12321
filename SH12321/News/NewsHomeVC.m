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
#import "MJRefresh.h"

@interface NewsHomeVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation NewsHomeVC{
    UITableView *tableview;
    NSMutableArray *tableviewData;
    NSInteger page;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showTabbar];
    [self addTableView];
}

- (void)viewDidLoad {
    self.navigationTitle = @"新闻";
    
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    page = 1;
    
    tableviewData = [[NSMutableArray alloc] init];
//    [self addTableView];
}


#pragma mark -- 增加tableview
- (void)addTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, ORIGIN_Y, DEVICE_W, DEVICE_H - ORIGIN_Y) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = C_WHITE;
    tableview.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    //上拉刷新
    __unsafe_unretained __typeof(self) weakSelf = self;
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getNewsList];
    }];
    
    [tableview.mj_footer beginRefreshing];

    if ([[UIDevice currentDevice] systemVersion].floatValue>=7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

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
//        NewsDetailModel *model = [tableviewData objectAtIndex:indexPath.row];
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
        NewsDetailModel *model = [tableviewData objectAtIndex:indexPath.row];
        cell.model = model;
        [cell buildCell];
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
        vc.detailModel = model;
        [self.navigationController pushViewController:vc animated:YES];
        [self hiddenTabbar];
    }
}

- (void)getNewsList{
    [TGRequest getNewsListWithPage:page  success:^(id responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            [tableviewData removeAllObjects];
            NSDictionary *listDic = [responseObject objectForKey:@"data"];
            for (NSDictionary *dic in [listDic objectForKey:@"list"]) {
                NewsDetailModel *model = [[NewsDetailModel alloc] initWithDictionary:dic];
                [tableviewData addObject:model];
            }
            page ++;
            dispatch_async(main_queue, ^{
                [tableview reloadData];
                [tableview.mj_footer endRefreshing];
            });
        }else{
            dispatch_async(main_queue, ^{
                [tableview.mj_footer endRefreshing];
            });
        }
        
        if (tableviewData.count < 20) {
            tableview.mj_footer.hidden = YES;
        }
    } fail:^{
        dispatch_async(main_queue, ^{
            [tableview.mj_footer endRefreshing]; //没有更多数据
            
            if (tableviewData.count < 20) {
                tableview.mj_footer.hidden = YES;
            }
        });
    }];
}


@end
