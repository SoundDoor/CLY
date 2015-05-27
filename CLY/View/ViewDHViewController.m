//
//  ViewDHViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "ViewDHViewController.h"
#import "YYimageView.h"
@interface ViewDHViewController ()
@property (strong, nonatomic) UIView *customView;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)YYimageView *yyimageView;
@end

@implementation ViewDHViewController
/*
+ (void)setAnimationDelegate:(id)delegate     设置动画代理对象，当动画开始或者结束时会发消息给代理对象
+ (void)setAnimationWillStartSelector:(SEL)selector   当动画即将开始时，执行delegate对象的selector，并且把beginAnimations:context:中传入的参数传进selector
+ (void)setAnimationDidStopSelector:(SEL)selector  当动画结束时，执行delegate对象的selector，并且把beginAnimations:context:中传入的参数传进selector
+ (void)setAnimationDuration:(NSTimeInterval)duration   动画的持续时间，秒为单位
+ (void)setAnimationDelay:(NSTimeInterval)delay  动画延迟delay秒后再开始
+ (void)setAnimationStartDate:(NSDate *)startDate   动画的开始时间，默认为now
+ (void)setAnimationCurve:(UIViewAnimationCurve)curve  动画的节奏控制
+ (void)setAnimationRepeatCount:(float)repeatCount  动画的重复次数
+ (void)setAnimationRepeatAutoreverses:(BOOL)repeatAutoreverses  如果设置为YES,代表动画每次重复执行的效果会跟上一次相反
+ (void)setAnimationTransition:(UIViewAnimationTransition)transition forView:(UIView *)view cache:(BOOL)cache  设置视图view的过渡效果, transition指定过渡类型, cache设置YES代表使用视图缓存，性能较好
*/

/*
 block动画
 1.简单说明
 + (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
 duration：动画的持续时间
 delay：动画延迟delay秒后开始
 options：动画的节奏控制
 animations：将改变视图属性的代码放在这个block中
 completion：动画结束后，会自动调用这个block
 转场动画
 + (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
 duration：动画的持续时间
 view：需要进行转场动画的视图
 options：转场动画的类型
 animations：将改变视图属性的代码放在这个block中
 completion：动画结束后，会自动调用这个block
 
 + (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completion
 方法调用完毕后，相当于执行了下面两句代码：
 // 添加toView到父视图
 [fromView.superview addSubview:toView];
 // 把fromView从父视图中移除
 [fromView.superview removeFromSuperview];
 duration：动画的持续时间
 options：转场动画的类型
 animations：将改变视图属性的代码放在这个block中
 completion：动画结束后，会自动调用这个block
 */

/*
三、补充
1.UIImageView的帧动画
UIImageView可以让一系列的图片在特定的时间内按顺序显示
相关属性解析:
animationImages：要显示的图片(一个装着UIImage的NSArray)
animationDuration：完整地显示一次animationImages中的所有图片所需的时间
animationRepeatCount：动画的执行次数(默认为0，代表无限循环)
相关方法解析:
- (void)startAnimating; 开始动画
- (void)stopAnimating;  停止动画
- (BOOL)isAnimating;  是否正在运行动画

2.UIActivityIndicatorView
是一个旋转进度轮，可以用来告知用户有一个操作正在进行中，一般用initWithActivityIndicatorStyle初始化
方法解析:
- (void)startAnimating; 开始动画
- (void)stopAnimating;  停止动画
- (BOOL)isAnimating;  是否正在运行动画
UIActivityIndicatorViewStyle有3个值可供选择：
UIActivityIndicatorViewStyleWhiteLarge   //大型白色指示器
UIActivityIndicatorViewStyleWhite      //标准尺寸白色指示器
UIActivityIndicatorViewStyleGray    //灰色指示器，用于白色背景
*/

