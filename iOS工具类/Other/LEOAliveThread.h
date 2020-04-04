//
//  LEOAliveThread.h
//  LEOPoxy
//
//  Created by luoyang_ on 2019/05/29.
//  Copyright © 2019年 luoyang_. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LEOAliveThreadBlock)(void);

@interface LEOAliveThread : NSObject

/**
 开启线程
 */
//- (void)run;

/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(LEOAliveThreadBlock)task;

/**
 结束线程
 */
- (void)stop;

@end
