//
//  BaseWindow.h
//  DTLAS
//
//  Created by Dylan Xiao on 2019/6/6.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//


/*
 准备工作
 一、orderFront 跳转
 close 返回
 二、模态窗口及关闭方法
 监听 NSWindowWillCloseNotification
 1、Modal windows
 2、Modal sessions
 参考资料：
 准备工作
 
 思路：使用 xib 来创建 NSWindowController，并让后续的调用都继承自这个类。不使用 storyboard。
 
 1、创建项目时，不勾选 Use Storyboards 选项；
    创建出来的项目就包含 MainMenu.xib。
 
 2、创建 BaseWindow，继承自 NSWindow.
 
 3、创建 MainWindowController 继承自 NSWindowController，勾选 Also create XIB file for user interface。
 
 4、创建好3以后，在MainWindowController.xib中选中Window，将它的继承类改成我们前面2中自定义的BaseWindow。
 
 5、在AppDelegate.m文件类中删除 @property (weak) IBOutlet NSWindow *window;代码，
 
 6、并在MainMenu.xib中选中Window,删除该Window。
 
 7、在AppDelegate.h文件中引用MainWindowController.h文件创建其对象。注意写在 .h 而非 .m 里面，方便后续其他文件调用。
 ---------------------
 作者：lovechris00
 来源：CSDN
 原文：https://blog.csdn.net/lovechris00/article/details/77922445
 版权声明：本文为博主原创文章，转载请附上博文链接！
 */


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseWindow : NSWindow

@end

NS_ASSUME_NONNULL_END
