//
//  MCKeyChain.h
//  iOS工具类
//
//  Created by SGD on 17/1/4.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface MCKeyChain : NSObject

/**
 *  存储字符串到 KeyChain
 *
 *  @param service NSString
 */
+(void)saveKeychain:(NSString *)service withData:(id)data;

/**
 *  从 KeyChain 中读取存储的字符串
 *
 *  @return NSString
 */
+(id)loadKeychain:(NSString *)service;

/**
 *  删除 KeyChain 信息
 */
+(void)deleteKeyChain:(NSString *)service;

@end
