//
//  ParseRequestErrorData.m
//  MM-Community
//
//  Created by meimi on 16/1/20.
//  Copyright © 2016年 Meime. All rights reserved.
//

#import "ParseRequestErrorData.h"

static NSString * const DEFAULT_ERROR_STR = @"系统繁忙, 请稍后再试";

@implementation ParseRequestErrorData


+ (NSString *)parseRequestErrorCodeStrWithUrl:(NSString *)url errorCode:(NSInteger)code{
    NSString *errorCodeStr;
    if([url rangeOfString:@"/"].location != NSNotFound){ // 是否包含"/"
        NSArray *linkArr = [url componentsSeparatedByString:@"/"];
        if (linkArr.count > 0) {
            NSString *keyStr = [NSString stringWithFormat:@"%@%@", [linkArr objectAtIndex:1], [NSString stringWithFormat:@"%ld", (long)code]];
            errorCodeStr = NSLocalizedString(keyStr, @"");
            if ([errorCodeStr isEqualToString:keyStr]) {
                errorCodeStr = DEFAULT_ERROR_STR;
            }
        }else {
            errorCodeStr = DEFAULT_ERROR_STR;
        }
    }else {
        errorCodeStr = DEFAULT_ERROR_STR;
    }
    
    return errorCodeStr;
}


#define CURR_LANG                        ([[NSLocale preferredLanguages] objectAtIndex:0])
- (NSString *)DPLocalizedString:(NSString *)translation_key {
    NSString * s = NSLocalizedString(translation_key, nil);
    //NSString * s = NSLocalizedStringFromTable(@"trainTitle",@"文件名",@"");
    if (![CURR_LANG isEqual:@"en"] && ![CURR_LANG isEqual:@"it"]) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"it" ofType:@"lproj"];
        NSBundle * languageBundle = [NSBundle bundleWithPath:path];
        s = [languageBundle localizedStringForKey:translation_key value:@"" table:nil];
    }
    return s;
}






@end
