//
//  User.h
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/3.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,strong) NSString *profile_image_url;

@property (nonatomic,assign) BOOL vip;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign) NSInteger mbrank;

@property (nonatomic,assign) NSInteger mbtype;

@end
