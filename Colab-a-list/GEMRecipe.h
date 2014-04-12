//
//  GEMRecipe.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/12/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEMRecipe : NSObject

@property NSString *recipeName;
@property UIImage *recipeImage;
@property NSString *recipeDescription;
@property NSString *recipeServings;
@property NSString *recipeCookTime;
@property NSString *recipeingredient;
@property NSMutableArray *recipeIngredis;
@property NSString *recipeSourse;
@property NSURL *recipeURL;


@end
