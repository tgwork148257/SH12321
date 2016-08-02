//
//  NewsDetailsVC.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "NewsDetailsVC.h"
#import "NewsDetailCell.h"

@interface NewsDetailsVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation NewsDetailsVC{
    UITableView *tableview;
    NSMutableArray *tableviewData;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self getNewsList];
}

- (void)viewDidLoad {
    self.navigationTitle = @"新闻详情";
    [super viewDidLoad];
    self.leftBtn.hidden = NO;
    
    tableviewData = [[NSMutableArray alloc] init];
    [self addTableView];
}


#pragma mark -- 增加tableview
- (void)addTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H + TABBAR_H) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = C_WHITE;
    tableview.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
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
        NewsDetailCellModel *model = [tableviewData objectAtIndex:indexPath.row];
        return [NewsDetailCell cellHeightWithModel:model];
    }else{
        return 0;
    }
}



#pragma mark - build cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(tableviewData) && tableviewData.count > indexPath.row ) {
        static NSString *str = @"NewsDetailCell";
        NewsDetailCell *cell = [[NewsDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NewsDetailCellModel *model = [tableviewData objectAtIndex:indexPath.row];
        cell.model = model;
        [cell buildCell];
        return cell;
    }else{
        return nil;
    }
}

- (void)getNewsList{
    [TGRequest getNewsDetailWithId:self.detailModel.newsID  success:^(id responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            NSArray *listData = [responseObject objectForKey:@"data"];
            for (NSDictionary *dic in listData) {
                NewsDetailCellModel *model = [[NewsDetailCellModel alloc] initWithDictionary:dic];
                [tableviewData addObject:model];
            }
            [tableview reloadData];
        }else{
            [TGToast showWithText:@"获取新闻详情失败，请重试"];
        }
    } fail:^{
        [TGToast showWithText:@"获取新闻详情失败，请重试"];
    }];
}


@end
