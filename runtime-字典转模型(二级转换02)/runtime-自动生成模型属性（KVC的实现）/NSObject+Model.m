//
//  NSObject+Model.m
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/3.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/message.h>
@implementation NSObject (Model)

+(instancetype)modelWithDictionary:(NSDictionary *)dict {

    //创建对应类的对象
    id objc = [[self alloc]init];
    
    /*runtime:遍历模型中的所有属性，去字典中查找
    属性定义在位置：定义在类里面，类里面有个属性列表（数组）
     */
    
    /*遍历模型类的所有属性名
     Ivar:成员属性，即成员变量
     class_copyIvarList：会把成员属性列表复制一份并返回
     Ivar *：方法返回值，指向ivar数组第一个元素的指针
     Class:获取哪个类的成员属性列表
     count:成员属性的总数
     */
    
  unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i = 0;i < count ;i++) {
        //获取成员属性
        Ivar ivar = ivarList[i];
        
        //获取成员名以及成员属性类型
      NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar) ];
      NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar) ];
        
        NSLog(@"%@,%@",propertyName,propertyType);
        
        
        /*给模型的属性赋值
         key：属性名,将成员属性名变为key，去掉前面的下划线
         value：字典的值,获取字典的value
         */
        NSString *key = [propertyName substringFromIndex:1];;
        
        id value = dict[key];
        
        //需要对value判断，值是字典，成员属性的类型不是字典，才需要二级转换
        if ([value isKindOfClass:[NSDictionary class]]&&![propertyType containsString:@"NS"]) {
            //转换成哪个类型
            NSLog(@"%@",propertyType);
            
            /*获取需要转化类的类对象,根据类名转化为对象
             但是断点以后发现propertyType为@"@\"User\""
             需要截取propertyType获得类名
             */
            
            NSRange range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringFromIndex:range.location+range.length];
            
            range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringToIndex:range.location];
            //根据类名转化为类对象
            Class modelClass = NSClassFromString(propertyType);
            if (modelClass) {
            [modelClass modelWithDictionary:value];
            }
            
            
        }
        
        if (value) {
            //防止报错
            [objc setValue:value forKey:key];

        }
        
    }
    
    NSLog(@"%d",count);
    
    

    return objc;
}

@end
