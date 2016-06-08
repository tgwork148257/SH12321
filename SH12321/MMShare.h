//
//  MMShare.h
//  MM-Community
//
//  Created by JGBmini on 16/4/15.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMShare : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign) BOOL isNewLogin;   // 是否新账号登录 用于tabbar切换   yes-是  no-否

@property (nonatomic, assign) BOOL isShowTabbar;   // 是否显示Tabbar   yes-显示  no-隐藏



@end
