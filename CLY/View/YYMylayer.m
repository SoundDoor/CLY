//
//  YYMylayer.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "YYMylayer.h"

@implementation YYMylayer
//重写该方法，在该方法内绘制图形
-(void)drawInContext:(CGContextRef)ctx
{
    //1.绘制图形
    //画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    //设置属性（颜色）
    //    [[UIColor yellowColor]set];
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    //2.渲染
    CGContextFillPath(ctx);
}
@end