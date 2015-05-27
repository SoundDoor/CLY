//
//  twoView.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "twoView.h"

@implementation twoView

//一、绘图路径
//A.简单说明
//在画线的时候，方法的内部默认创建一个path。它把路径都放到了path里面去。
//1.创建路径  cgmutablepathref 调用该方法相当于创建了一个路径，这个路径用来保存绘图信息。
//2.把绘图信息添加到路径里边。
//以前的方法是点的位置添加到ctx（图形上下文信息）中，ctx 默认会在内部创建一个path用来保存绘图信息。
//在图形上下文中有一块存储空间专门用来存储绘图信息，其实这块空间就是CGMutablePathRef。
//3.把路径添加到上下文中。
//绘制一条直线的代码：
//- (void)drawRect:(CGRect)rect {
//    CGContextRef ctx=UIGraphicsGetCurrentContext();//1.获取图形上下文
//    CGContextMoveToPoint(ctx, 20, 20);//2.绘图（画线）设置起点
//    CGContextAddLineToPoint(ctx, 200, 300);//设置终点
//    CGContextStrokePath(ctx);//渲染
//}
////上面的代码和下面的代码是等价的。
//-(void)drawRect:(CGRect)rect{
//    CGContextRef ctx=UIGraphicsGetCurrentContext();//1.获取图形上下文
//    //注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
//    CGMutablePathRef path=CGPathCreateMutable();//2.1创建一条直线绘图的路径
//    CGPathMoveToPoint(path, NULL, 20, 20);//2.2把绘图信息添加到路径里
//    CGPathAddLineToPoint(path, NULL, 200, 300);//2.2把绘图信息添加到路径里
//    CGContextAddPath(ctx, path);//2.3把路径添加到上下文中  把绘制直线的绘图信息保存到图形上下文中
//    CGContextStrokePath(ctx);//3.渲染
//    //4.释放前面创建的两条路径
//    //第一种方法
//    CGPathRelease(path);
//    //第二种方法
//    //CFRelease(path);
//}

//B.直接使用path的好处：
//第一种代码的阅读性不好，不便于区分。使用path，则一个path就代表一条路径。
//比如：如果要在上下文中绘制多个图形，这种情况下建议使用path。
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx=UIGraphicsGetCurrentContext();//1.获取图形上下文
    CGMutablePathRef path=CGPathCreateMutable();//2.a.1绘图 画一条直线 创建一条绘图的路径
    CGPathMoveToPoint(path, NULL, 20, 20);//2.a.2把绘图信息添加到路径里
    CGPathAddLineToPoint(path, NULL, 200, 300);//2.a.2把绘图信息添加到路径里
    CGContextAddPath(ctx, path);//2.a.3把路径添加到上下文中   把绘制直线的绘图信息保存到图形上下文中
    
    CGMutablePathRef path1=CGPathCreateMutable();//2.b.1画一个圆  创建一条画圆的绘图路径(注意这里是可变的，不是CGPathRef)
    CGPathAddEllipseInRect(path1, NULL, CGRectMake(50, 50, 100, 100));//2.b.2把圆的绘图信息添加到路径里
    CGContextAddPath(ctx, path1);//2.b.3把圆的路径添加到图形上下文中
    CGContextStrokePath(ctx);//3.渲染
    
    //4.释放前面创建的两条路径
    //第一种方法
    CGPathRelease(path);
    CGPathRelease(path1);
    //第二种方法
    //CFRelease(path);
//    但凡通过quarzt2d中带有creat/copy/retain方法创建出来的值都必须手动的释放
//    有两种方法可以释放前面创建的路径：
//    （1）CGPathRelease(path);
//    （2）CFRelease(path);
//    说明：CFRelease属于更底层的cocafoundation框架
}
//如果是画线那么就创建一条路径（path）用来保存画线的绘图信息，
//如果又要重新画一个圆，那么就可以创建一条新的路径来专门保存画圆的绘图信息。




//二、补充知识点：
//画四边形的一些方法：四边形的五种画法
//第一种方式：通过连接固定的点绘制四边形
//第二种方式：指定起点和宽高绘制四边形
//第三种方式：把第二种方式中的两步合并成一步。
//第四种方式（oc的方法）：绘制实心的四边形，注意没有空心的方法
//第五种：画根线，设置线条的宽度（通过这种方式可以画斜的四边形）
//- (void)drawRect:(CGRect)rect
//{
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //第一种画法,通过连接固定的点绘制四边形
//    //    CGContextMoveToPoint(ctx, 0, 20);
//    //    CGContextAddLineToPoint(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>);
//    //    CGContextAddLineToPoint(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>);
//    //    CGContextAddLineToPoint(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>);
//    
//    //第二种方式：指定起点和宽高绘制四边形
//    //    CGContextAddRect(ctx, CGRectMake(20, 20, 200, 100));
//    //    //渲染
//    //    CGContextStrokePath(ctx);
//    
//    //第三种方式：二种的两步合并成一步。
//    //画空心的四边形
//    //    CGContextStrokeRect(ctx, CGRectMake(20, 20, 200, 100));
//    //    //画实心的四边形
//    //    CGContextFillRect(ctx, CGRectMake(20, 20, 200, 100));
//    
//    //第四种方式（oc的方法）：绘制实心的四边形，注意没有空心的方法
//    UIRectFill(CGRectMake(20, 20, 200, 100));
//    
//    //第五种方式：画根线，设置线条的宽度（通过这种方式可以画斜的四边形）
//    //    CGContextMoveToPoint(ctx, 20, 20);
//    //    CGContextAddLineToPoint(ctx, 100, 200);
//    //    CGContextSetLineWidth(ctx, 50);
//    //    //注意，线条只能画成是空心的
//    //    CGContextStrokePath(ctx);
//    
//}
@end
