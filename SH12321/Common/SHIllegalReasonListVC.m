//
//  SHIllegalReasonListVC.m
//  SH12321
//
//  Created by Tommy on 6/28/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SHIllegalReasonListVC.h"

#define cellH 64.0F

@interface SHIllegalReasonListVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SHIllegalReasonListVC{
    UITableView *tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    if (!EMPTY_ARR(_tableviewData)) {
        return _tableviewData.count;
    }else{
        return 0;
    }
}

#pragma mark - 计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(_tableviewData) && _tableviewData.count > indexPath.row) {
        return cellH;
    }else{
        return 0;
    }
}



#pragma mark - build cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(_tableviewData) && _tableviewData.count > indexPath.row ) {
        static NSString *str = @"TableViewCell";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        TGLabel *label = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W, cellH - 1) text:[_tableviewData objectAtIndex:indexPath.row] textColor:C_BLACK textFont:FONTSIZE14 textAlignment:NSTextAlignmentLeft superView:cell];
        label.numberOfLines = 2;
        TGView *view = [TGView initWithFrame:CGRectMake(0, label.y + label.height, MIDDLE_W, 1) superView:cell];
        view.backgroundColor = C_LINE;
        return cell;
    }else{
        return nil;
    }
}

#pragma mark -- 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!EMPTY_ARR(_tableviewData) && _tableviewData.count > indexPath.row) {
        if ([self.delegate respondsToSelector:@selector(backIllegalReason:)]) {
            [self.delegate backIllegalReason:[_tableviewData objectAtIndex:indexPath.row]];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

@end
