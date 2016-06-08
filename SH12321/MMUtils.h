//
//  MMUtils.h
//  MM-Community
//
//  Created by meimi on 16/2/17.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^InfoBlock) ();


@class TGViewController;
@interface MMUtils : NSObject

/*
 *获取当前显示的viewController
 */
+ (TGViewController *)currentVCWithCurrentView:(UIView *)view;

/*
 *获取当前显示的NavigationController
 */
+ (UINavigationController *)currentNavWithView:(UIView *)view;

/*
 *提示label
 *
 */

+ (void)showInfo:(NSString *)showText view:(UIView *)view;

+ (void)showInfo:(NSString *)showText viewController:(UIViewController *)viewController;

+ (void)showInfo:(NSString *)showText show:(InfoBlock)showBlock  dismiss:(InfoBlock)dismissBlock viewController:(UIViewController *)viewController;



+ (NSString *)createPublishImageJsonStrWithData:(NSArray *)arr;

+ (NSString *)createScheduleTimeSettingJsonWithData:(NSDictionary *)dic;

//评论中计算评论内容的左间距
+ (CGFloat)commentContentX:(CGFloat)contentW;

// 上拉加载 没有更多数据后
+ (void)endRefreshingWithNoMoreDataDismissWithTableView:(UITableView *)tableView;


//压缩图片
+ (NSData *)compressImage:(UIImage *)image;


//日期相关
+ (NSString *)getWeekDays; //获取星期几

+ (NSString *)minuteOrHourConvertToStr:(NSInteger)minuteOrHour;
+ (NSString *)dayOrMonthConvertToStr:(NSInteger)dayOrMonth;

+ (NSInteger)currentDayWithDate:(NSDate *)date;

+ (NSInteger)currentMonthWithDate:(NSDate *)date;

+ (NSInteger)currentYearWithDate:(NSDate *)date;

+ (NSString *)currentDateStrWithDate:(NSDate *)date;

//判断日期是否在今天之前
+ (BOOL)isDateBeforeNow:(NSString *)targetDateStr;

//判断计划完成按钮是否可以点击
+ (BOOL)isCompletedBtnCanClick:(NSString *)targetDateStr;

//中英文计算字符长度
+ (NSInteger)countTextLength:(NSString *)str;

//去掉字符串的空格
+ (NSString *)removeStrSpace:(NSString *)str;

//判断Tableview 数组数据
+ (BOOL)isCorrectArr:(NSArray *)arr index:(NSInteger)index;

//Show Munu
+ (void)showMenuWithSuperView:(UIView *)superView;

//识别字符串的网址并返回
+ (NSArray *)matchWebsiteOrTopicStr:(NSString *)sourceStr;

#pragma mark - 超链接字符串转换
+ (NSAttributedString *)attributedString:(NSArray *__autoreleasing *)outURLs
                               URLRanges:(NSArray *__autoreleasing *)outURLRanges
                              contentStr:(NSString *)contentStr
                                textFont:(UIFont *)font
                               textColor:(UIColor *)color;
@end
