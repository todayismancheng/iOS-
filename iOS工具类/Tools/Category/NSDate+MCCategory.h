//
//  NSDate+MCExtension.h
//  iOS工具类
//
//  Created by luoyang_ on 2016/11/8.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MCCategory)
/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;

/** 
 *  返回一个时间字符串
 *
 *  @param str 根据传入的format返回时间字符串
 *
 *  @return 时间字符串
 */
- (NSString *)stringValueWithChar:(NSString *)str;
@end
