//
//  GEMAddItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMItemManager.h"

@interface GEMAddItemViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property NSArray *categories;

@end
