//
//  GEMSettingsManager.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/17/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMSettingsManager.h"

@implementation GEMSettingsManager

@synthesize categories;

static GEMSettingsManager *_settingsManager;

+ (GEMSettingsManager *)settingsManager
{
    if (!_settingsManager) {
        _settingsManager = [[self alloc] init];
    }
    return _settingsManager;
}

- (id)init
{
    if ((self = [super init])) {
        if (!categories) {
            categories = [[NSMutableArray alloc] initWithArray:@[@"Produce", @"Dairy", @"Grocery", @"Bakery", @"Deli", @"Frozen", @"Housewares", @"Personal Care", @"Office", @"Uncategorized"]];
        }
    }
    return self;
}

@end
