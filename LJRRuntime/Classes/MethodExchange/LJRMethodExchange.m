//
//  LJRMethodExchange.m
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import "LJRMethodExchange.h"
#import "NSObject+LJRSwizzle.h"
@implementation LJRMethodExchange
+ (void)methodExchangeTest {
   
    LJRMethodExchange *obj = [[LJRMethodExchange alloc] init];
    [obj fuck];
    
    [LJRMethodExchange swizzleSelector:@selector(fuck) withSwizzledSelector:@selector(addObjs)];
    [obj fuck];
}
- (void)addObjs{
    NSLog(@"\n addObjs ");
}
- (void)fuck {
    NSLog(@"\n fuck you");
}
@end
