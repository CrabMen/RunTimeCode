//
//  NSObject+Object.m
//  runtime-动态添加属性
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "NSObject+Object.h"
#import <objc/message.h>
@implementation NSObject (Object)


//可以模拟属性的实现
static NSString*_name;


//表明对应的key


-(void)setName:(NSString *)name {
    //添加属性的本质：让类的key与对应的value对象产生关联,policy:保存策略;void *就是id的意思
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //_name =name;
}

-(NSString *)name {
 
 return  objc_getAssociatedObject(self, @"name");

}
@end
