//
//  SHOperatorsListVC.m
//  SH12321
//
//  Created by Tommy on 6/28/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "SHOperatorsListVC.h"

#define cellH 64.0F

@interface SHOperatorsListVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SHOperatorsListVC{
    UITableView *tableview;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableviewData = @[@"阿里",
                       @"爱施德",
                       @"巴士在线",
                       @"北京青牛",
                       @"长江",
                       @"二六三",
                       @"分享在线",
                       @"凤凰石",
                       @"凤凰资产",
                       @"富士康",
                       @"海尔",
                       @"广州博元",
                       @"国美",
                       @"海信",
                       @"合一信息",
                       @"恒大和",
                       @"红豆集团",
                       @"华翔联信",
                       @"话机世界",
                       @"京东",
                       @"朗玛",
                       @"乐语",
                       @"连连",
                       @"鹏博士",
                       @"民生电子",
                       @"平安通信",
                       @"日日顺",
                       @"三五互联",
                       @"世纪互联",
                       @"苏宁",
                       @"苏州蜗牛",
                       @"天音",
                       @"万网",
                       @"小米",
                       @"星美",
                       @"银盛支付",
                       @"用友",
                       @"远特",
                       @"中期",
                       @"中兴视通",
                       @"中邮世纪",
                       @"中国移动",
                       @"中国联通",
                       @"中国电信",];
    
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
        label.numberOfLines = 1;
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
        if ([self.delegate respondsToSelector:@selector(backOperators:)]) {
            [self.delegate backOperators:[_tableviewData objectAtIndex:indexPath.row]];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

@end
