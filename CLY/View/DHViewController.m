//
//  DHViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "DHViewController.h"
#define angle2Radian(angle)  ((angle)/180.0*M_PI)
@interface DHViewController ()
@property(nonatomic,strong)CALayer *myLayer;
@property(strong, nonatomic)UIView *customView;
- (void)stopOnClick:(UIButton *)sender;//停止动画

@property (strong, nonatomic) UIImageView *iconView;

@property(nonatomic,assign) int index;
- (void)preOnClick:(UIButton *)sender;
- (void)nextOnClick:(UIButton *)sender;

@end

@implementation DHViewController


-(void)viewDidLoad{
    /*
    CAPropertyAnimation的子类
    随着动画的进行，在长度为duration的持续时间内，keyPath相应属性的值从fromValue渐渐地变为toValue
    
    如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。
    但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    CALayer的position初始值为(0,0)，CABasicAnimation的fromValue为(10,10)，toValue为(100,100)，虽然动画执行完毕后图层保持在(100,100)这个位置，实质上图层的position还是为(0,0)
    */
    
    
    /*
    CApropertyAnimation的子类，跟CABasicAnimation的区别是：CABasicAnimation只能从一个数值(fromValue)变到另一个数值(toValue)，而CAKeyframeAnimation会使用一个NSArray保存这些数值
    values就是上述的NSArray对象。里面的元素称为”关键帧”(keyframe)。动画对象会在指定的时间(duration)内，依次显示values数组中的每一个关键帧
    path可以设置一个CGPathRef\CGMutablePathRef,让层跟着路径移动。path只对CALayer的anchorPoint和position起作用。如果你设置了path，那么values将被忽略
    keyTimes可以为对应的关键帧指定对应的时间点,其取值范围为0到1.0,keyTimes中的每一个时间值都对应values中的每一帧.当keyTimes没有设置的时候,各个关键帧的时间是平分的
    说明：CABasicAnimation可看做是最多只有2个关键帧的CAKeyframeAnimation
    */
    
    /*
    转场动画简单介绍
    CAAnimation的子类，用于做转场动画，能够为层提供移出屏幕和移入屏幕的动画效果。iOS比Mac OS X的转场动画效果少一点
    UINavigationController就是通过CATransition实现了将控制器的视图推入屏幕的动画效果
    属性解析:
    type：动画过渡类型
    subtype：动画过渡方向
    startProgress：动画起点(在整体动画的百分比)
    endProgress：动画终点(在整体动画的百分比)
    */
    
    /*
    组动画简单说明
    CAAnimation的子类，可以保存一组动画对象，将CAAnimationGroup对象加入层后，组中所有动画对象可以同时并发运行
    属性解析：
    animations：用来保存一组动画对象的NSArray
    默认情况下，一组动画对象是同时运行的，也可以通过设置动画对象的beginTime属性来更改动画的开始时间
    */
    
    
    //平移动画
    //创建layer
    CALayer *myLayer=[CALayer layer];
    //设置layer的属性
    myLayer.bounds=CGRectMake(0, 0, 50, 80);//CGRectMake(0, 0, 150, 60);
    myLayer.backgroundColor=[UIColor yellowColor].CGColor;
    myLayer.position=CGPointMake(50, 50);
    myLayer.anchorPoint=CGPointMake(0, 0);
    myLayer.cornerRadius=40;//20
    //添加layer
    [self.view.layer addSublayer:myLayer];
    self.myLayer=myLayer;
    
    
    _customView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 230, 200)];
    [self.view addSubview:_customView];
    _customView.backgroundColor=[UIColor grayColor];
    
    _iconView=[[UIImageView alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
    _iconView.image=[UIImage imageNamed:@"a"];
    [self.view addSubview:_iconView];
    
    self.index=1;
    
    
    UIButton *one=[[UIButton alloc]initWithFrame:CGRectMake(300, 400, 100, 40)];
    one.backgroundColor=[UIColor redColor];
    [one addTarget:self action:@selector(preOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:one];
    
    UIButton *two=[[UIButton alloc]initWithFrame:CGRectMake(300, 450, 100, 40)];
    two.backgroundColor=[UIColor redColor];
    [two addTarget:self action:@selector(nextOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:two];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    //旋转
//    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"transform"];
//    anima.duration=2.0;
//    anima.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 1, 1, 0)];//修改属性执行动画
//    //如果要让图形以2D的方式旋转，只需要把CATransform3DMakeRotation在z方向上的值改为1即可。
//    //anima.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 1, 1, 0)];
//    
//    anima.removedOnCompletion=NO;
//    anima.fillMode=kCAFillModeForwards;//1.4设置保存动画的最新状态
//    [self.myLayer addAnimation:anima forKey:nil];
    
//    //缩放
//    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"bounds"];//1.创建动画
//    anima.duration=2.0;//1.1设置动画执行时间
//    anima.removedOnCompletion=NO;//1.2设置动画执行完毕后不删除动画
//    anima.fillMode=kCAFillModeForwards;//1.3设置保存动画的最新状态
//    anima.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];//1.4修改属性，执行动画
//    [self.myLayer addAnimation:anima forKey:nil];//2.添加动画到layer
    
    /*
    //1.创建核心动画
    //    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:<#(NSString *)#>]
    CABasicAnimation *anima=[CABasicAnimation animation];
    
    //1.1告诉系统要执行什么样的动画
    anima.keyPath=@"position";//设置的keyPath是@"position"，说明要修改的是CALayer的position属性，也就是会执行平移动画
    //设置通过动画，将layer从哪儿移动到哪儿
    anima.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anima.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 300)];
    //这里的属性接收的时id类型的参数，因此并不能直接使用CGPoint这种结构体类型，而是要先包装成NSValue对象后再使用
    
    //默认情况下，动画执行完毕后，动画会自动从CALayer上移除，CALayer又会回到原来的状态
    //1.2设置动画执行完毕之后不删除动画
    anima.removedOnCompletion=NO;//为了保持动画执行后的状态加入代码
    //1.3设置保存动画的最新状态
    anima.fillMode=kCAFillModeForwards;//为了保持动画执行后的状态加入代码
    
    //
    //设置动画的代理，可以监听动画的执行过程，这里设置控制器为代理。
    anima.delegate=self;
    //打印
    NSString *str=NSStringFromCGPoint(self.myLayer.position);
    NSLog(@"执行前：%@",str);
    //
    
    //2.添加核心动画到layer
    [self.myLayer addAnimation:anima forKey:nil];
    //byValue和toValue的区别，前者是在当前的位置上增加多少，后者是到指定的位置
     */
    
//    //可以通过transform（KVC）的方式来进行设置。
//    CABasicAnimation *anima=[CABasicAnimation animation];
//    anima.keyPath=@"transform";
//    anima.duration=2.0;
//    anima.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 100, 1)];
//    anima.removedOnCompletion=NO;
//    anima.fillMode=kCAFillModeForwards;
//    [self.myLayer addAnimation:anima forKey:nil];
    
//    //平移
//    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
//    keyAnima.keyPath=@"position";
//    //1.1告诉系统要执行什么动画
//    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
//    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
//    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
//    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    keyAnima.values=@[value1,value2,value3,value4,value5];
//    //1.2设置动画执行完毕后，不删除动画
//    keyAnima.removedOnCompletion=NO;
//    //1.3设置保存动画的最新状态
//    keyAnima.fillMode=kCAFillModeForwards;
//    //1.4设置动画执行的时间
//    keyAnima.duration=4.0;
//    //1.5设置动画的节奏
//    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    
//    //设置代理，开始—结束
//    keyAnima.delegate=self;
//    //2.添加核心动画
//    [self.customView.layer addAnimation:keyAnima forKey:nil];
    
//    //第二种方式（使用path）让layer在指定的路径上移动（画圆）
//    //1.创建核心动画
//    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
//    //平移
//    keyAnima.keyPath=@"position";
//    //1.1告诉系统要执行什么动画
//    //创建一条路径
//    CGMutablePathRef path=CGPathCreateMutable();
//    //设置一个圆的路径
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
//    keyAnima.path=path;
//    
//    //有create就一定要有release
//    CGPathRelease(path);
//    //1.2设置动画执行完毕后，不删除动画
//    keyAnima.removedOnCompletion=NO;
//    //1.3设置保存动画的最新状态
//    keyAnima.fillMode=kCAFillModeForwards;
//    //1.4设置动画执行的时间
//    keyAnima.duration=5.0;
//    //1.5设置动画的节奏
//    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    
////    //设置代理，开始—结束
////    keyAnima.delegate=self;
////    //2.添加核心动画
////    [self.customView.layer addAnimation:keyAnima forKey:nil];
//    
//    //2.添加核心动画
//    [self.customView.layer addAnimation:keyAnima forKey:@"wendingding"];
    
    
    
    //图标向左向右偏转一个弧度（4），产生抖动的视觉效果
    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    keyAnima.keyPath=@"transform.rotation";
    //设置动画时间
    keyAnima.duration=0.1;
    //设置图标抖动弧度
    //把度数转换为弧度  度数/180*M_PI
    keyAnima.values=@[@(-angle2Radian(4)),@(angle2Radian(4)),@(-angle2Radian(4))];
    //设置动画的重复次数(设置为最大值)
    keyAnima.repeatCount=MAXFLOAT;
    
    keyAnima.fillMode=kCAFillModeForwards;
    keyAnima.removedOnCompletion=NO;
    //2.添加动画
    [self.iconView.layer addAnimation:keyAnima forKey:nil];
    
    
    //平移-旋转-缩放作为一组动画一起执行
    // 平移动画
    CABasicAnimation *a1 = [CABasicAnimation animation];
    a1.keyPath = @"transform.translation.y";
    a1.toValue = @(100);
    // 缩放动画
    CABasicAnimation *a2 = [CABasicAnimation animation];
    a2.keyPath = @"transform.scale";
    a2.toValue = @(0.0);
    // 旋转动画
    CABasicAnimation *a3 = [CABasicAnimation animation];
    a3.keyPath = @"transform.rotation";
    a3.toValue = @(M_PI_2);
    
    // 组动画
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    groupAnima.animations = @[a1, a2, a3];
    //设置组动画的时间
    groupAnima.duration = 2;
    groupAnima.fillMode = kCAFillModeForwards;
    groupAnima.removedOnCompletion = NO;
    [self.iconView.layer addAnimation:groupAnima forKey:nil];
}

- (void)stopOnClick:(UIButton *)sender {
    //停止self.customView.layer上名称标示为wendingding的动画
    [self.customView.layer removeAnimationForKey:@"wendingding"];
}
-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始执行动画");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //动画执行完毕，打印执行完毕后的position值
    NSString *str=NSStringFromCGPoint(self.myLayer.position);
    NSLog(@"执行后：%@",str);
}

//CAAnimation是所有动画类的父类，但是它不能直接使用，应该使用它的子类。

//常见属性有
//duration动画的持续时间
//repeatCount动画的重复次数
//timingFunction控制动画运行的节奏

//能用的动画类只有4个子类CABasicAnimation、CAKeyframeAnimation、CATransition、CAAnimationGroup
//CAMediaTiming是一个协议(protocol)。
//CAPropertyAnimation是CAAnimation的子类，但是不能直接使用，要想创建动画对象，应该使用它的两个子类：CABasicAnimation和CAKeyframeAnimation
//它有个NSString类型的keyPath属性，你可以指定CALayer的某个属性名为keyPath，并且对CALayer的这个属性的值进行修改，达到相应的动画效果。比如，指定@"position"为keyPath，就会修改CALayer的position属性的值，以达到平移的动画效果

//所有动画对象的父类，负责控制动画的持续时间和速度，是个抽象类，不能直接使用，应该使用它具体的子类
//属性解析：(红色代表来自CAMediaTiming协议的属性)
//duration：动画的持续时间
//repeatCount：动画的重复次数
//repeatDuration：动画的重复时间
//removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
//fillMode：决定当前对象在非active时间段的行为.比如动画开始之前,动画结束之后
//beginTime：可以用来设置动画延迟执行时间，若想延迟2s，就设置为CACurrentMediaTime()+2，CACurrentMediaTime()为图层的当前时间
//timingFunction：速度控制函数，控制动画运行的节奏
//delegate：动画代理



- (void)preOnClick:(UIButton *)sender {
    self.index--;
    if (self.index<1) {
        self.index=7;
    }
    self.iconView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d",self.index]];
    
    //创建核心动画
    CATransition *ca=[CATransition animation];
    //告诉要执行什么动画
    //设置过度效果
    ca.type=@"cube";
    //设置动画的过度方向（向左）
    ca.subtype=kCATransitionFromLeft;
    //设置动画的时间
    ca.duration=2.0;
    //添加动画
    [self.iconView.layer addAnimation:ca forKey:nil];
}

//下一张
- (void)nextOnClick:(UIButton *)sender {
    self.index++;
    if (self.index>7) {
        self.index=1;
    }
    self.iconView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d",self.index]];
    
    //1.创建核心动画
    CATransition *ca=[CATransition animation];
    
    //1.1告诉要执行什么动画
    //1.2设置过度效果
    ca.type=@"cube";
    //1.3设置动画的过度方向（向右）
    ca.subtype=kCATransitionFromRight;
    //1.4设置动画的时间
    ca.duration=2.0;
    //1.5设置动画的起点
    ca.startProgress=0.5;
    //1.6设置动画的终点
    //    ca.endProgress=0.5;
    
    //2.添加动画
    [self.iconView.layer addAnimation:ca forKey:nil];
}
@end