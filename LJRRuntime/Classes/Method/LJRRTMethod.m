//
//  LJRRTMethod.m
//  LJRRuntime
//
//  Created by lujianrong on 16/6/20.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import "LJRRTMethod.h"
#import <objc/message.h>

@implementation LJRRTMethod
//- (NSString *)eat:(NSString *)food time:(int)time { return @"哈哈"; }

+ (void)play {}

/**只能获取实例方法, 类方法获取不到 */
+ (void)getInstanceMethods {
    unsigned int outCount = 0 , i;
    Method *methodList = class_copyMethodList(self.class, &outCount);
    for (i = 0; i < outCount; i++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        NSLog(@"\n -> %@", NSStringFromSelector(methodName));
        [self getMethodArgumentsType:method];
        [self getMethodReturnType:method];
    }
    free(methodList);
}
/*获取方法的参数类型*/
+ (void)getMethodArgumentsType:(Method)method {
    unsigned int argumentsCount = method_getNumberOfArguments(method);
    char argName[512] = {};
    for (unsigned int i = 0; i < argumentsCount; i++) {
        method_getArgumentType(method, i, argName, 512);
        NSLog(@"\n 第%u个参数类型为->(%s)", i, argName);
        memset(argName, '\0', strlen(argName));
    }
}
/*获取返回值类型类型*/
+ (void)getMethodReturnType:(Method)method {
    char returnType[512] = {};
    method_getReturnType(method, returnType, strlen(returnType));
    NSLog(@"\n返回值类型-> %s", method_getTypeEncoding(method));
}

- (int)testInstanceMethod:(NSString *)name andValue:(NSNumber *)value {
    NSLog(@"%@", name);
    return value.intValue;
}

+ (void)methodTest {
    //[LJRRTMethod getInstanceMethods];
    
    //调 类方法
    ((void (*)(id, SEL))objc_msgSend)((id)self, @selector(getInstanceMethods));
    
    //调对象放法
    LJRRTMethod *jtTest = [[LJRRTMethod alloc] init];
   int returnValue = ((int (*)(id, SEL, NSString *, NSNumber *))objc_msgSend)((id)jtTest, @selector(testInstanceMethod:andValue:), @"LJR-学习 runtime", @123);
    NSLog(@"\n returnValue-> %d", returnValue);
    
    //获取方法
    Method method = class_getInstanceMethod(self, @selector(testInstanceMethod:andValue:));
    returnValue = ((int (*)(id, Method, NSString *, NSNumber *))method_invoke)((id)jtTest, method, @"runtime", @200);
    NSLog(@"\nreturnValue-> %d", returnValue);
}


@end
