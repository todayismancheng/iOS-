//
//  UIImage+MCCategory.h
//  iOS工具类
//
//  Created by SGD on 2017/6/22.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MCCategory)
/**
 *贝塞尔曲线切圆角
 *
 */
- (void)mc_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor  completion:(void (^)(UIImage *image))completion;
/**
 *根据颜色返回图片
 */
+ (UIImage *)mc_imageWithColor:(UIColor *)color;
@end
