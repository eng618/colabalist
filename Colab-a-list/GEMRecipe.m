//
//  GEMRecipe.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/12/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMRecipe.h"

@implementation GEMRecipe

+ (GEMRecipe *)createRecipeWithName:(NSString *)name andImage:(UIImage *)image andDescription:(NSString *)description andServings:(NSString *)servings andCookTime:(NSString *)cookTime andIngredient:(NSString *)ingredient andIngredients:(NSMutableArray *)ingredients andsourse:(NSString *)sourse andURL:(NSURL *)recipeURL
{
    // Create ne recipe
    GEMRecipe *recipe = [[GEMRecipe alloc] init];
    
    //Configure recipe
    [recipe setRecipeName:name];
    [recipe setRecipeImage:image];
    [recipe setRecipeDescription:description];
    [recipe setRecipeServings:servings];
    [recipe setRecipeCookTime:cookTime];
    [recipe setRecipeIngredient:ingredient];
    [recipe setRecipeIngredients:ingredients];
    [recipe setRecipeSourse:sourse];
    [recipe setRecipeURL:recipeURL];
    [recipe setUuid:[[NSUUID UUID] UUIDString]];
    
    return recipe;
}

# pragma mark - Encoding methods

// Automatically called by OS to encode an object
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uuid forKey:@"uuid"];
    [aCoder encodeObject:self.recipeName forKey:@"name"];
    [aCoder encodeObject:self.recipeImage forKey:@"image"];
    [aCoder encodeObject:self.recipeDescription forKey:@"description"];
    [aCoder encodeObject:self.recipeServings forKey:@"servings"];
    [aCoder encodeObject:self.recipeCookTime forKey:@"cookTime"];
    [aCoder encodeObject:self.recipeIngredient forKey:@"ingredient"];
    [aCoder encodeObject:self.recipeIngredients forKey:@"ingredients"];
    [aCoder encodeObject:self.recipeSourse forKey:@"sourse"];
    [aCoder encodeObject:self.recipeURL forKey:@"URL"];
}

// Automatically called by OS to decode an object
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        [self setUuid:[aDecoder decodeObjectForKey:@"uuid"]];
        [self setRecipeName:[aDecoder decodeObjectForKey:@"name"]];
        [self setRecipeImage:[aDecoder decodeObjectForKey:@"image"]];
        [self setRecipeDescription:[aDecoder decodeObjectForKey:@"description"]];
        [self setRecipeServings:[aDecoder decodeObjectForKey:@"servings"]];
        [self setRecipeCookTime:[aDecoder decodeObjectForKey:@"cookTime"]];
        [self setRecipeIngredient:[aDecoder decodeObjectForKey:@"ingredient"]];
        [self setRecipeIngredients:[aDecoder decodeObjectForKey:@"ingredients"]];
        [self setRecipeSourse:[aDecoder decodeObjectForKey:@"sourse"]];
        [self setRecipeURL:[aDecoder decodeObjectForKey:@"URL"]];
    }
    return self;
}

@end
