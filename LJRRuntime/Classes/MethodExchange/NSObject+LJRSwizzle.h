//
//  NSObject+LJRSwizzle.h
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LJRSwizzle)
/**
 *  OC 版
 */
+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;
/**
 * C 语言版
 */
static inline void swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector);
@end
