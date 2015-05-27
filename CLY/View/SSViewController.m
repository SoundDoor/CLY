//
//  SSViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "SSViewController.h"
#import "YYLockView.h"
@implementation SSViewController

-(void)viewDidLoad{
    self.view.backgroundColor=[UIColor colorWithRed:0.15 green:0.16 blue:0.23 alpha:1];
    YYLockView *lock=[[YYLockView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2-160, 320, 320)];
    [self.view addSubview:lock];
    
    [self shoushishibei];
}
-(void)LockViewDidClick:(YYLockView *)lockView andPwd:(NSString *)pwd
{
    NSLog(@"密码=%@",pwd);
}
#pragma mark - 手势识别器UIGestureRecognizer
-(void)shoushishibei{
//    UIGestureRecognizer是一个抽象类定义了所有手势的基本行为使用它的子类才能处理具体的手势
//    UITapGestureRecognizer(敲击)
//    UIPinchGestureRecognizer(捏合，用于缩放)
//    UIPanGestureRecognizer(拖拽)
//    UISwipeGestureRecognizer(轻扫)
//    UIRotationGestureRecognizer(旋转)
//    UILongPressGestureRecognizer(长按)
    
    //敲击
    //每一个手势识别器的用法都差不多，比如UITapGestureRecognizer的使用步骤如下
    //（1）创建手势识别器对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    //（2）设置手势识别器对象的具体属性
    // 连续敲击2次
    tap.numberOfTapsRequired = 2;//需要敲击多少下（默认为1）
    // 需要2根手指一起敲击
    tap.numberOfTouchesRequired = 2;//需要多少根手指一起敲击（默认为1根）
    //（3）添加手势识别器到对应的view上
    [self.view addGestureRecognizer:tap];
    //（4）监听手势的触发
    [tap addTarget:self action:@selector(tapView)];
    
    
    /*
    //0.设置imageview为可交互的
    self.iconView.userInteractionEnabled=YES;
    //    //1.创建手势识别器
    //    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] init];
    //    //2.设置手势识别器的具体属性
    //    //设置敲击的次数为双击（默认为单击）
    //    tap.numberOfTapsRequired=2;
    //    //设置需要一根手指敲击（默认）
    //    tap.numberOfTouchesRequired=1;
    //    //3.把手势识别器添加到对应的view上
    //    [self.iconView addGestureRecognizer:tap];
    //    //4.监听手势的触发事件
    //    [tap addTarget:self action:@selector(tapView)];
    
    [self.iconView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)]];
     */
    
    //长按事件
    UILongPressGestureRecognizer *longpress=[[UILongPressGestureRecognizer alloc]init];
    //longpress.minimumPressDuration=3;//设置最小停留时间
    longpress.allowableMovement=50;//手指按下后事件响应前允许手指移动的偏移量
    [self.view addGestureRecognizer:longpress];//3.添加手势识别器到view
    [longpress addTarget:self action:@selector(longpressView)];//4.监听手势识别器
    
    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]init];
    //swipe.direction=UISwipeGestureRecognizerDirectionUp;//默认为向右//设置手指向右轻扫的时候触发
    swipe.direction=UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionUp;//向下和向上两个方向轻扫
    [self.view addGestureRecognizer:swipe];
    [swipe addTarget:self action:@selector(swipeView)];
    //swipe.direction=UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionUp;这种方式最多只支持个方向的清扫
    
    
    //设置四个方向的轻扫
    //向左
    UISwipeGestureRecognizer *swipeleft=[[UISwipeGestureRecognizer alloc]init];
    //设置轻扫的方向
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    [swipeleft addTarget:self action:@selector(swipeleftView)];
    
    //向右
    UISwipeGestureRecognizer *swiperight=[[UISwipeGestureRecognizer alloc]init];
    //设置轻扫的方向
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    [swiperight addTarget:self action:@selector(swiperightView)];
    
    //向下
    UISwipeGestureRecognizer *swipedown=[[UISwipeGestureRecognizer alloc]init];
    //设置轻扫的方向
    swipedown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipedown];
    [swipedown addTarget:self action:@selector(swipedownView)];
    
    //向上
    UISwipeGestureRecognizer *swipeup=[[UISwipeGestureRecognizer alloc]init];
    //设置轻扫的方向
    swipeup.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeup];
    [swipeup addTarget:self action:@selector(swipeupView)];
    
    //简略写法
    [self.view addGestureRecognizer: [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(abc)]];
    
    //拖拽事件
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]init];
    [self.view addGestureRecognizer:pan];
    [pan addTarget:self action:@selector(panView:)];
    
    //旋转
    UIRotationGestureRecognizer *gesture=[[UIRotationGestureRecognizer alloc]init];
    [self.view addGestureRecognizer:gesture];
    [gesture addTarget:self action:@selector(gestureView:)];
}
-(void)tapView{
    NSLog(@"被点击了");
}
-(void)longpressView{
    NSLog(@"发生了长按事件");
}
-(void)swipeView{
    NSLog(@"手指在屏幕上轻扫");
}
-(void)abc{
    NSLog(@"手指在屏幕上轻扫简略写法");
}
-(void)swipeleftView{
    NSLog(@"手指向左轻扫");
}
-(void)swiperightView{
    NSLog(@"手指向右轻扫");
}
-(void)swipedownView{
    NSLog(@"手指向下轻扫");
}
-(void)swipeupView{
    NSLog(@"手指向上轻扫");
}
-(void)panView:(UIPanGestureRecognizer*)pan{
    CGPoint point=[pan locationInView:pan.view];//以控制器上的view的左上角为坐标原点
    NSLog(@"拖拽事件");
    NSLog(@"获取到的触摸点的位置为:%@",NSStringFromCGPoint(point));
    CGPoint point1=[pan translationInView:pan.view];
    NSLog(@"拖拽事件1");
    NSLog(@"获取到的触摸点的位置为:%@",NSStringFromCGPoint(point1));
    CGPoint temp=self.view.center;
    temp.x+=point1.x;
    temp.y+=point1.y;
    self.view.center=temp;//手指拖动，让自定义的view也跟着手指移动
    [pan setTranslation:CGPointZero inView:pan.view];//清空
}
-(void)gestureView:(UIRotationGestureRecognizer*)gesture{
    NSLog(@"旋转事件，旋转的弧度为:%1f",gesture.rotation);//旋转的弧度：gesture.rotation
    //让图片跟随手指一起旋转
    //self.iconView.transform=CGAffineTransformMakeRotation(gesture.rotation);//每次从最初的位置开始
    //在传入的transform的基础上旋转
    //在之前的基础上，让图片跟随一起旋转（去掉自动布局）
    //注意问题：以风火轮的速度旋转
    self.view.transform=CGAffineTransformRotate(self.view.transform, gesture.rotation);
    gesture.rotation=0;//将旋转的弧度清零（注意不是将图片旋转的弧度清零，而是将当前手指旋转的弧度清零）
}

