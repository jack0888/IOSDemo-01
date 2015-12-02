//
//  FirstViewController.m
//  IOSDemo
//
//  Created by Jack on 15/11/26.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label=[[UILabel alloc]initWithFrame:(CGRectMake(100.0f,100.0f, 100.0f, 100.0f))];
    label.text=@"HOME";
    label.textColor=[UIColor blackColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
