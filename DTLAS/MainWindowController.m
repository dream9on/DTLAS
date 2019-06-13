//
//  MainWindowController.m
//  DTLAS
//
//  Created by Dylan Xiao on 2019/6/6.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "MainWindowController.h"
#import "CollectionViewItem.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    dataSource= [NSMutableArray array];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)Btn_ClickAdd:(NSButton *)sender {
    self.lbl_Info.integerValue++;
    
    CollectionViewItem *item = [[CollectionViewItem alloc] init];
    item.SN = _lbl_Info.stringValue;
    //[item.view awakeFromNib];
    
    [dataSource addObject:item];
    
    [_CollectionView reloadData];
}


-(NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //NSLog(@"collectionview = %@,section:%ld",collectionView,section);
    //return 8;
    return dataSource.count;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_MAC(10_11);
{
    
    //NSCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"CollectionViewItem" forIndexPath:indexPath];
    
    //CollectionViewItem *this =  (CollectionViewItem *)item;
    
    //this.SN = [NSString stringWithFormat:@"%ld",indexPath.item];
    NSCollectionViewItem *item = [dataSource objectAtIndex:indexPath.item];
    
    return item;
}
@end
