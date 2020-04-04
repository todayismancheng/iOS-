//
//  LEOProxy.h
//  LEOPoxy
//
//  Created by luoyang_ on 2019/02/02.
//  Copyright © 2019年 luoyang_. All rights reserved.
//
/*
  用于消息转发的工具
 */
#import <Foundation/Foundation.h>

@interface LEOProxy : NSProxy
/**  */
@property (nonatomic,weak) id target;

+ (instancetype)leo_proxyWithTarget:(id)target;

@end
