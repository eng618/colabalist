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
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

- (IBAction)googlePlusLink:(id)sender {
}

- (IBAction)facebookLink:(id)sender {
}

- (IBAction)twitterLink:(id)sender {
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    GEMWebViewController *wvc = [segue destinationViewController];
    // Pass the selected object to the new view controller.
}


@end
