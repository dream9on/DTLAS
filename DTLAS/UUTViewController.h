//
//  UUTView.h
//  DTLAS
//
//  Created by Dylan Xiao on 2019/5/22.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DetailWindowController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UUTViewController : NSViewController
{
    DetailWindowController *dw;
    NSTimer *timer;
    NSTimer *timer2;
    __weak IBOutlet NSProgressIndicator *progressIndicator;
}
@property NSString * SN;
@property NSString * result;
@property NSString * time;

@property (weak) IBOutlet NSTextField *lbl_SN;
@property (weak) IBOutlet NSTextField *lbl_Result;
@property (weak) IBOutlet NSTextField *lbl_Time;
- (IBAction)Btn_Detail:(NSButton *)sender;
-(instancetype)initWithSN:(NSString *)SN result:(NSString *)result time:(NSString *)time;
@end

NS_ASSUME_NONNULL_END
