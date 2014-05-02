//
//  GEMSearchRecipeViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/28/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMSearchRecipeViewController.h"
#import "GEMRecipe.h"

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

- (NSArray *)recipesFromJSON:(NSDictionary *)recipesJSON
{
    
    NSMutableArray *recipes = [[NSMutableArray alloc] init];
    
    NSArray *results = [recipesJSON valueForKey:@"matches"];
    
    NSLog(@"Count: %d", results.count);
    
    
    
    
    return recipes;
}

#pragma mark - Buttons

- (IBAction)testConnection:(id)sender
{
    /*
    // Big Oven api key
    NSString *apiKey = @"dvxj2mEt7AK4w80f6EE99UR7a2964fLz";
    // Search term
    NSString *searchTerm = @"pizza";
    // Create URL request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.bigoven.com/recipes?title_kw=%@&pg=1&rpp=20&api_key=%@", searchTerm, apiKey]]];
     */
    
    
    // Yummly application id
    NSString *appID = @"6191b024";
    // Yummly api key
    NSString *apiKey = @"6efe529146a8e210cec188d55f877c9f";
    // Search term
    NSString *searchTerm = @"pizza";
    // Create URL request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.yummly.com/v1/api/recipes?_app_id=%@&_app_key=%@&q=%@&requirePictures=ture", appID, apiKey, searchTerm]]];
    
    // Create URL connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSLog(@"Connection: %@", conn);
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
    _parsedObject = [NSJSONSerialization JSONObjectWithData:_responseData options:0 error:nil];
    
    NSLog(@"Object dictionary: %@", _parsedObject);
    
    [self recipesFromJSON:_parsedObject];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Declare Allertview
    UIAlertView *alert;
    NSInteger errorCode = [[error localizedDescription] integerValue];
    
    //switch ([[error localizedDescription] integerValue]) {
    switch (errorCode) {
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

#pragma mark - Keyboard

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
