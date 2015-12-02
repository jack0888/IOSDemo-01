//
//  HWNavigationController.m
//  IOSDemo
//
//  Created by Jack on 15/11/26.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "UWONavigationController.h"

@interface UWONavigationController ()

@end

@implementation UWONavigationController
//-(id)initWithRootViewController:(UIViewController *)
//{
//    HWNavigationController* nvc = [super initWithRootViewController:rootViewController];
//    self.interactivePopGestureRecognizer.delegate = self;
//    nvc.delegate = self;
//    return nvc;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    __weak HWNavigationController *weakSelf = self;
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
//    {
//        self.interactivePopGestureRecognizer.delegate = weakSelf;
//        self.delegate = weakSelf;
//    }

}

/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;

    }

    [super pushViewController:viewController animated:animated];
}
//-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (navigationController.viewControllers.count == 1)
//        self.currentShowVC = Nil;
//    else
//        self.currentShowVC = viewController;
//    
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
//        self.interactivePopGestureRecognizer.enabled = YES;
//}
//
//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
//        return (self.currentShowVC == self.topViewController); //the most important
//    }
//    return YES;
//}


@end
