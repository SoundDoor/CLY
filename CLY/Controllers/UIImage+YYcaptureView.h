//
//  UIImage+YYcaptureView.h
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YYcaptureView)
/**
 *  该分类提供一个方法，接收一个view的参数，返回一个view的视图
 */
+(UIImage *)YYcaptureImageWithView:(UIView *)view;
@end
