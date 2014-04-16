//
//  GEMAddItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GEMItemManager;

@protocol GEMAddItemViewControllerDelegate;
/*
@protocol GEMAddItemViewControllerDelegate <NSObject>

- (void)didSaveItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes;

@end // End of delegate protocol
*/
@interface GEMAddItemViewController : UIViewController 

@property (weak) id<GEMAddItemViewControllerDelegate> delegate;

@property NSArray *categories;

@end

@protocol GEMAddItemViewControllerDelegate <NSObject>
 // Tried to add the controller (controller:(GEMAddItemviewController *)controller) as first paramiter, but was getting and errror, so I have omitted it for the time being
 - (void)controller:(GEMAddItemViewController *)controller didSaveItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes;


@end // End of delegate protocol
