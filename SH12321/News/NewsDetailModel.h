//
//  NewsDetailModel.h
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGModel.h"

@interface NewsDetailModel : TGModel

@property (nonatomic, copy) NSString *newsID;

@property (nonatomic, copy) NSString *newsTitle;

@property (nonatomic, copy) NSString *newsTime;

@property (nonatomic, copy) NSString *newsSource;

@property (nonatomic, copy) NSString *newsPicUrlStr;

@property (nonatomic, copy) NSString *newsContent;

@end
