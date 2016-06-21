//
//  LJRRTProperty.h
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRRTProperty : NSObject
{
    NSString *_name;
    NSObject *_objs;
}

@property (nonatomic, strong) NSArray   *dataSource;

+ (void)propertyTest;

@end
