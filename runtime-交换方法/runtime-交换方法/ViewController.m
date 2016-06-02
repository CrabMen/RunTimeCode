//
//  ViewController.m
//  runtime-交换方法
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+Image.h"

#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

//加载这个分类的时候就会调用
+ (void)load {

    NSLog(@"%s",__func__);
    
    /*
      class_getClassMethod(, ):获取类方法
      class_getInstanceMethod(, ):获取对象方法
      class_getMethodImplementation(, );获取方法的实现
    方法实现的返回值为MIP
     
     */
    
    
    
    //方法的获取
    // Class 对应的类对象 SEL：获取方法编号，根据SEL就能去对应的类的方法列表寻找方法
    Method imagedNamedMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    Method CM_imagedNamedMethod = class_getClassMethod([UIImage class], @selector(CM_imagedNamed:));
   
    
    //交换方法的实现:(会出现死循环)修改自定义方法的实现
    method_exchangeImplementations(imagedNamedMethod, CM_imagedNamedMethod);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     imageNamed加载图片，并不知道图片是否加载成功
     需求场景：调用imageNamed的时候，知道图片是否加载成功
     */
    UIImage *image = [UIImage imageNamed:@"123"];
    
    /*
     1.每次使用都需要导入头文件
     2.当项目开发太久，使用该方法修改过于繁琐
     */
    [UIImage CM_imagedNamed:@"123"];
    
    /*使用runtime实现调用系统的imageNamed方法时候底层调自定义方法
    本质：交换两个方法的
     
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
