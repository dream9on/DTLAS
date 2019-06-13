//
//  UUTView.m
//  DTLAS
//
//  Created by Dylan Xiao on 2019/5/22.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "UUTViewController.h"

@interface UUTViewController ()

@end

@implementation UUTViewController


-(instancetype)initWithSN:(NSString *)SN result:(NSString *)result time:(NSString *)time
{
    if (self = [super init]) {
        _SN = SN;
        _result= result;
        _time = time;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.view.wantsLayer = YES;
    
    float r = (rand()%255)/255.0;
    float g = (random()%255)/255.0;
    float b = (random()%255)/255.0;
    NSColor *color = [NSColor colorWithRed:r green:g blue:b alpha:1];
    
    self.view.layer.backgroundColor =color.CGColor;
    
    if (_SN) {
        self.lbl_SN.stringValue = _SN;
    }
    if (_result) {
        self.lbl_Result.stringValue = _result;
    }
    if (_time) {
        self.lbl_Time.stringValue = _time;
    }
    
    [self runTimer];
    [self runTimer2];
}

- (IBAction)Btn_Detail:(NSButton *)sender {
    dw = [[DetailWindowController alloc] initWithWindowNibName:@"DetailWindowController"];
    // [self.window addChildWindow:dw.window ordered:NSWindowAbove];
    [dw showWindow:self];
    // [[NSApplication sharedApplication].keyWindow addChildWindow:dw.window ordered:NSWindowOut];
}


-(void)runTimer
{
    timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.lbl_Time.intValue++;
        //NSLog(@"timer.firetime \n%@= %@",timer,timer.fireDate);
        if (self.lbl_Time.intValue >=50) {
            [timer invalidate]; // stop timer
            self.lbl_Result.stringValue = @"PASS";
        }
    }];
    
    // 先添加到runloop 中才能执行 timer fire
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    [timer fire];
}


// 进度条
-(void)runTimer2
{
    __block int cnt_min=0,cnt_max=0;
    timer2 = [NSTimer timerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (self->progressIndicator.doubleValue == self->progressIndicator.minValue) {
            cnt_min++;
        }
        if (self->progressIndicator.doubleValue == self->progressIndicator.maxValue) {
            cnt_max++;
        }
        
        if (cnt_max<cnt_min) {
            [self->progressIndicator incrementBy:10];
        }else
        {
            [self->progressIndicator incrementBy:-10];
        }
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSDefaultRunLoopMode];
    [timer2 fire];
}



@end