//3.响应者链条有什么用?
//可以让一个触摸事件发生的时候让多个响应者同时响应该事件
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
//    NSLog(@"%@" , self.class);
//}

/*
//该程序使用事件处理特性完成一个简单的小功能，点击界面上的view，让view可以随着鼠标（手指）的移动进行拖动。
// 触摸事件完整的调用过程touchesBegan --> touchesMoved --> touchesEnded
// 当手指触摸view的时候调用
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"手指触摸view");
}

//手指移动的时候调用
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"手指移动");
    //获取UITouch对象
    UITouch *touch=[touches anyObject];
    
//    UITouch *touch = [touches anyObject];
//    获取手指触摸的位置
//    如果locationInView传递self, 将来获取出来的位置,是以自己的左上角为原点(00)
//    如果传递的是父视图,将来获取出来的位置,是以父视图的左上角为原点(00)
//    CGPoint point = [touch locationInView:self.superview];
//    NSLog(@"touchesBegan %@", NSStringFromCGPoint(point));
//    获取手指点击的次数
//    NSLog(@"tapCount = %d", touch.tapCount);
    
    //获取手指上个位置
    CGPoint prePoint=[touch previousLocationInView:self.view];
    //打印位置信息查看
    NSLog(@"prePoint=%@",NSStringFromCGPoint(prePoint));
    
    //获取手指当前的位置
    CGPoint currentPoint=[touch locationInView:self.view];
    //打印位置信息查看
    NSLog(@"currentPoint=%@",NSStringFromCGPoint(currentPoint));
    
    //计算手指移动的距离
    CGFloat moveX=currentPoint.x-prePoint.x;
    CGFloat moveY=currentPoint.y-prePoint.y;
    
    //设置view的x和y值
    //注意：不能直接改变属性内部结构体的某个属性值
    CGPoint temp=self.view.center;
    temp.x+=moveX;
    temp.y+=moveY;
    self.view.center=temp;
    
}

//手指离开的时候调用
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"手指离开");
}

//触摸事件被打断的时候调用（如来电等）
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"打断触摸事件");
}*/




