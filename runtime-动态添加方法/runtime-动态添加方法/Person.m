//
//  Person.m
//  runtime-动态添加方法
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "Person.h"

#import <objc/message.h>

@implementation Person
/**
 动态添加方法，首先需要实现resolveInstanceMethod
 resolveInstanceMethod调用时机：当调用了一个没有实现的方法，该方法就会被调用
就会调用
 resolveInstanceMethod作用：就知道哪些方法没有实现
 sel：没有实现的方法
 */

//定义函数，函数的实现就是函数的入口，名字可以随便起，为了规范同名
//无返回值，参数为二
void eat(id self,SEL _cmd)
{

    NSLog(@"调用eat %@,%@",self,NSStringFromSelector(_cmd));
    
}
/*可以查看官方文档学习写法
 默认的一个方法都有两个参数，self，_cmd,隐式传入
 self:方法调用者
 _cmd:调用方法的编号
 */



//C语言语法
void EAT(id self,SEL _cmd,id param1){

    NSLog(@"调用eat：%@,%@,%@",self,NSStringFromSelector(_cmd),param1);

}


+(BOOL)resolveInstanceMethod:(SEL)sel {

   // NSLog(@"%@",NSStringFromSelector(sel));
    
    //动态添加eat方法
    if (sel == @selector(eat)) {
        /**
        cls:给哪个类添加方法
         SEL：添加方法的编号是什么
         IMP:方法的实现，函数入口即函数名（函数的指针）
        types：方法的类型
         */
        
        class_addMethod(self, @selector(eat), (IMP)eat, "v@:");
        
        //处理完
        return YES;
    }
    
    
    //动态添加有参数的方法
    
    
    /**
     可以查看官方文档获取方法的types
     v:返回值为void
     @：对象
     : 代表SEL
     
     */
    if (sel == @selector(eat:)) {
        class_addMethod(self, @selector(eat:), (IMP)EAT, "v@:@");
        
        return YES;
    }
    
    
    
    return [super resolveInstanceMethod:sel];

}



@end
