//
//  DetailViewController.m
//  IOSDemo
//
//  Created by Jack on 15/11/27.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc]initWithFrame:(CGRectMake(100.0f,100.0f, 100.0f, 100.0f))];
    label.text=@"DETAIL";
    label.textColor=[UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label];

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
