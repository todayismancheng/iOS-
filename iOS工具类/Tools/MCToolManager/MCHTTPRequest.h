//
//  MCHTTPSession.h
//  iOS工具类
//
//  Created by SGD on 17/1/12.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>

// 请求成功的Block
typedef void(^requestSuccess)(id _Nullable result);
// 请求失败的Block
typedef void(^requestFailed)(NSError * _Nullable error);

@class AFHTTPSessionManager;
@interface MCHTTPRequest : NSObject

/**
 *   GET请求
 *   URLString          请求地址
 *   parameters         请求参数
 *   requestSuccess     请求返回的参数成功
 *   requestFailed      请求返回的参数失败
 */
+ (nullable NSURLSessionDataTask *)GET:(nonnull NSString *)urlString
                             paraments:(nullable id)paraments
                        requestSuccess:(nullable requestSuccess)requestSuccess
                         requestFailed:(nullable requestFailed)requestFailed;

/**
 *   POST请求
 *   URLString      请求地址
 *   parameters     请求参数
 *   requestSuccess     请求返回的参数成功
 *   requestFailed      请求返回的参数失败
 */
+ (nullable NSURLSessionDataTask *)POST:(nonnull NSString *)urlString
                              paraments:(nullable id)paraments
                         requestSuccess:(nullable requestSuccess)requestSuccess
                          requestFailed:(nullable requestFailed)requestFailed;

/**
 *
 *    网络状态查询
 */
+ (void)AFNetworkStatus;

/**
 *
 *    取消所有网络请求
 */
+ (void)cancelAllRequest;



@end
