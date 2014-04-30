//
//  GEMSearchRecipeViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/28/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMSearchRecipeViewController.h"

@interface GEMSearchRecipeViewController ()

@end

@implementation GEMSearchRecipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

- (void)dismissAlertView:(UIAlertView *)alertView
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

#pragma mark - NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Instantiate instance data variable
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append data to instance variable
    [_responseData appendData:data];
    
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    // Returning nil to not cache any data
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //Parse data here
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Declare Allertview
    UIAlertView *alert;
    
    switch ([[error localizedDescription] integerValue]) {
        case 400:
            alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                               message:@"400 - Bad Request" 
                                              delegate:nil 
                                     cancelButtonTitle:nil 
                                     otherButtonTitles:nil, nil];
            //Show alert
            [alert show];
            
            // Dismiss alert view after interval
            [self performSelector:@selector(dismissAlertView:) withObject:alert afterDelay:2];
            break;
        case 409:
            alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                               message:@"409 - API Rate Limit Exceeded"
                                              delegate:nil
                                     cancelButtonTitle:nil
                                     otherButtonTitles:nil, nil];
            //Show alert
            [alert show];
            
            // Dismiss alert view after interval
            [self performSelector:@selector(dismissAlertView:) withObject:alert afterDelay:2];
            break;
        case 500:
            alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                               message:@"500 - Internal Server Error"
                                              delegate:nil
                                     cancelButtonTitle:nil
                                     otherButtonTitles:nil, nil];
            //Show alert
            [alert show];
            
            // Dismiss alert view after interval
            [self performSelector:@selector(dismissAlertView:) withObject:alert afterDelay:2];
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
