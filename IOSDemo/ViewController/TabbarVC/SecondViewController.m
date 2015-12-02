//
//  SecondViewController.m
//  IOSDemo
//
//  Created by Jack on 15/11/26.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button=[[UIButton alloc]initWithFrame:(CGRectMake(100.0f,200.0f, 100.0f, 100.0f))];
    button.titleLabel.text=@"SecondViewController";
    button.titleLabel.textColor=[UIColor whiteColor];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(goDetail:) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goDetail:(id)sender{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
