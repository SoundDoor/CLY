//
//  LineView.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "LineView.h"

@implementation LineView

//-(instancetype)init{
//    if (self==[super init]) {
//        [self setNeedsDisplay];
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor colorWithWhite:0.2 alpha:0.5];
        self.layer.cornerRadius=9.0;
    }
    return self;
}

// 当自定义view第一次显示出来的时候就会调用drawRect方法
/*/画直线
- (void)drawRect:(CGRect)rect
{
    // 1.取得和当前视图相关联的图形上下文(因为图形上下文决定绘制的输出目标)/
    // 如果是在drawRect方法中调用UIGraphicsGetCurrentContext方法获取出来的就是Layer的上下文
    CGContextRef  ctx=UIGraphicsGetCurrentContext();//不需要*,同id
    
    // 2.绘图(绘制直线), 保存绘图信息
    // 设置起点
    CGContextMoveToPoint(ctx, 20, 100);
    //设置终点
    CGContextAddLineToPoint(ctx, 300, 100);
    
    //设置绘图的状态
    //设置线条的颜色为蓝色
    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 1.0);
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 15);
    //设置线条起点和终点的样式为圆角
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //设置线条的转角的样式为圆角
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //3.渲染（绘制出一条空心的线）
    CGContextStrokePath(ctx);
    //注意线条不能渲染为实心的
    //CGContextFillPath(ctx);
    
    //设置第二条线
    //设置第二条线的起点
    CGContextMoveToPoint(ctx, 50, 200);
    //设置第二天线的终点(自动把上一条直线的终点当做起点)
    CGContextAddLineToPoint(ctx, 300, 60);
    
    //设置绘图的状态
    //    CGContextSetRGBStrokeColor(ctx, 1.0, 0.7, 0.3, 1.0);
    //第二种设置颜色的方式
    [[UIColor grayColor] set];
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 10);
    //设置线条的起点和终点的样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    //渲染第二条线的图形到view上
    //绘制一条空心的线
    CGContextStrokePath(ctx);
}*/

/*/画三角形
- (void)drawRect:(CGRect)rect
{
    //1.获得图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    //2.绘制三角形
    //设置起点
    CGContextMoveToPoint(ctx, 20, 100);
    //设置第二个点
    CGContextAddLineToPoint(ctx, 40, 300);
    //设置第三个点
    CGContextAddLineToPoint(ctx, 200, 200);
    //设置终点
    //     CGContextAddLineToPoint(ctx, 20, 100);
    //关闭起点和终点
    CGContextClosePath(ctx);
    
    // 3.渲染图形到layer上
    CGContextStrokePath(ctx);
    //关闭起点和终点  CGContextClosePath(ctx);
}*/

/*/画四边形
- (void)drawRect:(CGRect)rect
{
    
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.画四边形
    CGContextAddRect(ctx, CGRectMake(20, 20, 150, 100));
    
    // 如果要设置绘图的状态必须在渲染之前
    //    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
    // 绘制什么类型的图形(空心或者实心).就要通过什么类型的方法设置状态
    //    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
    
    // 调用OC的方法设置绘图的颜色
    //    [[UIColor purpleColor] setFill];
    //    [[UIColor blueColor] setStroke];
    // 调用OC的方法设置绘图颜色(同时设置了实心和空心)
    //    [[UIColor greenColor] set];
    [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] set];
    
    
    //3.渲染图形到layer上
    //空心的
    //CGContextStrokePath(ctx);
    //实心的
    CGContextFillPath(ctx);
    //如果要设置绘图的状态实心和空心...）必须在渲染之前。
}*/
/*/画圆
- (void)drawRect:(CGRect)rect
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画圆
    CGContextAddArc(ctx, 100, 100, 50, 0, 2 * M_PI, 0);
    
    // 3.渲染 (注意, 画线只能通过空心来画)
    //    CGContextFillPath(ctx);
    CGContextStrokePath(ctx);
}*/
/*/ 画圆
- (void)drawRect:(CGRect)rect
{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 50, 50));
    
    [[UIColor greenColor] set];
    
    // 3.渲染
    //    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}*/
/*/画椭圆
-(void)drawRect:(CGRect)rect
{
    // 画椭圆
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 100, 230));
    
    [[UIColor purpleColor] set];

    // 3.渲染
    //    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}*/
/*/画圆弧
-(void)drawRect:(CGRect)rect
{
    // 画圆弧
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆弧
    // x/y 圆心
    // radius 半径
    // startAngle 开始的弧度
    // endAngle 结束的弧度
    // clockwise 画圆弧的方向 (0 顺时针, 1 逆时针)
    //    CGContextAddArc(ctx, 100, 100, 50, -M_PI_2, M_PI_2, 0);
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    CGContextClosePath(ctx);
    
    // 3.渲染
    //     CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}*/
