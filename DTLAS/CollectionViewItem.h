//
//  CollectionViewItem.h
//  DTLAS
//
//  Created by Dylan Xiao on 2019/6/11.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewItem : NSCollectionViewItem
@property NSString *SN;
@property NSString *Result;
@property double testTime;


@property (weak) IBOutlet NSTextField *lbl_SN;

- (IBAction)Btn_START:(NSButton *)sender;

@end

NS_ASSUME_NONNULL_END
