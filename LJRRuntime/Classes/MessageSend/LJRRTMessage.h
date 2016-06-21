//
//  LJRRTMessage.h
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRRTMessage : NSObject
/**
 *  objc_msgSend()练习
 */
+ (void)messageTest;
/**
 *  动态添, 加调用方法
 */
+ (void)dynamicAddMethod;
@end
