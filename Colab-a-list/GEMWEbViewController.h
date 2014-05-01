//
//  GEMWebViewController.h
//  Colab-a-list
//
//  Created by Eric Garcia on 4/9/14.
//  Copyright (c) 2014 Garcia Enterprise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GEMWebViewController : UIViewController

@property (nonatomic) NSURL *webURL;

- (void)loadRequestFromURL:(NSURL *)url;
- (void)loadRequestFromAddressField:(id)addressField;
- (void)updateTitle:(UIWebView *)aWebView;
- (void)updateButtons;

@end
