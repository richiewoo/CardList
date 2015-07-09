//
//  MusicWebviewController.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "MusicWebviewController.h"

@interface MusicWebviewController () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webview;
@end

@implementation MusicWebviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webview = [[UIWebView alloc] init];
    self.webview.frame = self.view.frame;
    self.webview.delegate = self;
    [self.webview loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:self.webPageUrl]]];
    [self.view addSubview:self.webview];
}

#pragma mark UIWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
