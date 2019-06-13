//
//  CollectionViewItem.m
//  DTLAS
//
//  Created by Dylan Xiao on 2019/6/11.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "CollectionViewItem.h"

@interface CollectionViewItem ()

@end

@implementation CollectionViewItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.view.wantsLayer = YES;
    float r = (rand()%255)/255.0;
    float g = (random()%255)/255.0;
    float b = (random()%255)/255.0;
    NSColor *color = [NSColor colorWithRed:r green:g blue:b alpha:1];
    
    self.view.layer.backgroundColor =color.CGColor;
    
    self.lbl_SN.stringValue = _SN;
}

- (IBAction)Btn_START:(NSButton *)sender {
    self.lbl_SN.intValue++;
}
@end
