//
//  GEMWebViewController.m
//  Colab-a-list
//
//  Created by Eric Garcia on 4/9/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import "GEMWebViewController.h"

@interface GEMWebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *back;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *stop;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refresh;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forward;

- (void)loadRequestFromURL:(NSURL *)url;

@end

@implementation GEMWebViewController
@synthesize webURL;

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
    
    // Set title
    [self setTitle:@"Web"];
    
    // Pass url to loadRequestFromURL
    [self loadRequestFromURL:webURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

- (void)loadRequestFromURL:(NSURL *)url
{
    // Create URL request
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:webURL];
    //Load request to webview
    [self.webView loadRequest:requestURL];
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
