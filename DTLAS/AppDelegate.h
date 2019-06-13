//
//  AppDelegate.h
//  DTLAS
//
//  Created by Dylan Xiao on 2019/5/22.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainViewController.h"
#import "UUTViewController.h"
#import "MainWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    MainViewController *MVC;
}

@property (strong) MainWindowController *mainWindowController;
@end

