//
//  MCView.h
//  iOS工具类
//
//  Created by SGD on 2016/8/28.
//  Copyright © 2016年 luoyang_. All rights reserved.
//

#import <UIKit/UIKit.h>
#define K_IOS_WIDTH [UIScreen mainScreen].bounds.size.width
#define K_IOS_HEIGHT [UIScreen mainScreen].bounds.size.height
#define weakSelf(a) __weak typeof(self) a = self;

typedef  NS_ENUM(NSInteger,MCViewType){
    /**
     *  线性动画
     */
    MCViewTypeSingleLine = 0,
    
    /**
     *  方形点动画
     */
    MCViewTypeSquare = 1,
    
    /**
     *  三角形运动动画
     */
    MCViewTypeTriangleTranslate = 2,
    
    /**
     *  原型视图裁剪动画
     */
    MCViewTypeClip
};

@interface MCView : UIView


/*        显示加载动画 并添加到父视图上         */
+ (void)showLoadingOnView:(UIView *)superView Type:(MCViewType)type;

/*        显示动画 并添加在主窗口上         */
+ (void)showLoadingOnTheKeyWindowWithType:(MCViewType)type;

/*       添加动画到当前的界面上         */
+ (void)showLoadingOnCurrentView:(UIView *)currentView Type:(MCViewType)type;

/*        停止动画         */
+ (void)hideLoading;

/*        设置动画背景色（全屏背景色）         */
+ (void)backgroudColor:(UIColor *)color;

/*        设置中心视图的动画背景颜色 默认透明色         */
+ (void)centerBGViewBackgroudColor:(UIColor *)color;

@end