/*
-(void)drawRect:(CGRect)rect{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画饼状图
    // 画线
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 100, 150);
    // 画圆弧
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    //    CGContextAddArc(ctx, 100, 100, 50, -M_PI, M_PI_2, 1);
    
    // 关闭路径
    CGContextClosePath(ctx);
    [[UIColor brownColor]set];
    
    
    // 3.渲染 (注意, 画线只能通过空心来画)
    CGContextFillPath(ctx);
    //    CGContextStrokePath(ctx);
}*/
/*/画文字
- (void)drawRect:(CGRect)rect
{
    // 画文字
    NSString *str = @"的额搜风搜分手了粉色发俄双方说法offFF瓦房你F回复F入会费WFH；飞；FN返回WFH；哦发货；F回复；FHISFHSIFH我皮肤好APIFRHi分红AWFHIOF威锋网i";
    
    // 1.获取上下文
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图
    // 不推荐使用C语言的方法绘制文字, 因为quraz2d中的坐标系和UIkit中的坐标系不一致, 绘制出来的文字是颠倒的, 而且通过C语言的方法绘制文字相当麻烦
    //    CGContextSelectFont(<#CGContextRef c#>, <#const char *name#>, <#CGFloat size#>, <#CGTextEncoding textEncoding#>)
    //    CGContextShowText(ctx, <#const char *string#>, <#size_t length#>)
    
    // 绘制矩形
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图
    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
    // 3.渲染
    CGContextStrokePath(ctx);
    
    
    //    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    //    // 设置文字颜色
    //    md[NSForegroundColorAttributeName] =[UIColor redColor];
    //    // 设置文字背景颜色
    //    md[NSBackgroundColorAttributeName] = [UIColor greenColor];
    //    // 设置文字大小
    //    md[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    //    将文字绘制到指点的位置
    //    [str drawAtPoint:CGPointMake(10, 10) withAttributes:md];
    
    //    将文字绘制到指定的范围内, 如果一行装不下会自动换行, 当文字超出范围后就不显示
    [str drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:nil];
}*/
/*/图片
- (void)drawRect:(CGRect)rect
{
    //    1.加载图片到内存中
    UIImage *image = [UIImage imageNamed:@"me"];
    // 利用drawAsPatternInRec方法绘制图片到layer, 是通过平铺原有图片
    [image drawAsPatternInRect:CGRectMake(0, 0, 320, 480)];
}*/
/*/效果（拉伸图片）
- (void)drawRect:(CGRect)rect
{
    //    1.加载图片到内存中
    UIImage *image = [UIImage imageNamed:@"me"];
    // 利用OC方法将图片绘制到layer上
    
    // 利用drawInRect方法绘制图片到layer, 是通过拉伸原有图片
    [image drawInRect:CGRectMake(0, 0, 200, 200)];
    
    // 利用drawAsPatternInRec方法绘制图片到layer, 是通过平铺原有图片
    //    [image drawAsPatternInRect:CGRectMake(0, 0, 320, 480)];
}*/

/*/效果（把图片绘制到一个固定的位置）：
- (void)drawRect:(CGRect)rect
{
    
    //    1.加载图片到内存中
    UIImage *image = [UIImage imageNamed:@"me"];
    
    
    // 利用OC方法将图片绘制到layer上
    
    // 将图片绘制到指定的位置
    [image drawAtPoint:CGPointMake(100, 100)];
}*/

//新建一个项目，自定义一个view类和storyboard关联后，重写该类中的drowrect方法。
//画线的三个步骤：
//（1）获取上下文
//（2）绘图

/*/画两条单独的线
- (void)drawRect:(CGRect)rect
{
    //获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //绘图
    //第一条线
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 100, 320);
    
    //第二条线
    CGContextMoveToPoint(ctx, 40, 200);
    CGContextAddLineToPoint(ctx, 80, 100);
    //渲染
    CGContextStrokePath(ctx);
}*/

/*/设置线段的宽度：两头为圆形，颜色等。
//代码和效果图（发现第二条线也被渲染成第一条线的样式和状态）
- (void)drawRect:(CGRect)rect
{
    //获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //绘图
    //第一条线
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 100, 320);
    
    //设置第一条线的状态
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 12);
    //设置线条的颜色
    [[UIColor brownColor]set];
    //设置线条两端的样式为圆角
    CGContextSetLineCap(ctx,kCGLineCapRound);
    //对线条进行渲染
    CGContextStrokePath(ctx);
    
    //第二条线
    CGContextMoveToPoint(ctx, 40, 200);
    CGContextAddLineToPoint(ctx, 80, 100);
    //渲染
    CGContextStrokePath(ctx);
}*/

