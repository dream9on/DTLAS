//
//  MainViewController.h
//  DTLAS
//
//  Created by Dylan Xiao on 2019/5/22.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "UUTViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : NSViewController
@property (weak) IBOutlet NSTextField *lbl_x;
@property (weak) IBOutlet NSTextField *lbl_y;
- (IBAction)Btn_Show:(NSButton *)sender;

@end

NS_ASSUME_NONNULL_END
