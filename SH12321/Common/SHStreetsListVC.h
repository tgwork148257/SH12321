//
//  SHStreetsListVC.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGViewController.h"

@protocol SHStreetsListVCDelegate <NSObject>

- (void)selectStreet:(NSString *)streetStr;

@end

@interface SHStreetsListVC : TGViewController

@property (nonatomic, weak) id<SHStreetsListVCDelegate> delegate;

@end
