//
//  GEMAddRecipeViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/28/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GEMRecipe;

@protocol GEMAddRecipeViewControllerDelegate;

@interface GEMAddRecipeViewController : UIViewController

@end

@protocol GEMAddRecipeViewControllerDelegate <NSObject>

@required

// Passed to delegate if a new item is saved
- (void)controller:(GEMAddRecipeViewController *)controller didSaveRecipeWithName:(NSString *)name andImage:(UIImage *)image andDescription:(NSString *)description andServings:(NSString *)servings andCookTime:(NSString *)cookTime andIngredients:(NSMutableArray *)ingredients andSourse:(NSString *)sourse andURL:(NSURL *)recipeURL;

// Passed if existing item has been updated
- (void)controller:(GEMAddRecipeViewController *)controller didUpdateRecipe:(GEMRecipe *)item;

@end // End of delegate protocol
