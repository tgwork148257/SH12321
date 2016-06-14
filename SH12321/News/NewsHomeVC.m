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
    self.leftBtn.hidden = YES;
    
    tableviewData = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        NewsDetailModel *model = [[NewsDetailModel alloc] init];
        model.newsContent = @"ccc";
        [tableviewData addObject:model];
    }
    [self addTableView];
}


#pragma mark -- 增加tableview
- (void)addTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = C_white;
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
        vc.model = model;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
