//
//  UIBarButtonItem+MCExtension.m
//  iOS工具类
//
//  Created by SGD on 16/11/24.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import "UIBarButtonItem+MCCategory.h"
@implementation UIBarButtonItem (MCCategory)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}
@end
