//
//  LEOProxy.m
//  LEOPoxy
//
//  Created by luoyang_ on 2019/02/02.
//  Copyright © 2019年 luoyang_. All rights reserved.
//

#import "LEOProxy.h"
#import <objc/runtime.h>
@implementation LEOProxy

+ (instancetype)leo_proxyWithTarget:(id)target{
    
    LEOProxy *proxy = [LEOProxy alloc];
    proxy.target = target;
    return proxy;
    
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    
    return [self.target methodSignatureForSelector:sel];
}
- (void)forwardInvocation:(NSInvocation *)invocation{
    
    [invocation invokeWithTarget:self.target];
}

@end
