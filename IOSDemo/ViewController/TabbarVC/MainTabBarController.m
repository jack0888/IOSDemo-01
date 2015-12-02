//
//  MainTbaBarController.m
//  IOSDemo
//
//  Created by Jack on 15/11/26.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "MainTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "UWONavigationController.h"
#import "UIImageView+WebCache.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化子控制器
    FirstViewController *home = [[FirstViewController alloc] init];
    [self.tabBar setBackgroundColor:[UIColor blackColor]];
    
    [self addChildVc:home title:@"首页" image:@"首页_02.png" selectedImage:@"首页_01.png"];
    
    SecondViewController *second = [[SecondViewController alloc] init];
    [self addChildVc:second title:@"发现" image:@"发现_02.png" selectedImage:@"发现_01.png"];
    
    self.delegate = self;
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
//    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.image=[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = RGBCOLOR(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.36 green:0.8 blue:0.27 alpha:1];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
//    // 先给外面传进来的小控制器 包装 一个导航控制器
    UWONavigationController *nav = [[UWONavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
//    [self addChildViewController:childVc];
    childVc.navigationController.navigationBarHidden = NO;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    if (self.selectedIndex == 1) {
       
    }
    if (self.selectedIndex == 2) {
       
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

@end
