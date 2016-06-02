//
//  Status.m
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/3.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "Status.h"

@implementation Status
+(Status *)statusWithDictionary:(NSDictionary *)dict {

    Status *status = [[self alloc]init];
    //KVC
    [status setValuesForKeysWithDictionary:dict];
    
    return status;
}

//解决KVC报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {

   //key:没有找到的key;value:指对应的值
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
        
        //如果value类型为number类型 ：[value integerValue]
    }
    
}
@end
