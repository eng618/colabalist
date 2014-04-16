//
//  GEMEditItemViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/15/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMItem.h"
//@class GEMItem;

@protocol GEMEditItemViewControllerDelegate;
@interface GEMEditItemViewController : UIViewController

@property GEMItem *item;
@property (weak) id<GEMEditItemViewControllerDelegate> delegate;

@end

@protocol GEMEditItemViewControllerDelegate <NSObject>
@required
- (void)controller:(GEMEditItemViewController *)controller didUpdateItem:(GEMItem *)item;
@end // End of delegate protocol
