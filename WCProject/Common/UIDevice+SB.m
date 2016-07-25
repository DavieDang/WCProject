//
//  UIDevice+SB.m
//  YVideoPlayer
//
//  Created by chensb on 16/6/7.
//  Copyright © 2016年 Huyp. All rights reserved.
//

#import "UIDevice+SB.h"

@implementation UIDevice (SB)


//调用私有方法实现
+ (void)setOrientation:(UIInterfaceOrientation)orientation {
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[self currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];
    [invocation invoke];
}


@end