/*/新的需求：要让两条线的颜色不一样，要求第二条线变成原版的样子。要达到上面的要求，有以下几种做法：
//第一种做法  在对第二条线进行设置的时候，清空它的状态
- (void)drawRect:(CGRect)rect
{
    //获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //绘图
    //第一条线
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 100, 320);
    
    //设置第一条线的状态
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 12);
    //设置线条的颜色
    [[UIColor brownColor]set];
    //设置线条两端的样式为圆角
    CGContextSetLineCap(ctx,kCGLineCapRound);
    //对线条进行渲染
    CGContextStrokePath(ctx);
    
    //第二条线
    CGContextMoveToPoint(ctx, 40, 200);
    CGContextAddLineToPoint(ctx, 80, 100);
    
    //清空状态
    CGContextSetLineWidth(ctx, 1);
    [[UIColor blackColor]set];
    CGContextSetLineCap(ctx,kCGLineCapButt);
    
    //渲染
    CGContextStrokePath(ctx);
}*/
//第二种做法
//把第一条线从开始绘制到渲染的代码剪切到第二条线渲染完成之后，这样先绘制并渲染了第一条线，该线并没有对绘制信息进行过设置，显示出来的第二条线即位系统默认的效果。
/*- (void)drawRect:(CGRect)rect
{
    //获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //绘图
    
    //第二条线
    CGContextMoveToPoint(ctx, 40, 200);
    CGContextAddLineToPoint(ctx, 80, 100);
    //清空状态
    //    CGContextSetLineWidth(ctx, 1);
    //    [[UIColor blackColor]set];
    
    //    CGContextSetLineCap(ctx,kCGLineCapButt);
    //渲染
    CGContextStrokePath(ctx);
    
    //第一条线
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 100, 320);
    
    //设置第一条线的状态
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 12);
    //设置线条的颜色
    [[UIColor brownColor]set];
    //设置线条两端的样式为圆角
    CGContextSetLineCap(ctx,kCGLineCapRound);
    //对线条进行渲染
    CGContextStrokePath(ctx);
}*/

