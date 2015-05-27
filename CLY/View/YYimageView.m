//
//  YYimageView.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

/**
 *  Quartz2D最大的用途在于自定义View(自定义UI控件)模仿系统的imageview的使用过程
 1.创建
 2.设置图片
 3.设置frame
 4.把创建的自定义的view添加到界面上（在自定义的View中，需要一个image属性接收image图片参数->5)。
 5.添加一个image属性(接下来，拿到image之后，应该把拿到的这个image给渲染出来。怎么渲染？自定义的view怎么把图片显示出来？->把图片给画出来，所以需要重写自定义View的drawRect:方法)。
 6.重写自定义View的drawRect:方法，在该方法内部画出图形。
 *
 *  @return <#return value description#>
 */

#import "YYimageView.h"

@implementation YYimageView
//重写drawRect:方法
- (void)drawRect:(CGRect)rect
{
    [self.image drawInRect:rect];
}
//重写set方法
-(void)setImage:(UIImage *)image
{
    _image=image;
    [self setNeedsDisplay];
}
@end