-(void)viewDidLoad{
    _customView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 230, 200)];
    [self.view addSubview:_customView];
    _customView.backgroundColor=[UIColor grayColor];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //打印动画块的位置
    NSLog(@"动画执行之前的位置：%@",NSStringFromCGPoint(self.customView.center));
    
    //首尾式动画
    [UIView beginAnimations:nil context:nil];
    //执行动画
    //设置动画执行时间
    [UIView setAnimationDuration:2.0];
    //设置代理
    [UIView setAnimationDelegate:self];
    //设置动画执行完毕调用的事件
    [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
    self.customView.center=CGPointMake(200, 300);
    [UIView commitAnimations];
    
    
    
    
    //1.创建核心动画
    CABasicAnimation *anima=[CABasicAnimation animation];
    //平移
    anima.keyPath=@"position";
    //设置执行的动画
    anima.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    //设置执行动画的时间
    anima.duration=2.0;
    //设置动画执行完毕之后不删除动画
    anima.removedOnCompletion=NO;
    //设置保存动画的最新状态
    anima.fillMode=kCAFillModeForwards;
    //    anima.fillMode=kCAFillModeBackwards;
    
    //设置动画的代理
    anima.delegate=self;
    
    //2.添加核心动画
    [self.customView.layer addAnimation:anima forKey:nil];
    
    //block代码块动画
    [UIView transitionWithView:self.customView duration:3.0 options:0 animations:^{
        //执行的动画
        NSLog(@"动画开始执行前的位置：%@",NSStringFromCGPoint(self.customView.center));
        self.customView.center=CGPointMake(200, 300);
        //self.customView.layer.position和self.customView.center等价，因为position的默认值为（0.5，0.5）
    } completion:^(BOOL finished) {
        //动画执行完毕后的首位操作
        NSLog(@"动画执行完毕");
        NSLog(@"动画执行完毕后的位置：%@",NSStringFromCGPoint( self.customView.center));
    }];
    
//    //系统的UIImageview的使用
//    UIImageView *iv=[[UIImageView alloc]init];
//    iv.image=[UIImage imageNamed:@"a"];
//    iv.frame=CGRectMake(0, 100, 100, 100);
//    [self.view addSubview:iv];
    
    //在主控制器中，模仿系统自带的UIImageView的使用过程，实现同样的效果。
    //自定义UIImageView
    //1.创建
    //2.设置图片
    //3.设置frame
    //4.把创建的自定义的view添加到界面上
    YYimageView *yyiv=[[YYimageView alloc]init];
    yyiv.image=[UIImage imageNamed:@"a"];
    yyiv.frame=CGRectMake(100, 100, 100, 100);
    [self.view addSubview:yyiv];
    self.yyimageView=yyiv;
    
    //添加一个button按钮，当点击button按钮的时候，切换图片
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 50)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"点击切换" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
//    Quartz2D提供了以下几种类型的Graphics Context
//    Bitmap Graphics Context
//    PDF Graphics Context
//    Window Graphics Context
//    Layer Graphics Context
//    Printer Graphics Context
//    只要上下文不同，绘制的地方就不同。
//    本文说明如何把图片绘制到Bitmap上面去，即要求生成一张图片，图片上面保存了绘图信息。
//    Bitmap就是图片，相当于系统的UIimage。一个UIImage就是一个Bitmap
    

    //加载图片
    //0.创建一个Bitmap上下文
    //c语言的方法
    //    CGBitmapContextCreate(<#void *data#>, <#size_t width#>, <#size_t height#>, <#size_t bitsPerComponent#>, <#size_t bytesPerRow#>, <#CGColorSpaceRef space#>, <#CGBitmapInfo bitmapInfo#>)
    //oc中封装的方法
    //方法1
    //    UIGraphicsBeginImageContext(<#CGSize size#>);
    //方法2
    UIGraphicsBeginImageContextWithOptions( CGSizeMake(200, 200), NO, 0);
    //1.获取bitmap上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.绘图(画一个圆)
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    //3.渲染
    CGContextStrokePath(ctx);
    //4.获取生成的图片
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //5.显示生成的图片到imageview
    self.imageView.image=image;
    //6.保存绘制好的图片到文件中
    //先将图片转换为二进制数据，然后再将图片写到文件中
    //    UIImageJPEGRepresentation(image, 1); //第二个参数为保存的图片的效果
    NSData *data=UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/apple/Desktop/abc.png" atomically:YES];
    
    /*
    1.创建Bitmap图形上下文的方法
    //方法1   UIGraphicsBeginImageContext(<#CGSize size#>);
    //方法2 UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
    使用两个方法同样都可以创建，但是使用第一个方法将来创建的图片清晰度和质量没有第二种方法的好。
    方法2接收三个参数：
    CGSize size：指定将来创建出来的bitmap的大小
    BOOL opaque：设置透明YES代表透明，NO代表不透明
    CGFloat scale：代表缩放,0代表不缩放
    创建出来的bitmap就对应一个UIImage对象
    2.Quartz2D的内存管理
    使用含有“Create”或“Copy”的函数创建的对象，使用完后必须释放，否则将导致内存泄露
    使用不含有“Create”或“Copy”的函数获取的对象，则不需要释放
    如果retain了一个对象，不再使用时，需要将其release掉
    可以使用Quartz 2D的函数来指定retain和release一个对象。例如，如果创建了一个CGColorSpace对象，则使用函数CGColorSpaceRetain和CGColorSpaceRelease来retain和release对象。
    也可以使用Core Foundation的CFRetain和CFRelease。注意不能传递NULL值给这些函数
     */
}
-(void)btnClick
{
    NSLog(@"按钮被点击了");
    self.yyimageView.image=[UIImage imageNamed:@"3"];
}
-(void)didStopAnimation
{
    NSLog(@"动画执行完毕");
    //打印动画块的位置
    NSLog(@"动画执行之后的位置：%@",NSStringFromCGPoint(self.customView.center));
}
//使用UIView和CALayer都能实现动画效果，但是在真实的开发中，一般还是主要使用UIView封装的动画，而很少使用CALayer的动画。
//UIView封装的动画执行完毕之后不会反弹。即如果是通过CALayer核心动画改变layer的位置状态，表面上看虽然已经改变了，但是实际上它的位置是没有改变的。
-(void)animationDidStart:(CAAnimation *)anim
{
    //打印动画块的位置
    //    NSLog(@"动画开始执行前的位置：%@",NSStringFromCGPoint(self.customView.center));
    NSLog(@"动画开始执行前的位置：%@",NSStringFromCGPoint( self.customView.layer.position));
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //打印动画块的位置
    NSLog(@"动画执行完毕后的位置：%@",NSStringFromCGPoint( self.customView.layer.position));
}
@end