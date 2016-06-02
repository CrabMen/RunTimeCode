//
//  Person.m
//  runtime-运行机制
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (void)eat {

    NSLog(@"类方法--吃东西");

}

- (void)eat {

    NSLog(@"对象方法--吃东西");

}

-(void)run:(int)meter {

    NSLog(@"跑了%d米",meter);
}
@end
