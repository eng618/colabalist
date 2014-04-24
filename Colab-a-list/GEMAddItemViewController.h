//
//  GEMAddItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GEMItem;
@class GEMItemManager;

@protocol GEMAddItemViewControllerDelegate;

@interface GEMAddItemViewController : UIViewController 

@property BOOL isEditingItem;
@property GEMItem *item;
@property (weak) id<GEMAddItemViewControllerDelegate> delegate;

@end

@protocol GEMAddItemViewControllerDelegate <NSObject>

@required

// Passed to delegate if a new item is saved
- (void)controller:(GEMAddItemViewController *)controller didSaveItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes;

// Passed if existing item has been updated
- (void)controller:(GEMAddItemViewController *)controller didUpdateItem:(GEMItem *)item;

@end // End of delegate protocol
