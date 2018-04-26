//
//  UIImage+MCCategory.m
//  iOS工具类
//
//  Created by SGD on 2017/6/22.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import "UIImage+MCCategory.h"

@implementation UIImage (MCCategory)

- (void)mc_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *image))completion{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        // 2. 设置填充颜色
        [fillColor setFill];
        
        UIRectFill(rect);
        
        UIBezierPath *bezier = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [bezier addClip];
        
        [self drawInRect:rect];
        
        UIImage  *result =  UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (result !=  nil) {
                
                completion(result);
            }
            
        });
});

}
+ (UIImage *)mc_imageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
