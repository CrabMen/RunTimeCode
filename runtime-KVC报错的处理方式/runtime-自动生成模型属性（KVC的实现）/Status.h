//
//  Status.h
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/3.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

/*手动写与地点key对应的属性
 .....
 
 需求场景：写一段代码，在解析字典时自动生成属性代码
 
 */



@property (nonatomic,strong) NSString *source;

@property (nonatomic,assign) int reposts_count;

@property (nonatomic,strong) NSArray *pic_urls;

@property (nonatomic,strong) NSString *created_at;

@property (nonatomic,assign) int attitudes_count;

@property (nonatomic,strong) NSString *idstr;

@property (nonatomic,strong) NSString *text;

@property (nonatomic,assign) int comments_count;

@property (nonatomic,strong) NSDictionary *user;


//模型的属性名跟字典一一对应
@property (nonatomic,strong) NSDictionary *retweeted_status;

//系统关键字不能命名
@property (nonatomic,strong) NSString *ID;


+ (__kindof Status*)statusWithDictionary:(NSDictionary *)dict;

@end
