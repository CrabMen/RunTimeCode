//
//  NSObject+Property.m
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDictionary:(NSDictionary *)dict {
 //目标代码：@property (nonatomic,strong) NSString *name;
    
//    
//    //属性策略:判断value类型，对象用strong，基本数据类型用assign
//    NSString *policy;
//    
//    //属性类型,判断value类型
//    NSString *type;
    //属性名
    //  NSString *propertyName;

    
    
    NSMutableString *propertiesCode = [NSMutableString string];
    //遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //属性代码
        NSString *code;
      //  NSLog(@"%@,%@",propertyName,[obj class]);
      
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSString *%@;",propertyName];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
        
        code = [NSString stringWithFormat:@"@property (nonatomic,assign) int %@;",propertyName];
        
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
        
            
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;",propertyName];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
        
         code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;",propertyName];
            
        }
        
        [propertiesCode appendFormat:@"\n%@\n",code];
        
       
    } ];
    
     NSLog(@"%@",propertiesCode);
    
    

   // code = [NSString stringWithFormat:@"@property (nonatomic,%@) %@ %@",policy,type,propertyName];
    
}

@end
