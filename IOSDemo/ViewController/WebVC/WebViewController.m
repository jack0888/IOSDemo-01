//
//  WebViewController.m
//  IOSDemo
//
//  Created by Jack on 15/12/1.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "WebViewController.h"
#import "CommonService.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize url, vcTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.title=vcTitle;
    UIWebView *webViewContent=[[UIWebView alloc] initWithFrame:CGRectMake(0.0f,0.0f, SCREEN_WIDTH, SCREEN_HEIGHT)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [webViewContent loadRequest:request];
    
    [webViewContent stringByEvaluatingJavaScriptFromString:@"document.body.style.zoom=0.5"];
    [webViewContent setScalesPageToFit:YES];
    [self.view addSubview:webViewContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
