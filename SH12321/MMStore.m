//
//  MMStore.m
//  MM-Community
//
//  Created by meimi on 3/1/16.
//  Copyright © 2016 Meime. All rights reserved.
//

#import "MMStore.h"

static NSString *const GOODS_INFO_CACHE_KEY = @"goodsInfoCacheKey";
static NSString *const IMAGE_BRAND_GOODS_TAG_CACHE_KEY = @"imageBrandGoodsTagCacheKey";


@implementation MMStore

#pragma mark - 更新商品缓存
+ (void)updateGoodsInfoWithModel:(MMGoodsModel *)model {
    NSArray *arrayCoding = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [arrayCoding lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"GOODS_INFO_CACHE_KEY"];
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
}


#pragma mark - 更新图片标签缓存
+ (void)updateImageTagInfoWithModel:(MMImageBrandsGoodsTagModel *)model {
    NSArray *arrayCoding = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [arrayCoding lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"IMAGE_BRAND_GOODS_TAG_CACHE_KEY"];
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
}


@end
