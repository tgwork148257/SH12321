//
//  TGViewController.h
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^InfoBlock) ();

@interface TGViewController : UIViewController

//@property (nonatomic, strong) UIView *allContentView;                 //包含所以视图的自定义view

@property (nonatomic, strong) UIView *infoView;                         // 提示背景
@property (nonatomic, strong) UILabel *infoLabel;                       // 提示文字

@property (nonatomic, strong) UIView *navigationView;                   //导航栏view
@property (nonatomic, strong) UILabel *navigationLabel;                 //导航栏标题

@property (nonatomic, strong) UIButton *leftBtn;                        //导航栏返回按钮

@property (nonatomic, strong) UIButton *rightBtn;                       //导航栏右边按钮

//@property (nonatomic, strong) UIButton *rightTitleBtn;                  //导航栏右边文字按钮

@property (nonatomic, copy) InfoBlock showBlock;

@property (nonatomic, copy) InfoBlock dismissBlock;


#pragma mark - 提示信息
- (void)showInfo:(NSString *)showText show:(InfoBlock)showBlock dismiss:(InfoBlock)dismissBlock;


#pragma mark -- 导航栏左边按钮点击
- (void)leftBtnDidClick;

#pragma mark -- 导航栏右边按钮点击
- (void)rightBtnDidClick;

//#pragma mark -- 导航栏右边文字按钮点击
//- (void)rightTitleBtnDidClick;

#pragma mark -- 隐藏tabbar
- (void)hiddenTabbar;

#pragma mark -- 显示tabbar
- (void)showTabbar;

- (void)setRightTitleStyle;

@end
