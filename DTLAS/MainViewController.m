//
//  MainViewController.m
//  DTLAS
//
//  Created by Dylan Xiao on 2019/5/22.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)Btn_Show:(NSButton *)sender {
    
    // 0.清除目前的childViewController.view
    for (UUTViewController *vc in self.childViewControllers) {
        [vc.view removeFromSuperview];
        [vc removeFromParentViewController];
    }
    
    // 1.计算window 及 view 的尺寸
    int x= self.lbl_x.intValue;
    int y= self.lbl_y.intValue;
    UUTViewController *childView = [[UUTViewController alloc] init];
    NSSize size = NSMakeSize(10+(10+childView.view.frame.size.width)*x, (10+childView.view.frame.size.height)*y+60+22);
    [self.view setFrameSize:size];
    [self.view.window setMaxSize:size];
    [self.view.window setMinSize:childView.view.frame.size];
    [self.view.window setFrame:NSMakeRect(0, 0, size.width, size.height) display:YES];
    [self.view.window center];
    
    // 2. 计算每个view的position
    for (int row = 0; row < y; row++) {
        for(int col = 0; col <x ; col++)
        {
            //2.1. 取得number
            int number = x*(y-1-row)+1+col;   // x表示列数,y表示行数, number 从最后一行倒数 如4*3 则 从9->10->11->12
            NSString *csn =[NSString stringWithFormat:@"SN_%03d",number];
            UUTViewController * childView = [[UUTViewController alloc] initWithSN:csn result:@"result" time:@"time"];
            
            //2.2. 计算当前view 原点位置 行列间距10，初始高度50
            NSPoint origin = NSMakePoint((10+childView.view.frame.size.width)*col+10,(10+childView.view.frame.size.height)*row+60);
            
            [childView.view setFrameOrigin:origin];
            
            //2.3. 添加到当前childControllerView
            [self addChildViewController:childView];
            
            //2.4. 添加view到父view上
            [self.view addSubview:childView.view];
        }
    }
    
    //NSLog(@"self.childviewController.count = %ld",self.childViewControllers.count);
}
@end
