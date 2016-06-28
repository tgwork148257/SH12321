//
//  SHOperatorsListVC.h
//  SH12321
//
//  Created by Tommy on 6/28/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGViewController.h"

@protocol SHOperatorsListVCDelegate <NSObject>

- (void)backOperators:(NSString *)backOperatorsStr;

@end

@interface SHOperatorsListVC : TGViewController

@property (nonatomic, weak) id<SHOperatorsListVCDelegate> delegate;

@property (nonatomic, strong) NSArray *tableviewData;

@end