//
//  ViewController.m
//  LJRRuntime
//
//  Created by lujianrong on 16/6/20.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import "ViewController.h"
#import "LJRRTMethod.h"
#import "LJRRTProperty.h"
#import "LJRRTMessage.h"
#import "ForwardMsgCat.h"

@interface ViewController ()
/**
 *  NSLog(@"encode(const void *)-->%s", @encode(const void *));//r^v
 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [LJRRTMethod methodTest];
//    [LJRRTProperty propertyTest];
//    [LJRRTMessage messageTest];
//    [LJRRTMessage dynamicAddMethod];
    [ForwardMsgCat forwardMsgTest];
}


@end
