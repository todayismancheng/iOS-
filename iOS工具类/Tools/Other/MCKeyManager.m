//
//  MCKeyManager.m
//  iOS工具类
//
//  Created by SGD on 17/1/4.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import "MCKeyManager.h"
#import "MCKeychain.h"

static MCKeyManager *singleInstance = nil;



/*
 *这里的key值必须设定
 */
#warning  KeyChain key值
static NSString *const kMCKeyChain_USERNAME_PASSWORD = @"";
static NSString *const kMCYKeyChain_USERNAME = @"";
static NSString *const kMCYKeyChain_PASSWORD = @"";
@implementation MCKeyManager
+ (MCKeyManager *)shareManager {
    @synchronized(self) {
        if (!singleInstance) {
            singleInstance = [[self alloc] init];
        }
        return singleInstance;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _username = kMCYKeyChain_USERNAME;
        _password = kMCYKeyChain_PASSWORD;
    }
    return self;
}

- (void)saveUsername:(NSString *)username andPassword:(NSString *)password {
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] init];
    [dataDict setObject:username forKey:kMCYKeyChain_USERNAME];
    [dataDict setObject:password forKey:kMCYKeyChain_PASSWORD];
    [MCKeyChain saveKeychain:kMCKeyChain_USERNAME_PASSWORD withData:dataDict];
}

- (NSDictionary *)loadUsernameAndPassword {
    
    return [MCKeyChain loadKeychain:kMCKeyChain_USERNAME_PASSWORD];
}
- (void)deleteUsernameAndPassword {
    [MCKeyChain deleteKeyChain:kMCKeyChain_USERNAME_PASSWORD];
}
@end
