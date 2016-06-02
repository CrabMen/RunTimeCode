//
//  NSObject+Property.h
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 13/6/2.
//  Copyright © 2013年 CrabMan. All rights reserved.
//  通过解析字典自动生成属性代码

#import <Foundation/Foundation.h>

@interface NSObject (Property)

+ (void)createPropertyCodeWithDictionary:(NSDictionary*)dict;

@end
