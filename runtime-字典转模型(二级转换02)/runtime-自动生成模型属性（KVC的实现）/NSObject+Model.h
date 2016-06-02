//
//  NSObject+Model.h
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/3.
//  Copyright © 2016年 CrabMan. All rights reserved.
// runtime字典转模型

#import <Foundation/Foundation.h>

@interface NSObject (Model)

+ (instancetype)modelWithDictionary:(NSDictionary *)dict;


@end
