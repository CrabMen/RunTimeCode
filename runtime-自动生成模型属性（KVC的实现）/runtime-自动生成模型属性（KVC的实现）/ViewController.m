//
//  ViewController.m
//  runtime-自动生成模型属性（KVC的实现）
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.解析plist文件
    NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"status.plist" ofType:nil]];
    
    NSArray *dicArray = plistDic[@"statuses"];
    
    //2.设置属性代码(断点测试字典key的类型)
  [NSObject createPropertyCodeWithDictionary:dicArray[0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
