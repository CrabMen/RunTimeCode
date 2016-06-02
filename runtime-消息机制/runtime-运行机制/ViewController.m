//
//  ViewController.m
//  runtime-运行机制
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

//1.运行时使用第一步
//2.BuildSetting ->msg 设置为NO
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [Person new];
    //方法未实现时，编译不会出错，运行会出错
  //  [person eat];
    
    /*OC:运行时机制，消息机制是运行是机制最重要的机制
    消息机制：任何方法调用，本质都是发送消息
     */
    
    //SEL:方法编号，根据方法编号就可以找到对应方法方法的实现
   // [person performSelector:@selector(eat)];
    
    /*本质：运行时，发送消息
    Xcode5之后，苹果不建议使用底层方法，所以send_message方法将参数注释掉了
     Xcode5之后，使用运行需，设置buildsetting
     */
    
    //让person发送一个消息
  //  objc_msgSend(person, @selector(eat));
    objc_msgSend(person, @selector(run:),10);
    
    /*类方法的调用
    方法调用必须为对象，本质类名被转为类对象调用方法
     */
    
    Class personClass = [Person class];
    [personClass performSelector:@selector(eat)];
    
    
    //运行时
    objc_msgSend(personClass, @selector(run:),10);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
