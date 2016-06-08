//
//  MMStore.h
//  MM-Community
//
//  Created by meimi on 3/1/16.
//  Copyright © 2016 Meime. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MMGoodsModel;
@class MMImageBrandsGoodsTagModel;


@interface MMStore : NSObject

#pragma mark - 更新商品缓存
+ (void)updateGoodsInfoWithModel:(MMGoodsModel *)model;

#pragma mark - 获取商品缓存
+ (MMGoodsModel *)getGoodsInfoCacheData;

#pragma mark - 更新图片标签缓存
+ (void)updateImageTagInfoWithModel:(MMImageBrandsGoodsTagModel *)model;

#pragma mark - 获取图片标签缓存
+ (MMImageBrandsGoodsTagModel *)getImageTagInfoCacheData;



@end
