//
//  GEMAddItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMAddItemDelegate.h"
@class GEMItem;
@class GEMItemManager;


@protocol GEMAddItemViewControllerDelegate;

@interface GEMAddItemViewController : UIViewController 

@property BOOL isEditingItem;
@property GEMItem *item;
@property (weak, nonatomic) id<GEMAddItemDelegate> delegate;

@end