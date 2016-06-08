//
//  MMJsonUtils.h
//  MM-Community
//
//  Created by meimi on 4/16/16.
//  Copyright © 2016 Meime. All rights reserved.
//

@interface MMJsonUtils : NSObject

//+ (void)set:(id)value for:(id)target;
//
//+ (void)NSIntegerJsonDic:(NSDictionary *)dic key:(NSString *)key;

//Json类型安全判断,根据字段的类型,把json获取的值,赋值给相应的字段

+(NSInteger)JsonInteger:(id)value;

+(NSString *)JsonStr:(id)value;

+(int)JsonInt:(id)value;

+(float)JsonFloat:(id)value;

+(long)JsonLong:(id)value;

@end
