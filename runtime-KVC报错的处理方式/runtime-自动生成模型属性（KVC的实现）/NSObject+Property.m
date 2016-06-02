//
//  NSObject+Property.m
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 13/6/2.
//  Copyright © 2013年 CrabMan. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDictionary:(NSDictionary *)dict {


    NSMutableString *propertiesCode = [NSMutableString string];
    //遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //属性代码
        NSString *code;
      //  NSLog(@"%@,%@",propertyName,[obj class]);
      
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSString *%@;",propertyName];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
        
        code = [NSString stringWithFormat:@"@property (nonatomic,assign) NSInteger %@;",propertyName];
        
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
        
            
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;",propertyName];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
        
         code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;",propertyName];
            
        }
        
        [propertiesCode appendFormat:@"\n%@\n",code];
        
       
    } ];
    
     NSLog(@"%@",propertiesCode);
    
}

@end
