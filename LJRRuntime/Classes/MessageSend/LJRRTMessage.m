//
//  LJRRTMessage.m
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import "LJRRTMessage.h"
#import <UIKit/UIKit.h>
#import <objc/message.h>
@implementation LJRRTMessage
/**
 *  动态添, 加调用方法
 */
+ (void)dynamicAddMethod {
    LJRRTMessage *msg = [[LJRRTMessage alloc] init];
    NSLog(@"encode(const void *)-->%s", @encode(const void *));//r^v
    class_addMethod(self, NSSelectorFromString(@"c_Function"), (IMP)c_Function, "i@:r^vr^v");
    
    int result = ((int (*)(id, SEL, const void *, const void *))objc_msgSend)((id)msg, NSSelectorFromString(@"c_Function"), @"参数1", @"参数2");
    NSLog(@"\n result- >%d", result);
}


int c_Function(id receiver, SEL sel, const void *arg1, const void *arg2) {
    NSLog(@"%s was called, arg1 is %@, and arg2 is %@",
          __FUNCTION__,
          [NSString stringWithUTF8String:arg1],
          [NSString stringWithUTF8String:arg1]);
    return 1;
}

+ (void)messageTest {
    //创建对象  (id)[LJRRTMessage class] ---> self
    LJRRTMessage *msg = ((LJRRTMessage *(*)(id, SEL))objc_msgSend)((id)self, @selector(alloc));
    
    // 初始化
    msg = ((LJRRTMessage *(*)(id, SEL)) objc_msgSend)((id)msg, @selector(init));
    
    //调用无参数, 无返回值
    ((void (*)(id, SEL))objc_msgSend)((id)msg, @selector(noArguementsAndNoReturn));
    
    //无返回值, 有一个参数
    ((void(*)(id, SEL, NSString *))objc_msgSend)((id)msg, @selector(noReturnWithArg:), @"JR学 runtime");
    //有返回值, 无参数
    NSString *result = ((NSString * (*)(id, SEL))objc_msgSend)((id)msg, @selector(noArgumentsButReturnValue));
    NSLog(@"\n result-> %@", result);
    
    //有返回值, 有参数
    int size = ((int (*)(id, SEL, NSNumber *))objc_msgSend)((id)msg, @selector(intWithNumber:), @1024);
    NSLog(@"\n size -> %d", size);
    
    // 返回结构体时，不能使用objc_msgSend，而是要使用objc_msgSend_stret，否则会crash
      CGRect frame = ((CGRect (*)(id, SEL))objc_msgSend_stret)((id)msg, @selector(returnTypeIsStruct));
      NSLog(@"\n frame-> %@", NSStringFromCGRect(frame));
}
- (void)noArguementsAndNoReturn {
    NSLog(@"\n noArguementsAndNoReturn");
}
- (void)noReturnWithArg:(NSString *)arg {
    NSLog(@"\n %@ ", arg);
}
- (NSString *)noArgumentsButReturnValue {
    return @"有返回值, 无参数";
}
- (int)intWithNumber:(NSNumber *)num{
    return num.intValue;
}
- (CGRect)returnTypeIsStruct {
    return CGRectMake(10, 20, 30, 40);
}
@end
