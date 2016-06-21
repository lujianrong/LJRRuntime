//
//  ForwardMsgDog.h
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  ForwardMsgDog *dog = [[ForwardMsgDog alloc] init];
 *  [dog eat];
 */
@interface ForwardMsgDog : NSObject

/**不现实*/
- (void)eat;
//+ (void)run;
@end
