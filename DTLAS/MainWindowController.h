//
//  MainWindowController.h
//  DTLAS
//
//  Created by Dylan Xiao on 2019/6/6.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainWindowController : NSWindowController<NSCollectionViewDelegate>
{
    NSMutableArray *dataSource;
}
@property (weak) IBOutlet NSCollectionView *CollectionView;
- (IBAction)Btn_ClickAdd:(NSButton *)sender;
@property (weak) IBOutlet NSTextField *lbl_Info;

@end

NS_ASSUME_NONNULL_END
