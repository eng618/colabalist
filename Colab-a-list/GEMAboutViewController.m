//
//  GEMAboutViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/7/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMAboutViewController.h"
#import "SWRevealViewController.h"

@interface GEMAboutViewController ()

@end

@implementation GEMAboutViewController
@synthesize url;

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
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Create barbutton item
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon.png"]style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    
    // Show barButton item
    self.navigationItem.leftBarButtonItem = revealButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

- (IBAction)googlePlusLink:(id)sender
{
    NSString *fullURL = @"https://plus.google.com/+EricGarcia";
    url = [NSURL URLWithString:fullURL];
    
    [self performSegueWithIdentifier:@"webSegue" sender:self];
}

- (IBAction)facebookLink:(id)sender
{
    NSString *fullURL = @"http://www.facebook.com/garciaenterprise";
    url = [NSURL URLWithString:fullURL];
    
    [self performSegueWithIdentifier:@"webSegue" sender:self];
}

- (IBAction)twitterLink:(id)sender
{
    NSString *fullURL = @"https://twitter.com/garciaericn";
    url = [NSURL URLWithString:fullURL];
    
    [self performSegueWithIdentifier:@"webSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    GEMWebViewController *wvc = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    wvc.webURL = url;
}


@end
