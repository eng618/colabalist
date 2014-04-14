//
//  GEMAddItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMItemManager.h"

@protocol GEMAddItemViewControllerDelegate <NSObject>

- (void)didSaveItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes;

@end

@interface GEMAddItemViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak) id<GEMAddItemViewControllerDelegate> delegate;

@property NSArray *categories;

@end