//1.响应者对象
//在iOS中不是任何对象都能处理事件，只有继承了UIResponder的对象才能接收并处理事件。我们称之为“响应者对象”
//UIApplication、UIViewController、UIView都继承自UIResponder，因此它们都是响应者对象，都能够接收并处理事件

//2.UIResponder
//UIResponder内部提供了以下方法来处理事件:

//触摸事件
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
//加速计事件
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event;
//远程控制事件
//- (void)remoteControlReceivedWithEvent:(UIEvent *)event;

//3.UIView的触摸事件处理
//UIView是UIResponder的子类，可以覆盖下列4个方法处理不同的触摸事件
//(1)一根或者多根手指开始触摸view，系统会自动调用view的下面方法
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//(2)一根或者多根手指在view上移动，系统会自动调用view的下面方法（随着手指的移动，会持续调用该方法）
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//(3)一根或者多根手指离开view，系统会自动调用view的下面方法
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//(4)触摸结束前，某个系统事件(例如电话呼入)会打断触摸过程，系统会自动调用view的下面方法
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//提示：touches中存放的都是UITouch对象

//4.UITouch
//当用户用一根触摸屏幕时，会创建一个与手指相关联的UITouch对象
//一根手指对应一个UITouch对象
//(1)UITouch的作用
//保存着跟手指相关的信息，比如触摸的位置、时间、阶段
//当手指移动时，系统会更新同一个UITouch对象，使之能够一直保存该手指在的触摸位置
//当手指离开屏幕时，系统会销毁相应的UITouch对象
//提示：iPhone开发中，要避免使用双击事件！

//(2)UITouch的属性
//触摸产生时所处的窗口 @property(nonatomic,readonly,retain) UIWindow    *window;
//触摸产生时所处的视图  @property(nonatomic,readonly,retain) UIView      *view;
//短时间内点按屏幕的次数，可以根据tapCount判断单击、双击或更多的点击 @property(nonatomic,readonly) NSUInteger      tapCount;
//记录了触摸事件产生或变化时的时间，单位是秒  @property(nonatomic,readonly) NSTimeInterval      timestamp;
//当前触摸事件所处的状态  @property(nonatomic,readonly) UITouchPhase        phase;

//(3)UITouch的方法
//1)- (CGPoint)locationInView:(UIView *)view;
//返回值表示触摸在view上的位置
//这里返回的位置是针对view的坐标系的（以view的左上角为原点(0, 0)）
//调用时传入的view参数为nil的话，返回的是触摸点在UIWindow的位置

//2)- (CGPoint)previousLocationInView:(UIView *)view;
//该方法记录了前一个触摸点的位置

//5.UIEvent
//每产生一个事件，就会产生一个UIEvent对象
//UIEvent：称为事件对象，记录事件产生的时刻和类型
//常见属性
//事件类型
//@property(nonatomic,readonly) UIEventType     type;
//@property(nonatomic,readonly) UIEventSubtype  subtype;
//事件产生的时间
//@property(nonatomic,readonly) NSTimeInterval  timestamp;
//UIEvent还提供了相应的方法可以获得在某个view上面的触摸对象（UITouch）

//6.touches和event参数
//一次完整的触摸过程，会经历3个状态：
//触摸开始：- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//触摸移动：- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//触摸结束：- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//触摸取消（可能会经历）：- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//4个触摸事件处理方法中，都有NSSet *touches和UIEvent *event两个参数
//一次完整的触摸过程中，只会产生一个事件对象，4个触摸方法都是同一个event参数
//如果两根手指同时触摸一个view，那么view只会调用一次touchesBegan:withEvent:方法，touches参数中装着2个UITouch对象
//如果这两根手指一前一后分开触摸同一个view，那么view会分别调用2次touchesBegan:withEvent:方法，并且每次调用时的touches参数中只包含一个UITouch对象
//根据touches中UITouch的个数可以判断出是单点触摸还是多点触摸
@end