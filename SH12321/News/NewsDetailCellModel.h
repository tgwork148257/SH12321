//
//  NewsDetailCellModel.h
//  SH12321
//
//  Created by Tommy on 7/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGModel.h"

@interface NewsDetailCellModel : TGModel

@property (nonatomic, copy) NSString *type;  //1, 文字  2.图片

@property (nonatomic, copy) NSString *text;     //文字

@property (nonatomic, copy) NSString *imageURL;  //图片地址

@property (nonatomic, assign) NSInteger width;   //图片宽度

@property (nonatomic, assign) NSInteger height;   //图片高度

@end
