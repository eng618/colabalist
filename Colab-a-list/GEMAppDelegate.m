//
//  GEMAppDelegate.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/3/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMAppDelegate.h"
#import "GEMItem.h"

@implementation GEMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Seed items
    [self seedItems];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

# pragma mark - App setup

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths lastObject];
}

- (void)seedItems
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if (![ud boolForKey:@"GEMUserDefaultsSeedItems"]) {
        //Load seed items
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"seed" ofType:@"plist"];
        NSArray *seedItems = [NSArray arrayWithContentsOfFile:filePath];
        
        // Items
        NSMutableArray *items = [NSMutableArray array];
        
        //create list of items
        for (int i = 0; i < [seedItems count]; i++) {
            NSDictionary *seedItem = [seedItems objectAtIndex:i];
            
            // Create Item
            GEMItem *item = [GEMItem createItemWithName:[seedItem objectForKey:@"name"] andQuantity:[[seedItem objectForKey:@"qty"] floatValue] andPrice:[[seedItem objectForKey:@"price"] floatValue] andCategory:[seedItem objectForKey:@"category"] andNotes:[seedItem objectForKey:@"notes"]];
            
            // Add item to items
            [items addObject:item];
        }
        
        // Items path
        NSString *itemsPath = [[self documentsDirectory] stringByAppendingPathComponent:@"items.plist"];
        
        // Write to file
        if ([NSKeyedArchiver archiveRootObject:items toFile:itemsPath]){
            [ud setBool:YES forKey:@"GEMUserDefaultsSeedItems"];
        }
    }
}

@end
