//
//  NSString+MCExtension.h
//  iOS工具类
//
//  Created by SGD on 16/12/8.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MCCategory)

/**
 *  宽度无限,根据文字的大小返回文字高度
 *
 *  @param font 文字大小
 *
 *  @return 文字高度
 */
- (CGFloat )heightWithFont:(CGFloat )font;

/**
 *  根据大小返回宽度
 *
 *  @param font 字体font
 *
 *  @return 文字宽度
 */
- (CGFloat)widthWithFont:(CGFloat )font;
/**
 *  根据字体大小,宽度,返回高度
 *
 *  @param font  字体大小
 *  @param width 字体宽度
 *
 *  @return 返回cgsize
 */
- (CGSize )sizeWithFont:(CGFloat )font  width:(CGFloat )width;
/**
 *  根据字体大小 返回单行的size
 *
 *  @param font 字体大小
 *
 *  @return cgsize
 */
- (CGSize )singleLineSizeWithFont:(CGFloat )font;

/**
 *  字符串根据datefomater返回一个时间
 *
 *  @param formatStr 时间字符串
 *
 *  @return NSdate
 */
- (NSDate *)dateWithDateFormat:(NSString *)formatStr;
@end
