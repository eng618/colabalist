//
//  GEMAddItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMItem.h"
@class GEMItemManager;
@protocol GEMAddItemViewControllerDelegate;

@interface GEMAddItemViewController : UIViewController 

@property GEMItem *item;
@property (weak) id<GEMAddItemViewControllerDelegate> delegate;

@end

@protocol GEMAddItemViewControllerDelegate <NSObject>

@required

- (void)controller:(GEMAddItemViewController *)controller didSaveItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes;

@optional

- (void)controller:(GEMAddItemViewController *)controller didUpdateItem:(GEMItem *)item;

@end // End of delegate protocol
