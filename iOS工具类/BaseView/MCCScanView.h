//
//  MCCScanView.h
//  iOS工具类
//
//  Created by SGD on 2017/8/28.
//  Copyright © 2017年 luoyang_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface MCCScanView : UIView 

- (instancetype)initWithScanRect:(CGRect)rect;

/** 添加定时器 */
- (void)addTimer;
/** 移除定时器(切记：一定要在Controller视图消失的时候，停止定时器) */
- (void)removeTimer;
//记录扫描次数。用的时候带走
@property (nonatomic, assign) BOOL isQRCodeCaptured;
@property (nonatomic, strong)  AVCaptureSession *session;

@end
