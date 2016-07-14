//
//  NewsDetailCell.h
//  SH12321
//
//  Created by Tommy on 7/14/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGTableViewCell.h"
#import "NewsDetailCellModel.h"

@interface NewsDetailCell : TGTableViewCell

@property (nonatomic, strong) NewsDetailCellModel *model;

+ (CGFloat)cellHeightWithModel:(NewsDetailCellModel *)model;

@end
