//
//  RequsetData.m
//  MM-Community
//
//  Created by meimi on 16/1/20.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import "RequsetData.h"

@implementation RequsetData

- (instancetype)init{
    if (self == [super init]) {
        _isSuccess = NO;
        _requsetCodeStr = nil;
        _dataDic = [NSDictionary dictionary];
        _isDicHasData = NO;
        _requsetCode = 0;
    }
    return self;
}

@end
