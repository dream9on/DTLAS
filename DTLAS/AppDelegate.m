//
//  AppDelegate.m
//  DTLAS
//
//  Created by Dylan Xiao on 2019/5/22.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//


/*
 说明：
 本章节为了实现多窗口viewcontroller切换， MainMenu->MainViewController->UUTView->DetailWindow
 
 
 */

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSMutableArray *vcArray;
}

- (IBAction)Btn_NewWindow:(NSButton *)sender;

- (IBAction)Btn_Click:(NSButton *)sender;

- (IBAction)Btn_AddOtherView:(NSButton *)sender;


@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.window center];
    NSLog(@"self.window.frame:[%.f:%.f]",self.window.frame.size.width,self.window.frame.size.height);
    vcArray =[[NSMutableArray alloc] init];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



//1. 产生新窗口 Window
- (IBAction)Btn_NewWindow:(NSButton *)sender {
    [self initMainWindow];
}

- (void)initMainWindow{
    if (!_mainWindowController)
        _mainWindowController= [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
    
    //[[_mainWindowController window] center];
    [_mainWindowController.window orderFront:nil];
    
    float r = (rand()%255)/255.0;
    float g = (random()%255)/255.0;
    float b = (random()%255)/255.0;
    NSColor *color = [NSColor colorWithRed:r green:g blue:b alpha:1];
    _mainWindowController.window.backgroundColor = color;
    //_mainWindowController.window.styleMask =NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskClosable |NSWindowStyleMaskTitled |NSWindowStyleMaskResizable|NSWindowStyleMaskBorderless;
    
    /*  以下创建时OK 但是窗口关闭时异常 内存报错
     NSWindow win1 = [[NSWindow alloc] init];
     win1.backgroundColor = [NSColor purpleColor];
     //win1.styleMask = NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable;
     [self.window addChildWindow:win1 ordered:NSWindowAbove];
     
     //win1.styleMask = NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskClosable |NSWindowStyleMaskTitled |NSWindowStyleMaskResizable&NSWindowStyleMaskBorderless;
     
     win1.styleMask = self.window.styleMask;
     NSLog(@"win1.stylemask = %lu",(unsigned long)win1.styleMask);
     //[win1 setIsZoomed:YES];
     */
}


//2. 创建新的VIEW : 在现有WINDOW下直接加载view
- (IBAction)Btn_Click:(NSButton *)sender {
    
    UUTViewController *uv1 = [[UUTViewController alloc] init];
    UUTViewController *uv2 = [[UUTViewController alloc] init];
    
    // 1.设置两个VIEW的原点 避开左边控件:153,间距为10 高度:10
    [uv1.view setFrameOrigin:NSMakePoint(163, 10)];
    [uv2.view setFrameOrigin:NSMakePoint(173+uv1.view.frame.size.width, 10)];
    
    // 2.将对象加入数组保持持久，避免被释放导致控件无法使用
    [vcArray addObject:uv1];
    [vcArray addObject:uv2];
    
    // 3.设置view尺寸
    [self.window.contentView setFrameSize:NSMakeSize(183+uv1.view.frame.size.width*2, 32+uv1.view.frame.size.height+22)];
    self.window.contentView.wantsLayer = YES;
    self.window.contentView.layer.backgroundColor = [NSColor greenColor].CGColor;
    
    // 4.设置window尺寸和颜色: window 要设置Full Size Content view,title 高度包含在Windows窗口内
    self.window.backgroundColor = [NSColor blueColor];
    [self.window setFrame:self.window.contentView.frame display:YES]; // 重新绘制图层YES
    //self.window.styleMask =self.window.styleMask | NSWindowStyleMaskFullSizeContentView;

    // 5.添加子VIEW
    [self.window.contentView addSubview:uv1.view];
    [self.window.contentView addSubview:uv2.view];

    // 6.窗口居中
    [self.window center];
}

//3. 将Window的content view controller 设置为自定义viewcontroller
- (IBAction)Btn_AddOtherView:(NSButton *)sender {
    
    UUTViewController *uv1 = [[UUTViewController alloc] initWithSN:@"UV1" result:@"PASS" time:@"009"];
    UUTViewController *uv2 = [[UUTViewController alloc] initWithSN:@"UV2" result:@"fail" time:@"001"];
    
    // 1.设置两个VIEW的原点 间距为10 高度:10
    [uv1.view setFrameOrigin:NSMakePoint(10, 50)];
    [uv2.view setFrameOrigin:NSMakePoint(20+uv1.view.frame.size.width, 50)];
    
    // 2.将 MainViewController 替换默认的view
    //self.window.contentViewController = [[NSViewController alloc] init];  // 一定要指定bundle name 直接init 无法使用
    MVC = [[MainViewController alloc] init];
    self.window.contentViewController =MVC;
    
    // 2.将对象加入数组保持持久，避免被释放导致控件无法使用
    [MVC addChildViewController:uv1];
    [MVC addChildViewController:uv2];
    
    // 3.设置view尺寸
    [self.window.contentView setFrameSize:NSMakeSize(30+uv1.view.frame.size.width*2, 60+uv1.view.frame.size.height+32)];
    self.window.contentView.wantsLayer = YES;
    self.window.contentView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    
    // 4.设置window尺寸和颜色: window 要设置Full Size Content view,title 高度包含在Windows窗口内
    self.window.backgroundColor = [NSColor blueColor];
    [self.window setFrame:self.window.contentView.frame display:YES]; // 重新绘制图层YES
    //self.window.styleMask =self.window.styleMask | NSWindowStyleMaskFullSizeContentView;
    
    // 5.添加子VIEW
    [self.window.contentView addSubview:uv1.view];
    [self.window.contentView addSubview:uv2.view];
    
    // 6.窗口居中
    [self.window center];
    
}


-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}
@end
