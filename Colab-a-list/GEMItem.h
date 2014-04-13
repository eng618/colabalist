//
//  GEMItem.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/6/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEMItem : NSObject <NSCoding>

@property NSString *uuid;
@property NSString *name;
@property float qty;
@property float price;
@property NSString *category;
@property NSString *notes;
@property BOOL inShoppingList;

+ (GEMItem *)createItemWithName:(NSString *)name andQuantity:(float)quantity andPrice:(float)price andCategory:(NSString *)category andNotes:(NSString *)notes;

@end
