//
//  ViewController.m
//  runtime-动态添加属性
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+Object.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSObject *objc = [NSObject new];
    objc.name = @"123";
    
    NSLog(@"%@",objc.name);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
