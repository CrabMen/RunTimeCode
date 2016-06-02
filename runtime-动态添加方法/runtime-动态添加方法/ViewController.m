//
//  ViewController.m
//  runtime-动态添加方法
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     动态添加方法使用场景：
     如果一个类中方法非常多，加载到内存中非常耗费资源，需要给每个方法生成映射表，可以给某个类动态添加方法实现（类似于懒加载，需要的时候才实现）。
     performSelector：动态添加方法
     
     */
    
    
    Person *person = [[Person alloc]init];
    
    //动态添加方法（无参数无返回值）
   // [person performSelector:@selector(eat)];
    
    //动态添加方法（有参）
    [person performSelector:@selector(eat:) withObject:@1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
