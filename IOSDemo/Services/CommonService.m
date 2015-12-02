//
//  CommonService.m
//  IOSDemo
//
//  Created by Jack on 15/11/30.
//  Copyright © 2015年 UWO. All rights reserved.
//

#import "CommonService.h"
#import "AFNetworking.h"

@implementation CommonService

- (void)getNetWorkData:(NSDictionary *)param
                  Path:(NSString *)path
             Successed:(void(^)(id entity)) successed
                Failed:(void(^)(NSInteger errorCode ,NSString *message))failed
{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[[NSURL alloc] initWithString:BASEURL]];
    [client registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    client.parameterEncoding = AFFormURLParameterEncoding;
    [client getPath:path
         parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                DebugLog(@"%@", result);
                
                NSError *e;
                NSDictionary *resultDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&e];
                
                if (resultDictionary == nil) {
                    successed(result);
                } else {
                    successed(resultDictionary);
                }
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSInteger errorCode = error.code;
                NSString *errorMessage = [error localizedDescription];
                
                failed(errorCode,errorMessage);
            }];
}

@end
