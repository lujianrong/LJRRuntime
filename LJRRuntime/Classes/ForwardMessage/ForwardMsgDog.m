//
//  ForwardMsgDog.m
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import "ForwardMsgDog.h"
#import <objc/runtime.h>
@implementation ForwardMsgDog
/**
 *  第一步：实现此方法，在调用对象的某方法找不到时，会先调用此方法，
 *  允许我们动态添加方法实现
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if ([NSStringFromSelector(sel) isEqualToString:@"eat"]) {
        class_addMethod(self, sel, (IMP)eat, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//动态添加
void eat(id self, SEL cmd) {
    NSLog(@"\n %@ is eating", self);
}


//---------------------------------------------------------------------------------------



/**
 *  为什么添加类方法不行了
 */
+ (BOOL)resolveClassMethod:(SEL)sel {
    if ([NSStringFromSelector(sel) isEqualToString:@"run"]) {
        class_addMethod(self, sel, (IMP)run, "v@:");
        
    }
    return [super resolveClassMethod:sel];
}
void run(id self, SEL cmd) {
    NSLog(@"\n run");
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL name = [anInvocation selector];
    NSLog(@"\nname-->  %@", NSStringFromSelector(name));
}
@end
