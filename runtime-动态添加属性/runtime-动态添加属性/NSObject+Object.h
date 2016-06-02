//
//  NSObject+Object.h
//  runtime-动态添加属性
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Object)

//需求：想要动态的给系统的类添加一个属性，使用分类，但是分类添加属性无效果,只会生成方法的声明，没有方法的实现，没有实际作用
@property (nonatomic,strong) NSString * name;


@end
