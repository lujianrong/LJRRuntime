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

@interface ViewController ()
/**
 *   http://code4app.com (cn) http://code4app.net (en) 原作者
 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [LJRRTMethod methodTest];
    [LJRRTProperty propertyTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
