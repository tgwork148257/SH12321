//
//  SHIllegalReasonListVC.h
//  SH12321
//
//  Created by Tommy on 6/28/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGViewController.h"



@protocol SHIllegalReasonListVCDelegate <NSObject>

- (void)backIllegalReason:(NSString *)backReasonStr;

@end

@interface SHIllegalReasonListVC : TGViewController

@property (nonatomic, weak) id<SHIllegalReasonListVCDelegate> delegate;

@property (nonatomic, strong) NSArray *tableviewData;

@end
