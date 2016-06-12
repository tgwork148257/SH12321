//
//  RequsetData.h
//  MM-Community
//
//  Created by meimi on 16/1/20.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequsetData : NSObject

@property (nonatomic, assign) BOOL isSuccess;                       // code值是否为200

@property (nonatomic, assign) BOOL isDicHasData;                    // data是否有数据    yes->有  no->没有

@property (nonatomic, strong) NSDictionary *dataDic;                //请求数据

@property (nonatomic, copy) NSString *requsetCodeStr;                 // code对应信息

@property (nonatomic, assign) NSInteger requsetCode;                  // code值

@end
