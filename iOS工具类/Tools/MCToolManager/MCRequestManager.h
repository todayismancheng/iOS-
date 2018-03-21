//
//  MCRequestManager.h
//  iOS工具类
//
//  Created by SGD on 17/1/3.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCHTTPRequest.h"

@interface MCRequestManager : NSObject
/*
 *
 *登录方法
 *
 */
+ (NSURLSessionDataTask *)loginWithMobleNum:(NSString *)MobelNum andPassWord:(NSString *)PassWord andregistrationId:(NSString *)registrationId reqType:(NSString *)reqType andrequestSuccess:( requestSuccess)requestSuccess requestFailed:( requestFailed)requestFailed;

@end
