//
//  WikiViewController.m
//  CodeChallenge02
//
//  Created by Eduardo Alvarado Díaz on 10/10/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "WikiViewController.h"

@interface WikiViewController () <UIWebViewDelegate, UIAlertViewDelegate>


@end

@implementation WikiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlString = self.city.url;
    NSLog(@"url: %@",self.city.url);
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)doneButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alertView = [[UIAlertView alloc]init];
    alertView.delegate = self;
    alertView.title = @"Bad url, check please";
    alertView.message = error.localizedDescription;
    [alertView addButtonWithTitle:@"Ok"];
    [alertView show];
}

@end
