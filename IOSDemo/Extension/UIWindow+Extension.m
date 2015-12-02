//
//  UIWindow+Extension.m
//  IOSDemo
//
//  Created by Jack on 15/11/30.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "GuideController.h"
#import "MainTabBarController.h"
#import "AdViewController.h"

@implementation UIWindow (Extension)

- (void)changeRootViewController:(UIViewController *)mainVC
{
    UINavigationController *nav = [[UINavigationController alloc]init];
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
       if ([currentVersion isEqualToString:lastVersion]) {
           // 版本号相同：这次打开和上次打开的是同一个版本
           AdViewController *adVc = [[AdViewController alloc]init];
//           MainTabBarController *mainTabVC=[[MainTabBarController alloc]init];
           
           if (adVc && mainVC == nil) {
               [nav addChildViewController:adVc];
//               [adVc.navigationController setNavigationBarHidden:YES];
                self.rootViewController = nav;
           }else{
               self.rootViewController = mainVC;
           }
    } else {
        // 这次打开的版本和上一次不一样，显示新特性
        GuideController *vc = [[GuideController alloc] init];
        [nav addChildViewController:vc];
        [vc.navigationController setNavigationBarHidden:YES];
        // 将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        self.rootViewController = nav;
    }
    
    
}

@end
