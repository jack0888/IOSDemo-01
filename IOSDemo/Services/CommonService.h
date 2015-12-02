//
//  CommonService.h
//  IOSDemo
//
//  Created by Jack on 15/11/30.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonService : NSObject

- (void)getNetWorkData:(NSDictionary *)param
                  Path:(NSString *)path
             Successed:(void(^)(id entity)) successed
                Failed:(void(^)(NSInteger errorCode ,NSString *message))failed;

@end
