//
//  ViewController.m
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "NSObject+Model.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 KVC:遍历字典中所有的key，去模型中查找有没有对应的属性名
 runtime:遍历模型中所有的所有属性名，去字典中查找
 使用场景：模型中只保存对自己有用的数据，但是KVC属性必须与字典中一一对应，无用的属性就会浪费资源，此时可以使用runtime
 
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.解析plist文件
    NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"status.plist" ofType:nil]];
    
    NSArray *dicArray = plistDic[@"statuses"];
    
    NSMutableArray *statuses = [NSMutableArray array];
    
    for (NSDictionary *dict in dicArray) {
        //runtime字典转模型
        Status *status = [Status modelWithDictionary:dict];
        
        [statuses addObject:status];
    }
    
    NSLog(@"%@",statuses);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
