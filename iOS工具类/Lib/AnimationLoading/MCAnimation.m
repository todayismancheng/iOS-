//
//  MCAnimation.m
//  iOS工具类
//
//  Created by SGD on 2016/8/28.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import "MCAnimation.h"

@implementation MCAnimation
/**
 *  缩小动画
 *
 */
+ (CABasicAnimation *)animationForScaleSmall{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
    basic.fromValue         = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)];
    basic.toValue           = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0)];
    basic.duration          = 1.05;
    basic.repeatCount       = HUGE;
    return basic;
}


/**
 *  缩小并自动恢复动画
 *
 */
+ (CABasicAnimation *)animationForScaleAutoreverses{
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
    basic.fromValue         = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)];
    basic.toValue           = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0)];
    basic.duration          = 0.8;
    basic.repeatCount       = HUGE;
    basic.autoreverses      = YES;
    return basic;
}

/**
 *  透明度动画
 *
 */
+ (CABasicAnimation *)animationForAlpha{
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue         = @(1.0);
    alpha.toValue           = @(0.0);
    return alpha;
}

/**
 *  旋转动画
 *
 */
+ (CABasicAnimation *)rotateAnimation{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = CATransform3DRotate(CATransform3DIdentity, 0.0, 0.0, 0.0, 0.0);
    scale.fromValue         = [NSValue valueWithCATransform3D:fromValue];
    CATransform3D toValue   = CATransform3DTranslate(CATransform3DIdentity, 50 - 50 / 4.0, 0.0, 0.0);
    toValue                 = CATransform3DRotate(toValue,2*M_PI/3.0, 0.0, 0.0, 1.0);
    scale.toValue           = [NSValue valueWithCATransform3D:toValue];
    scale.autoreverses      = NO;
    scale.repeatCount       = HUGE;
    scale.timingFunction    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scale.duration          = 0.8;
    return scale;
}

@end
