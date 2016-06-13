//
//  TGRequest.h
//  SH12321
//
//  Created by Tommy on 6/13/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TGRequest : NSObject


+ (void)getDeviceToken;

+(void)TestAFN;



#pragma mark -- 举报骚扰电话接口
+ (void)commitReportCrankCallWithUrlStr:(NSString *)urlStr parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void(^)())fail;

@end
