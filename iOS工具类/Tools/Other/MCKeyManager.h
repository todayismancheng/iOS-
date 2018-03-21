//
//  MCKeyManager.h
//  iOS工具类
//
//  Created by SGD on 17/1/4.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCKeyManager : NSObject

@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *password;

+ (MCKeyManager *)shareManager;
/**
 *
 * 保存用户名和密码
 *
 */
- (void)saveUsername:(NSString *)username andPassword:(NSString *)password;
/**
 * 返回值是一个字典
 * 通过属性username作为key取得的值是『用户名』
 * 通过属性password作为key取得的值是『密码』
 */
- (NSDictionary *)loadUsernameAndPassword;
/**
 *
 * 清除用户名和密码
 *
 */

- (void)deleteUsernameAndPassword;
@end
