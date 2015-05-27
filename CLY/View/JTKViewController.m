//
//  JTKViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/5.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "JTKViewController.h"

@implementation JTKViewController

//UIDynamic是从iOS 7开始引入的一种新技术，隶属于UIKit框架
//可以认为是一种物理引擎，能模拟和仿真现实生活中的物理现象
//如：重力、弹性碰撞等现象
//
//2.物理引擎的价值
//广泛用于游戏开发，经典成功案例是“愤怒的小鸟”
//让开发人员可以在远离物理学公式的情况下，实现炫酷的物理仿真效果
//提高了游戏开发效率，产生更多优秀好玩的物理仿真游戏
//
//3.知名的2D物理引擎
//Box2d
//Chipmunk
//
//二、使用步骤
//要想使用UIDynamic来实现物理仿真效果，大致的步骤如下
//（1）创建一个物理仿真器（顺便设置仿真范围）
//（2）创建相应的物理仿真行为（顺便添加物理仿真元素）
//（3）将物理仿真行为添加到物理仿真器中  开始仿真
//
//三、相关说明
//1.三个概念
//（1）谁要进行物理仿真？
//　　物理仿真元素（Dynamic Item）
//（2）执行怎样的物理仿真效果？怎样的动画效果？
//　　物理仿真行为（Dynamic Behavior）
//（3）让物理仿真元素执行具体的物理仿真行为
//　　物理仿真器（Dynamic Animator）
//
//2.物理仿真元素
//注意：
//不是任何对象都能做物理仿真元素
//不是任何对象都能进行物理仿真
//
//物理仿真元素要素：
//任何遵守了UIDynamicItem协议的对象
//UIView默认已经遵守了UIDynamicItem协议，因此任何UI控件都能做物理仿真
//UICollectionViewLayoutAttributes类默认也遵守UIDynamicItem协议
//
//3.物理仿真行为
//（1）UIDynamic提供了以下几种物理仿真行为
//UIGravityBehavior：重力行为
//UICollisionBehavior：碰撞行为
//UISnapBehavior：捕捉行为
//UIPushBehavior：推动行为
//UIAttachmentBehavior：附着行为
//UIDynamicItemBehavior：动力元素行为
//
//（2）物理仿真行为须知
//上述所有物理仿真行为都继承自UIDynamicBehavior
//所有的UIDynamicBehavior都可以独立进行
//组合使用多种行为时，可以实现一些比较复杂的效果
//
//4.物理仿真器
//（1）物理仿真器须知
//它可以让物理仿真元素执行物理仿真行为
//它是UIDynamicAnimator类型的对象
//（2）UIDynamicAnimator的初始化
//- (instancetype)initWithReferenceView:(UIView *)view;
//view参数：是一个参照视图，表示物理仿真的范围
//
//5.物理仿真器的说明
//（1）UIDynamicAnimator的常见方法
//　　- (void)addBehavior:(UIDynamicBehavior *)behavior;  　　//添加1个物理仿真行为
//　　- (void)removeBehavior:(UIDynamicBehavior *)behavior;　　//移除1个物理仿真行为
//　　- (void)removeAllBehaviors;  　　//移除之前添加过的所有物理仿真行为
//
//（2）UIDynamicAnimator的常见属性
//　　@property (nonatomic, readonly) UIView* referenceView;  //参照视图
//　　@property (nonatomic, readonly, copy) NSArray* behaviors;//添加到物理仿真器中的所有物理仿真行为
//　　@property (nonatomic, readonly, getter = isRunning) BOOL running;//是否正在进行物理仿真
//　　@property (nonatomic, assign) id <UIDynamicAnimatorDelegate> delegate;//代理对象（能监听物理仿真器的仿真过程，比如开始和结束）
//
//iOS开发拓展篇—UIDynamic(重力行为+碰撞检测)
//一、重力行为
//说明：给定重力方向、加速度，让物体朝着重力方向掉落
//1.方法
//（1）UIGravityBehavior的初始化
//　　- (instancetype)initWithItems:(NSArray *)items;
//　　　　item参数 ：里面存放着物理仿真元素
//
//（2）UIGravityBehavior常见方法
//　　- (void)addItem:(id <UIDynamicItem>)item;
//　　　　添加1个物理仿真元素
//　　- (void)removeItem:(id <UIDynamicItem>)item;
//　　　　移除1个物理仿真元素
//
//2.UIGravityBehavior常见属性
//@property (nonatomic, readonly, copy) NSArray* items;
//　　添加到重力行为中的所有物理仿真元素
//@property (readwrite, nonatomic) CGVector gravityDirection;
//　　重力方向（是一个二维向量）
//@property (readwrite, nonatomic) CGFloat angle;
//　　重力方向（是一个角度，以x轴正方向为0°，顺时针正数，逆时针负数）
//@property (readwrite, nonatomic) CGFloat magnitude;
//　　量级（用来控制加速度，1.0代表加速度是1000 points /second²）
//
//二、碰撞行为
//1.简介
//说明：可以让物体之间实现碰撞效果
//　　可以通过添加边界（boundary），让物理碰撞局限在某个空间中
//
//2.UICollisionBehavior边界相关的方法
//- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier forPath:(UIBezierPath*)bezierPath;
//- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier fromPoint:(CGPoint)p1 toPoint:(CGPoint)p2;
//- (UIBezierPath*)boundaryWithIdentifier:(id <NSCopying>)identifier;
//- (void)removeBoundaryWithIdentifier:(id <NSCopying>)identifier;
//@property (nonatomic, readonly, copy) NSArray* boundaryIdentifiers;
//- (void)removeAllBoundaries;
//
//3.UICollisionBehavior常见用法
//@property (nonatomic, readwrite) BOOL translatesReferenceBoundsIntoBoundary;
//　　是否以参照视图的bounds为边界
//- (void)setTranslatesReferenceBoundsIntoBoundaryWithInsets:(UIEdgeInsets)insets;
//　　设置参照视图的bounds为边界，并且设置内边距
//@property (nonatomic, readwrite) UICollisionBehaviorMode collisionMode;
//　　碰撞模式（分为3种，元素碰撞、边界碰撞、全体碰撞）
//@property (nonatomic, assign, readwrite) id <UICollisionBehaviorDelegate> collisionDelegate;
//　　代理对象（可以监听元素的碰撞过程）
//
////
////  YYViewController.m
////  12-重力行为和碰撞行为
////
////  Created by apple on 14-8-6.
////  Copyright (c) 2014年 yangyong. All rights reserved.
////
//
//#import "YYViewController.h"
//
//@interface YYViewController ()
//@property (weak, nonatomic) IBOutlet UIView *redView;
//
//@property (weak, nonatomic) IBOutlet UIProgressView *block1;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *block2;
//
//@property(nonatomic,strong)UIDynamicAnimator *animator;
//@end
//
//@implementation YYViewController
//-(UIDynamicAnimator *)animator
//{
//    if (_animator==nil) {
//        //创建物理仿真器（ReferenceView:参照视图，设置仿真范围）
//        self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
//    }
//    return _animator;
//}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    //设置红色view的角度
//    self.redView.transform=CGAffineTransformMakeRotation(M_PI_4);
//}
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //1.重力行为
//    //    [self testGravity];
//    //2.重力行为+碰撞检测
//    //    [self testGravityAndCollsion];
//    //3.测试重力的一些属性
//    [self testGravityAndCollsion2];
//    //用2根线作为边界
//    //    [self testGravityAndCollision3];
//    //4.用圆作为边界
//    //    [self testGravityAndCollision4];
//}
//
///**
// *  重力行为
// */
//-(void)testGravity
//{
//    //1.创建仿真行为（进行怎样的仿真效果？）
//    //重力行为
//    UIGravityBehavior *gravity=[[UIGravityBehavior alloc]init];
//    //2.添加物理仿真元素
//    [gravity addItem:self.redView];
//    //3.执行仿真，让物理仿真元素执行仿真行为
//    [self.animator addBehavior:gravity];
//}
///**
// *  重力行为+碰撞检测
// */
//-(void)testGravityAndCollsion
//{
//    //1.重力行为
//    UIGravityBehavior *gravity=[[UIGravityBehavior alloc]init];
//    [gravity addItem:self.redView];
//    
//    //2碰撞检测行为
//    UICollisionBehavior *collision=[[UICollisionBehavior alloc]init];
//    [collision addItem:self.redView];
//    [collision addItem:self.block1];
//    [collision addItem:self.block2];
//    
//    //让参照视图的边框成为碰撞检测的边界
//    collision.translatesReferenceBoundsIntoBoundary=YES;
//    
//    //3.执行仿真
//    [self.animator addBehavior:gravity];
//    [self.animator addBehavior:collision];
//}
//
///**
// *  测试重力行为的属性
// */
//-(void)testGravityAndCollsion2
//{
//    //1.重力行为
//    UIGravityBehavior *gravity=[[UIGravityBehavior alloc]init];
//    //（1）设置重力的方向（是一个角度）
//    //    gravity.angle=(M_PI_2-M_PI_4);
//    //（2）设置重力的加速度,重力的加速度越大，碰撞就越厉害
//    gravity.magnitude=100;
//    //（3）设置重力的方向（是一个二维向量）
//    gravity.gravityDirection=CGVectorMake(0, 1);
//    [gravity addItem:self.redView];
//    
//    //2碰撞检测行为
//    UICollisionBehavior *collision=[[UICollisionBehavior alloc]init];
//    [collision addItem:self.redView];
//    [collision addItem:self.block1];
//    [collision addItem:self.block2];
//    
//    //让参照视图的边框成为碰撞检测的边界
//    collision.translatesReferenceBoundsIntoBoundary=YES;
//    
//    //3.执行仿真
//    [self.animator addBehavior:gravity];
//    [self.animator addBehavior:collision];
//    
//}
//
///**
// *  用圆作为边界
// */
//- (void)testGravityAndCollision4
//{
//    // 1.重力行为
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
//    [gravity addItem:self.redView];
//    
//    // 2.碰撞检测行为
//    UICollisionBehavior *collision = [[UICollisionBehavior alloc] init];
//    [collision addItem:self.redView];
//    
//    // 添加一个椭圆为碰撞边界
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 320, 320)];
//    [collision addBoundaryWithIdentifier:@"circle" forPath:path];
//    
//    // 3.开始仿真
//    [self.animator addBehavior:gravity];
//    [self.animator addBehavior:collision];
//}
//
///**
// *  用2根线作为边界
// */
//- (void)testGravityAndCollision3
//{
//    // 1.重力行为
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] init];
//    [gravity addItem:self.redView];
//    
//    // 2.碰撞检测行为
//    UICollisionBehavior *collision = [[UICollisionBehavior alloc] init];
//    [collision addItem:self.redView];
//    CGPoint startP = CGPointMake(0, 160);
//    CGPoint endP = CGPointMake(320, 400);
//    [collision addBoundaryWithIdentifier:@"line1" fromPoint:startP toPoint:endP];
//    CGPoint startP1 = CGPointMake(320, 0);
//    [collision addBoundaryWithIdentifier:@"line2" fromPoint:startP1 toPoint:endP];
//    //    collision.translatesReferenceBoundsIntoBoundary = YES;
//    
//    // 3.开始仿真
//    [self.animator addBehavior:gravity];
//    [self.animator addBehavior:collision];
//}
//@end
//代码补充说明：
//
//（1）加速度
//
//速度：point/s
//
//加速度：point/s²
//
//1\2 * 加速度 * t²
//
//　gravity.magnitude = 1000; // 重力加速度越大，碰撞越厉害
//
//（2）重力的方向
//
//　　坐标如下：
//
//重力方向（二维向量）
//
//说明：给定坐标平面内的一个点。然后用原点（0，0）来连接它，就构成了一个向量。
//
//注意：在IOS中以左上角为坐标原点，向右x增加，向下Y越大。
//
//　　　　
//
//1     //（3）设置重力的方向（是一个二维向量）
//2     gravity.gravityDirection=CGVectorMake(-1, 1);
//重力方向为左下角（西南）方向
//
//（3）碰撞检测行为
//UICollisionBehavior *collision = [[UICollisionBehavior alloc] init];
//[collision addItem:self.redView];
//CGPoint startP = CGPointMake(0, 160);
//CGPoint endP = CGPointMake(320, 400);
//[collision addBoundaryWithIdentifier:@"line1" fromPoint:startP toPoint:endP];
//CGPoint startP1 = CGPointMake(320, 0);
//[collision addBoundaryWithIdentifier:@"line2" fromPoint:startP1 toPoint:endP];
//注意：标识符不能写空。可以写字符串，因为需要标识符需要遵守NSCopying协议，而字符串满足要求。
//
//（4）贝赛尔曲线
//
//　　
//
//提示：这里的path是一个圆，设置宽高不一样，那么得出来的就是一个椭圆。
//
//iOS开发拓展篇—UIDynamic(捕捉行为)
//
//一、简介
//
//可以让物体迅速冲到某个位置（捕捉位置），捕捉到位置之后会带有一定的震动
//
//UISnapBehavior的初始化
//
//　　- (instancetype)initWithItem:(id <UIDynamicItem>)item snapToPoint:(CGPoint)point;
//
//
//
//UISnapBehavior常见属性
//
//　　@property (nonatomic, assign) CGFloat damping;
//
//　　用于减幅、减震（取值范围是0.0 ~ 1.0，值越大，震动幅度越小）
//
//
//
//UISnapBehavior使用注意
//
//　　如果要进行连续的捕捉行为，需要先把前面的捕捉行为从物理仿真器中移除
//
//在storyboard中放一个view控件，作为演示用的仿真元素。
//
//代码如下：
//
////
////  YYViewController.m
////  13-捕捉行为
////
////  Created by apple on 14-8-8.
////  Copyright (c) 2014年 yangyong. All rights reserved.
////
//
//#import "YYViewController.h"
//
//@interface YYViewController ()
//@property (weak, nonatomic) IBOutlet UIView *blueView;
//@property(nonatomic,strong)UIDynamicAnimator *animator;
//@end
//
//@implementation YYViewController
//
//-(UIDynamicAnimator *)animator
//{
//    if (_animator==nil) {
//        //创建物理仿真器，设置仿真范围，ReferenceView为参照视图
//        _animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
//    }
//    return _animator;
//}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //获取一个触摸点
//    UITouch *touch=[touches anyObject];
//    CGPoint point=[touch locationInView:touch.view];
//    
//    //1.创建捕捉行为
//    //需要传入两个参数：一个物理仿真元素，一个捕捉点
//    UISnapBehavior *snap=[[UISnapBehavior alloc]initWithItem:self.blueView snapToPoint:point];
//    //设置防震系数（0~1，数值越大，震动的幅度越小）
//    snap.damping=arc4random_uniform(10)/10.0;
//    
//    //2.执行捕捉行为
//    //注意：这个控件只能用在一个仿真行为上，如果要拥有持续的仿真行为，那么需要把之前的所有仿真行为删除
//    //删除之前的所有仿真行为
//    [self.animator removeAllBehaviors];
//    [self.animator addBehavior:snap];
//}
//
//@end

@end