//
//  UIColor+MCExtension.h
//  iOS工具类
//
//  Created by SGD on 16/12/22.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MCCategory)

/**
 *  根据颜色返回一张image
 *
 *  @return UIImage
 */
- (UIImage *)imageWithSelf;
/**
 *  随机返回一种颜色
 *
 *  @return UIColor
 */
+ (UIColor *)randomColor;

/**
 *  十六进制返回一种颜色
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/**
 *  返回带alpha的颜色
 *
 *  @param color uicolor
 *  @param alpha alpha值
 *
 *  @return uicolor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end
