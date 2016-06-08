//
//  MMShare.m
//  MM-Community
//
//  Created by JGBmini on 16/4/15.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import "MMShare.h"

@implementation MMShare

+ (instancetype)sharedInstance
{
    static MMShare *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc ] init];
        _sharedInstance.isNewLogin = YES;
        _sharedInstance.isShowTabbar = YES;
    });
    
    return _sharedInstance;
}


@end
