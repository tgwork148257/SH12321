//
//  SHStreetsListVC.m
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SHStreetsListVC.h"

#define cellH 64.0F

@interface SHStreetsListVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SHStreetsListVC{
    UITableView *tableview;
    NSArray *tableviewData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableviewData = @[@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路",@"肇嘉浜路"];
    [self addTableView];
}


#pragma mark -- 增加tableview
- (void)addTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H) style:UITableViewStylePlain];
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
        //        NewsDetailModel *model = [tableviewData objectAtIndex:indexPath.row];
        return cellH;
    }else{
        return 0;
    }
}



#pragma mark - build cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(tableviewData) && tableviewData.count > indexPath.row ) {
        static NSString *str = @"TableViewCell";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W, cellH) text:[tableviewData objectAtIndex:indexPath.row] textColor:C_BLACK textFont:FONTSIZE14 textAlignment:NSTextAlignmentLeft superView:cell];
        label.numberOfLines = 1;
        return cell;
    }else{
        return nil;
    }
}

#pragma mark -- 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(tableviewData) && tableviewData.count > indexPath.row) {
        if ([self.delegate respondsToSelector:@selector(selectStreet:)]) {
            [self.delegate selectStreet:[tableviewData objectAtIndex:indexPath.row]];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
