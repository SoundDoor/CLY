//
//  YYview.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "YYview.h"

@implementation YYview

#pragma mark 飘雪花
////私有扩展
//@property(nonatomic,assign)float imageY;
//
//-(id)initWithCoder:(NSCoder *)aDecoder
//{
//    //请注意这里一定要先初始化父类的构造方法
//    if (self=[super initWithCoder:aDecoder]) {
//        NSLog(@"initWithCoder:");
//        
//        //NSTimer一般用于定时的更新一些非界面上的数据,告诉多久调用一次
//        //使用定时器,使用该定时器会出现卡顿的现象
//        //        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateImage) userInfo:nil repeats:YES];
//        
//        // CADisplayLink刷帧，默认每秒刷新60次
//        //该定时器创建之后，默认是不会执行的，需要把它加载到消息循环中
//        CADisplayLink *display= [CADisplayLink displayLinkWithTarget:self selector:@selector(updateImage)];
//        [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
//        
//    }
//    return self;
//}
//-(void)updateImage
//{
//    //调用该方法重绘画面
//    [self setNeedsDisplay];
//}
//- (void)drawRect:(CGRect)rect
//{
//    //把图片绘制到view上
//    
//    //每次调用该方法对画面进行重绘时，imageY的值就+5
//    self.imageY+=5;
//    //判断，当雪花超出屏幕的时候，让图片从头开始降落
//    if (self.imageY>rect.size.height) {
//        self.imageY=0;
//    }
//    UIImage *image=[UIImage imageNamed:@"snow"];
//    [image drawAtPoint:CGPointMake(0, self.imageY)];
//    
//    UIImage *image2=[UIImage imageNamed:@"me"];
//    [image2 drawAtPoint:CGPointMake(80, self.imageY)];
//    
//}

//下面两个方法的调用顺序
//-(void)awakeFromNib
//-(id)initWithCoder:(NSCoder *)aDecoder
//提示：如果view是从xib或storyboard中创建可以调用awakefromnib方法，归档。从文件创建view，其实会先调用initwithcoder这个方法。xib和storyboard也是文件。
//上面两个方法，-(id)initWithCoder:(NSCoder *)aDecoder会先调用。实现该方法需要实现NSCoding协议，由于创建的UIView默认就已经实现了该协议。

//两个定时器
//第一个：
//[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateImage) userInfo:nil repeats:YES];
//说明： NSTimer一般用于定时的更新一些非界面上的数据,告诉多久调用一次
//
//第二个：
//CADisplayLink *display= [CADisplayLink displayLinkWithTarget:self selector:@selector(updateImage)];
//[display addToRunLoop:[NSRunLoopmainRunLoop] forMode:NSDefaultRunLoopMode];
//说明： CADisplayLink刷帧，默认每秒刷新60次。该定时器创建之后，默认是不会执行的，需要把它加载到消息循环中



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.backgroundColor=[UIColor colorWithWhite:0.2 alpha:0.5];
//        self.layer.cornerRadius=9.0;
    }
    return self;
}

//自定义view中的圆不显示
//重写set方法，为半径赋值
-(void)setRadius:(float)radius
{
    _radius=radius;
    //通知自定义的view重新绘制图形
    [self setNeedsDisplay];
}

//如果view是从xib或storyboard中创建出来的会先调用awakefromnib方法
- (void)awakeFromNib
{
    //在这里为圆的半径设定一个初始的值
    self.radius = 20;
}

- (void)drawRect:(CGRect)rect
{
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.绘图
    //在自定义的view中画一个圆
    CGContextAddArc(ctx, 100, 100, self.radius, 0, 2*M_PI, 0);
    //设置圆的填充颜色
    [[UIColor grayColor]set];
    
    //3.渲染
    //    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}
@end