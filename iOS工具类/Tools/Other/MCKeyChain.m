//
//  MCKeyChain.m
//  iOS工具类
//
//  Created by SGD on 17/1/4.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import "MCKeyChain.h"

@implementation MCKeyChain

+(NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,( id)kSecClass,
            service,(id)kSecAttrService,
            service,(id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

+(void)saveKeychain:(NSString *)service withData:(id)data {
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete(( CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data]
                      forKey:(id)kSecValueData];
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

+(id)loadKeychain:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue
                      forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne
                      forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
        }
    }
    
    return ret;
}

+(void)deleteKeyChain:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

@end