//但是有的情况下，必须要先画第一条线再画第二条线，要求在交叉部分，第二条线盖在第一条线的上面。如果要求是这样，那么只能使用第一种做法，但是如果现在有新的需求，要求在这个基础上再画两条线，那就需要清空ctx中的状态很多次，很麻烦。为了解决这个问题，下面给大家介绍图形上下文栈。
//
//二、绘图的完整过程
//程序启动，显示自定义的view。当程序第一次显示在我们眼前的时候，程序会调用drawRect:方法，在里面获取了图形上下文（在内存中拥有了），然后利用图形上下文保存绘图信息，可以理解为图形上下文中有一块区域用来保存绘图信息，有一块区域用来保存绘图的状态（线宽，圆角，颜色）。直线不是直接绘制到view上的，可以理解为在图形上下文中有一块单独的区域用来先绘制图形，当调用渲染方法的时候，再把绘制好的图形显示到view上去。
//
//在绘制图形区域，会去保存绘图状态区域中查找对应的状态信息（线宽，圆角，颜色），然后在绘图区域把对第一条直线绘制完成。其实在渲染之前，就已经把直线在绘制图形区域画好了。
//
//
//画第二条的时候，如果没有对绘图状态进行重新设置，那么可以发现画第一天线的时候使用的绘图状态还保存在图形上下文中，在第二条线进行渲染之前，会根据第一条线（上一份绘图状态）对第二条线进行相应的设置，渲染后把第二条线显示到屏幕上。
//参考代码：
/*- (void)drawRect:(CGRect)rect
{
    //获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //绘图
    //第一条线
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 100, 320);
    
    //设置第一条线的状态
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 12);
    //设置线条的颜色
    [[UIColor brownColor]set];
    //设置线条两端的样式为圆角
    CGContextSetLineCap(ctx,kCGLineCapRound);
    //对线条进行渲染
    CGContextStrokePath(ctx);
    
    //第二条线
    CGContextMoveToPoint(ctx, 40, 200);
    CGContextAddLineToPoint(ctx, 80, 100);
    //渲染
    CGContextStrokePath(ctx);
}*/
//如果清空了状态，则在渲染之前，在绘制图形区域对第二条线进行绘制的时候，会去查找当前的绘图信息（已经更改——清空），根据绘图信息对第二条线进行绘制，调用渲染方法的时候把第二条线显示到view上。
//参考代码：
//- (void)drawRect:(CGRect)rect
//{
//    //获取上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //绘图
//    //第一条线
//    CGContextMoveToPoint(ctx, 20, 100);
//    CGContextAddLineToPoint(ctx, 100, 320);
//    
//    //设置第一条线的状态
//    //设置线条的宽度
//    CGContextSetLineWidth(ctx, 12);
//    //设置线条的颜色
//    [[UIColor brownColor]set];
//    //设置线条两端的样式为圆角
//    CGContextSetLineCap(ctx,kCGLineCapRound);
//    //对线条进行渲染
//    CGContextStrokePath(ctx);
//    
//    //第二条线
//    CGContextMoveToPoint(ctx, 40, 200);
//    CGContextAddLineToPoint(ctx, 80, 100);
//    
//    //清空状态
//    CGContextSetLineWidth(ctx, 1);
//    [[UIColor blackColor]set];
//    CGContextSetLineCap(ctx,kCGLineCapButt);
//    
//    //渲染
//    CGContextStrokePath(ctx);
//}
//三、图形上下文栈
//1.简单说明
//在获取图形上下文之后，通过 CGContextSaveGState(ctx); 方法，把当前获取的上下文拷贝一份，保存一份最纯洁的图形上下文。
//在画第二条线之前，使用CGContextRestoreGState(ctx);方法，还原开始的时候保存的那份最纯洁的图形上下文。
//代码：
//- (void)drawRect:(CGRect)rect
//{
//    //获取上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //保存一份最初的图形上下文
//    CGContextSaveGState(ctx);
//    
//    //绘图
//    //第一条线
//    CGContextMoveToPoint(ctx, 20, 100);
//    CGContextAddLineToPoint(ctx, 100, 320);
//    
//    //设置第一条线的状态
//    //设置线条的宽度
//    CGContextSetLineWidth(ctx, 12);
//    //设置线条的颜色
//    [[UIColor brownColor]set];
//    //设置线条两端的样式为圆角
//    CGContextSetLineCap(ctx,kCGLineCapRound);
//    //对线条进行渲染
//    CGContextStrokePath(ctx);
//    
//    //还原开始的时候保存的那份最纯洁的图形上下文
//    CGContextRestoreGState(ctx);
//    //第二条线
//    CGContextMoveToPoint(ctx, 40, 200);
//    CGContextAddLineToPoint(ctx, 80, 100);
//    
//    //清空状态
//    //    CGContextSetLineWidth(ctx, 1);
//    //    [[UIColor blackColor]set];
//    //    CGContextSetLineCap(ctx,kCGLineCapButt);
//    
//    //渲染
//    CGContextStrokePath(ctx);
//}
//2.图形上下文栈机制
//画第一条线的时候，会把当前的图形上下文拷贝一份保存到图形上下文栈中。
//
//画第二条线的时候，去图形上下文栈中取出栈顶的绘图信息，作为第二条线的状态信息，第二条线的状态信息也是据此（最初保存的那份图形上下文）进行绘制。
//注意：在栈里保存了几次，那么就可以取几次（比如不能保存了1次，取两次，在取第二次的时候，栈里为空会直接挂掉）。
//
////矩阵操作
//1.画一个四边形
//通过设置两个端点（长和宽）来完成一个四边形的绘制。
//- (void)drawRect:(CGRect)rect
//{
//    //画四边形
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //绘图
//    CGContextAddRect(ctx, CGRectMake(20, 50, 100, 100));
//    //渲染
//    CGContextStrokePath(ctx);
//    //通过这种方式画矩形有弱点：画出来的矩形永远都是正的。
//}
//2.画一个歪的四边形
//如何画一个歪的矩形？（通过矩阵操作来完成，和形变操作相似）
//可以通过矩阵操作，把画出来的东西进行形变（旋转，缩放，平移）
//方法：CGContextRotateCTM(<#CGContextRef c#>, <#CGFloat angle#>)该接受两个参数（图形上下文，弧度）
//注意点：设置矩阵操作必须要在添加图形之前，如果设置在添加图形之后的话，此时它已经画完了，无效。
//- (void)drawRect:(CGRect)rect
//{
//    //画四边形
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //矩阵操作
//    //注意点：设置矩阵操作必须要在添加绘图信息之前
//    //旋转45度
//    CGContextRotateCTM(ctx, M_PI_4);
//    
//    //绘图
//    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
//    //渲染
//    CGContextStrokePath(ctx);
//}
//二、关于旋转
//1.旋转演示
//view之所以能够显示视图，是因为它的上面有layer,将来图形也是渲染到layer上面。
//且，旋转的时候是整个layer都旋转了，可以再画一个圆进行验证。
//代码1（未旋转）：
//- (void)drawRect:(CGRect)rect
//{
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //矩阵操作
//    //注意点：设置矩阵操作必须要在添加绘图信息之前
//    //旋转45度
//    //    CGContextRotateCTM(ctx, M_PI_4);
//    
//    //绘图
//    //画四边形
//    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
//    //画一个圆
//    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 50, 50));
//    //渲染
//    CGContextStrokePath(ctx);
//}
//代码2(旋转):
//- (void)drawRect:(CGRect)rect
//{
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //矩阵操作
//    //注意点：设置矩阵操作必须要在添加绘图信息之前
//    //旋转45度
//    CGContextRotateCTM(ctx, M_PI_4);
//    
//    //绘图
//    //画四边形
//    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
//    //画一个圆
//    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 50, 50));
//    //渲染
//    CGContextStrokePath(ctx);
//}
//2.关于旋转的补充说明
//提示：旋转的时候，是整个layer都旋转了。
//
//三、缩放
//方法:CGContextScaleCTM(<#CGContextRef c#>, <#CGFloat sx#>, <#CGFloat sy#>)
//该方法接收三个参数（图形上下文，x方向的缩放比例，y方向上的缩放比例
//代码示例：
//- (void)drawRect:(CGRect)rect
//{
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //矩阵操作
//    //注意点：设置矩阵操作必须要在添加绘图信息之前
//    //缩放，x方向缩放0.5倍，y方向缩放1.5倍
//    CGContextScaleCTM(ctx, 0.5, 1.5);
//    
//    //绘图
//    //画四边形
//    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
//    //画一个圆
//    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 50, 50));
//    //渲染
//    CGContextStrokePath(ctx);
//}
//四、平移
//方法： CGContextTranslateCTM(<#CGContextRef c#>, <#CGFloat tx#>, <#CGFloat ty#>)
//该方法接收三个参数（图形上下文，x方向的偏移量，y方向上的偏移量）
//代码示例：
//- (void)drawRect:(CGRect)rect
//{
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //矩阵操作
//    //注意点：设置矩阵操作必须要在添加绘图信息之前
//    //平移，x方向移动50，y方向移动100
//    CGContextTranslateCTM(ctx, 50, 100);
//    
//    //绘图
//    //画四边形
//    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
//    //画一个圆
//    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 50, 50));
//    //渲染
//    CGContextStrokePath(ctx);
//    //提示：坐标原点为view的左上角。
//}
//
//一、使用Quartz2D完成图片剪切
//1.把图片显示在自定义的view中
//先把图片绘制到view上。按照原始大小，把图片绘制到一个点上。
//代码：
//- (void)drawRect:(CGRect)rect
//{
//    UIImage *image2=[UIImage imageNamed:@"me"];
//    [image2 drawAtPoint:CGPointMake(100, 100)];
//}
//
//2.剪切图片让图片圆形展示
//思路：先画一个圆，让图片显示在圆的内部，超出的部分不显示。
//注意：显示的范围只限于指定的剪切范围，无论往上下文中绘制什么东西，只要超出了这个范围的都不会显示。
//代码：
//- (void)drawRect:(CGRect)rect
//{
//    //画圆，以便以后指定可以显示图片的范围
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 50, 50));
//    
//    //指定上下文中可以显示内容的范围就是圆的范围
//    CGContextClip(ctx);
//    UIImage *image2=[UIImage imageNamed:@"me"];
//    [image2 drawAtPoint:CGPointMake(100, 100)];
//}
//
//3.剪切图片让图片三角形展示
//- (void)drawRect:(CGRect)rect
//{
//    
//    //画三角形，以便以后指定可以显示图片的范围
//    //获取图形上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 50, 50));
//    CGContextMoveToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 60, 150);
//    CGContextAddLineToPoint(ctx, 140, 150);
//    CGContextClosePath(ctx);
//    
//    
//    //注意：指定范围（也就是指定剪切的方法一定要在绘制范围之前进行调用）
//    //指定上下文中可以显示内容的范围就是圆的范围
//    CGContextClip(ctx);
//    UIImage *image2=[UIImage imageNamed:@"me"];
//    [image2 drawAtPoint:CGPointMake(100, 100)];
//}
@end
