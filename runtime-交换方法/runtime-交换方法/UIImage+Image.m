//
//  UIImage+Image.m
//  runtime-交换方法
//
//  Created by CrabMan on 16/6/2.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

/*运行时解决
 先使用一个方法实现功能，然后交换
 */
+(UIImage *)CM_imagedNamed:(NSString *)imageNamed {

  //1.加载图片
    //修改后，相当于调用系统imageNamed方法
    UIImage *image = [UIImage CM_imagedNamed:imageNamed];
  //2.判断功能 也可以通过抛异常的方式
    
    if (image == nil) {
        NSLog(@"加载image为空");
    }
    
    return image;

}

//想要调用UIImage的ImageNamed方法，分类没有父类，该方法pass
//+ (UIImage *)imageNamed:(NSString *)name {
//
//
//    super image
//
//}
@end
