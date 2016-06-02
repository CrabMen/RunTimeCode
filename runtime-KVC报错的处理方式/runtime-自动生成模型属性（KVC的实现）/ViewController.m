//
//  ViewController.m
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
#import "Status.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.解析plist文件
    NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"status.plist" ofType:nil]];
    
    NSArray *dicArray = plistDic[@"statuses"];
    
    NSMutableArray *statuses = [NSMutableArray array];
    
    for (NSDictionary *dict in dicArray) {
        //字典转模型
        Status *status = [Status statusWithDictionary:dict];
        
        [statuses addObject:status];
    }
    
    NSLog(@"%@",statuses);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
