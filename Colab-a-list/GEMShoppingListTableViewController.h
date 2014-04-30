//
//  GEMShoppingListTableViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMAddItemDelegate.h"
@class GEMAddItemViewController;
@class GEMItemManager;
@class GEMItem;

@interface GEMShoppingListTableViewController : UITableViewController <GEMAddItemDelegate> //<GEMAddItemViewControllerDelegate>

@property BOOL isEditingItem;
@property GEMItem *selection;

@end
