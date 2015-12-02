//
//  AppDelegate.h
//  IOSDemo
//
//  Created by Jack on 15/11/26.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIWindow+Extension.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)instance;
@end

