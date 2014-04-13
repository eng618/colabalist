//
//  GEMItemManager.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/7/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEMItemManager : NSObject
{
    NSMutableArray *itemsFromManager;
}

+(GEMItemManager*)storedItems;

@property (nonatomic, strong) NSMutableArray *itemsFromManager;

@end
