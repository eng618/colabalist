//
//  GEMRecipe.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/12/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEMRecipe : NSObject <NSCoding>

@property NSString *recipeName;
@property UIImage *recipeImage;
@property NSString *recipeDescription;
@property NSString *recipeServings;
@property NSString *recipeCookTime;
@property NSString *recipeIngredient;
@property NSMutableArray *recipeIngredients;
@property NSString *recipeSourse;
@property NSURL *recipeURL;

+ (GEMRecipe *)createRecipeWithName:(NSString *)name andImage:(UIImage *)image andDescription:(NSString *)description andServings:(NSString *)servings andCookTime:(NSString *)cookTime andIngredient:(NSString *)ingredient andIngredients:(NSMutableArray *)ingredients andsourse:(NSString *)sourse andURL:(NSURL *)recipeURL;

@end
