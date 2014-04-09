//
//  GEMItemManager.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/7/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMItemManager.h"

@implementation GEMItemManager
@synthesize items;

static GEMItemManager *_storedItems;

+ (GEMItemManager*)storedItems
{
    if (_storedItems == nil) {
        _storedItems = [[self alloc] init];
    }
    return _storedItems;
}

- (id) init
{
    if ((self = [super init])) {
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
