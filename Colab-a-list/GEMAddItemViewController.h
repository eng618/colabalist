//
//  GEMAddItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMItemManager.h"

@protocol GEMAddItemViewControllerDelegat <NSObject>

- (void)controller:(GEMAddItemViewController *)controller didSaveItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes;

@end

@interface GEMAddItemViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak) id<GEMAddItemViewControllerDelegat> delegate;

@property NSArray *categories;

@end
