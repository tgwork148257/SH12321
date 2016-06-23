//
//  SHAreasListVC.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGViewController.h"

@protocol SHAreasListVCDelegate <NSObject>

- (void)backArea:(NSString *)backAreaStr;

@end

@interface SHAreasListVC : TGViewController

@property (nonatomic, weak) id<SHAreasListVCDelegate> delegate;

@end
