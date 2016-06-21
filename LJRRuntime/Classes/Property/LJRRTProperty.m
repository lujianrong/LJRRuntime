//
//  LJRRTProperty.m
//  LJRRuntime
//
//  Created by lujianrong on 16/6/21.
//  Copyright © 2016年 LJR. All rights reserved.
//

#import "LJRRTProperty.h"
#import <objc/runtime.h>
@implementation LJRRTProperty
+ (void)getAllMenmberVariables {
    unsigned int outCount = 0, i;
    Ivar *ivars = class_copyIvarList(self, &outCount);
    
    for (i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"\nname->  %s            type->  %s", name, type);
    }
    
    free(ivars);
}

+ (void)getAllPropertys {
    unsigned int outCount = 0, i;
    objc_property_t *propertys = class_copyPropertyList(self, &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        const char *propertyAttributes = property_getAttributes(property);
        NSLog(@"\n propertyName->%s  propertyAttributes-> %s", propertyName, propertyAttributes);
        
        [self getPropertyAttributes:property];
    }
    free(propertys);
}
/**获取Property的 Attribute*/
+ (void)getPropertyAttributes:(objc_property_t)property {
    unsigned int outCount = 0, i;
    objc_property_attribute_t *attributes = property_copyAttributeList(property, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_attribute_t attribute = attributes[i];
        const char *name = attribute.name;
        const char *value = attribute.value;
        NSLog(@"\n name: %s      value: %s", name, value);
    }
    free(attributes);
}

+ (void)propertyTest {
    //[self getAllMenmberVariables];
    [self getAllPropertys];
}
@end
