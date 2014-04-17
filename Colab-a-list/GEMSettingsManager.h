//
//  GEMSettingsManager.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/17/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEMSettingsManager : NSObject

@property (nonatomic, strong) NSMutableArray *categories;

+ (GEMSettingsManager *)settingsManager;

@end
