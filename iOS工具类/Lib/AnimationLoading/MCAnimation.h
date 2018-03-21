//
//  MCAnimation.h
//  iOS工具类
//
//  Created by SGD on 2016/8/28.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCAnimation : NSObject

/*        缩小动画 无自动恢复效果         */
+ (CABasicAnimation *)animationForScaleSmall;

/*        缩小动画 自动恢复效果         */
+ (CABasicAnimation *)animationForScaleAutoreverses;

/*        透明度动画         */
+ (CABasicAnimation *)animationForAlpha;

/*        旋转动画         */
+ (CABasicAnimation *)rotateAnimation;




@end
