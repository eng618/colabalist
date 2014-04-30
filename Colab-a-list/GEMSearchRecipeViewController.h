//
//  GEMSearchRecipeViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/28/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GEMRecipe;

@interface GEMSearchRecipeViewController : UIViewController <NSURLConnectionDataDelegate>
{
    NSMutableData *_responseData;
}

@end
