// GlobalTimelineViewController.m
//  CLY
//
//  Created by chenliangyu on 14/12/9.
//  Copyright (c) 2014年 ioschen. All rights reserved.
//

#import "GlobalTimelineViewController.h"

#import "Post.h"
#import "PostTableViewCell.h"
#import "UIRefreshControl+AFNetworking.h"
#import "UIAlertView+AFNetworking.h"

#import "CLYLayer.h"
#import "Person.h"
#import "Student.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "LINEViewController.h"
#import "ThreeViewController.h"
#import "JTViewController.h"
#import "TYBViewController.h"
#import "SSViewController.h"
#import "LayerViewController.h"
#import "DHViewController.h"
#import "ViewDHViewController.h"
#import "ThreadViewController.h"
#import "GCDViewController.h"
@interface GlobalTimelineViewController ()
@property (readwrite, nonatomic, strong) NSArray *posts;
@end

@implementation GlobalTimelineViewController

- (void)reload:(__unused id)sender {
    self.navigationItem.rightBarButtonItem.enabled = NO;

    NSURLSessionTask *task = [Post globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {
            self.posts = posts;
            [self.tableView reloadData];
        }
    }];

    [UIAlertView showAlertViewForTaskWithErrorOnCompletion:task delegate:nil];
    [self.refreshControl setRefreshingWithStateOfTask:task];
}
-(void)runPerson{
    Student *stu=[[Student alloc]init];
    stu->name=@"asdfs";
    stu->sex=SexMan;
    stu->weight=23;
    stu->favColor=ColorBlack;
    Date d={2012,2,2};
    stu->birthday=d;
    
    Dog *doga=[[Dog alloc]init];
    doga->weight=23;
    
    stu->dog=doga;
    [stu print];
    [stu run];
    [stu eat];
    
    [doga eat];
    [doga run];
    
    [stu eatDog];
    [stu runDog];
    
    
    Person *person=[[Person alloc]init];
    person->_age=23;
    person->_weight=234;
    [person walk];
    
    
    //内存管理中的循环引用问题以及解决
    //案例：每个人有一张身份证，每张身份证对应一个人，不能使用#import的方式相互包含，这就形成了循环引用。
    //新的关键字：@class 类名；——解决循环引用问题，提高性能

    //（3）@property的参数：
    //Strong:相当于原来的retain（适用于OC对象类型），成员变量是强指针
    //Weak:相当于原来的assign,(适用于oc对象类型)，成员变量是弱指针
    //Assign：适用于非OC对象类型（基础类型）
}
#warning 代码需要优化
#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    GCDViewController *one=[[GCDViewController alloc]init];
    [self presentViewController:one animated:YES completion:nil];
    //[self runPerson];
    
    // NSNumber 基本数据类型
    // NSValue 结构体
    
    Person *p1=[[Person alloc]init];
    [p1 setValue:@"yangyong" forKeyPath:@"name"];
    [p1 setValue:@"23" forKeyPath:@"age"];
    
    Person *p2=[[Person alloc]init];
    [p2 setValue:@"heyun" forKeyPath:@"name"];
    [p2 setValue:@"22" forKeyPath:@"age"];
    
    //NSLog(@"%@%@",p1,[p2 valueForKeyPath:@"name"]);
    
    
    //建立一个存储person对象的数组，并打印
    NSArray *persons=@[p1,p2];
    //NSLog(@"persons %@",persons);
    
    NSMutableArray *arrayM=[NSMutableArray array];
    //        for (Person *p in persons) {
    //            [arrayM addObject:[p valueForKeyPath:@"name"]];
    //        }
    [arrayM addObject:[persons valueForKeyPath:@"name"]];
    //NSLog(@"arrayM %@",arrayM);
    
    
    
    
//    [self thread];
//    [self Operation];
    
    Post *po=[[Post alloc]init];
    po->_age=1023;
    //NSLog(@"%d /  %@",po->_age,po->sss);
    
    UIButton *bb=[[UIButton alloc]init];
    bb.center=CGPointMake(200, 200);
    bb.frame=CGRectMake(100, 100, 100, 100);
    bb.backgroundColor=[UIColor redColor];
    [self.tableView addSubview:bb];
    
    //设置阴影
    bb.layer.shadowColor=[UIColor grayColor].CGColor;//设置阴影颜色灰色这里用的UIColor的CGColor属性是种CGColorRef类型的数据
    bb.layer.shadowOffset=CGSizeMake(20, 20);//设置阴影的偏移大小，可以看出阴影往原图的右下角偏移
    bb.layer.shadowOpacity=0.5;//设置阴影的不透明度为0.5，表示半透明。如果为1，代表完全不透明。
    
    //设置圆角大小
    bb.layer.cornerRadius=10;//设置圆角半径为10
    bb.layer.masksToBounds=YES;
    //maskToBounds=YES：可以看做是强制内部的所有子层支持圆角效果，少了这个设置，UIImageView是不会有圆角效果的
    //注意，如果设置了maskToBounds=YES，那将不会有阴影效果
    
    //设置边框宽度和颜色
    bb.layer.borderWidth=5;//边框宽度为5
    bb.layer.borderColor=[UIColor blackColor].CGColor;//边框颜色为红色
    
    //设置旋转
    bb.layer.transform=CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    //利用transform属性可以设置旋转、缩放等效果
    //M_PI_4表示四分之π，顺时针旋转45°
    //后面的(0, 0, 1)表示Z轴这个向量，修改这个向量可以做一些三维旋转效果，你可以随便改个值试一下，比如(1, 1, 1)
    //总体的意思是layer会绕着Z轴顺时针旋转45°，也就是在x、y平面进行旋转
    
    
//    CALayer *myLayer = [[CALayer alloc]init];// [CALayer layer];
//    // 设置层的宽度和高度（100x100）
//    myLayer.bounds = CGRectMake(0, 0, 100, 100);
//    // 设置层的位置
//    myLayer.position = CGPointMake(100, 100);
//    // 设置层的背景颜色：红色
//    myLayer.backgroundColor = [UIColor redColor].CGColor;
//    // 设置层的圆角半径为10
//    myLayer.cornerRadius = 10;
//    // 添加myLayer到控制器的view的layer中
//    [self.tableView.layer addSublayer:myLayer];
    
    
//    CALayer *myLayer = [CALayer layer];
//    // 设置层的宽度和高度（100x100）
//    myLayer.bounds = CGRectMake(0, 0, 100, 100);
//    // 设置层的位置
//    myLayer.position = CGPointMake(100, 100);
//    // 设置需要显示的图片
//    myLayer.contents = (id)[UIImage imageNamed:@"profile-image-placeholder"].CGImage;//UIImage的CGImage属性，是一种CGImageRef类型的数据
//    // 设置层的圆角半径为10
//    myLayer.cornerRadius = 10;
//    // 如果设置了图片，需要设置这个属性为YES才有圆角效果
//    myLayer.masksToBounds = YES;
//    
//    // 添加myLayer到控制器的view的layer中
//    [self.view.layer addSublayer:myLayer];
    
    
    /*
    三、为什么CALayer中使用CGColorRef和CGImageRef这2种数据类型，而不用UIColor和UIImage？
    * 首先要知道：CALayer是定义在QuartzCore框架中的；CGImageRef、CGColorRef两种数据类型是定义在CoreGraphics框架中的；UIColor、UIImage是定义在UIKit框架中的
    * 其次，QuartzCore框架和CoreGraphics框架是可以跨平台使用的，在iOS和Mac OS X上都能使用，但是UIKit只能在iOS中使用
    * 因此，为了保证可移植性，QuartzCore不能使用UIImage、UIColor，只能使用CGImageRef、CGColorRef
    * 不过很多情况下，可以通过UIKit对象的特定方法，得到CoreGraphics对象，比如UIImage的CGImage方法可以返回一个CGImageRef
    
    四、UIView和CALayer的选择
    细心的朋友不难发现，其实前面的2个效果不仅可以通过添加层来实现，还可以通过添加UIView来实现。比如，第1个红色的层可以用一个UIView来实现，第2个显示图片的层可以用一个UIImageView来实现。 既然CALayer和UIView都能实现相同的显示效果，那究竟该选择谁好呢？
    * 其实，对比CALayer，UIView多了一个事件处理的功能。也就是说，CALayer不能处理用户的触摸事件，而UIView可以
    * 所以，如果显示出来的东西需要跟用户进行交互的话，用UIView；如果不需要跟用户进行交互，用UIView或者CALayer都可以
    * 当然，CALayer的性能会高一些，因为它少了事件处理的功能，更加轻量级
     
    五、UIView和CALayer的其他关系
    * UIView可以通过subviews属性访问所有的子视图，类似地，CALayer也可以通过sublayers属性访问所有的子层
    * UIView可以通过superview属性访问父视图，类似地，CALayer也可以通过superlayer属性访问父层
    * 下面再看一张UIView和CALayer的关系图：
    */

    
    /* 列举几个常见的Animatable Properties(可动画属性)
    bounds：用于设置CALayer的宽度和高度。修改这个属性会产生缩放动画
    backgroundColor：用于设置CALayer的背景色。修改这个属性会产生背景色的渐变动画
    position：用于设置CALayer的位置。修改这个属性会产生平移动画
    比如：假设一开始CALayer的position为(100, 100)，然后在某个时刻修改为(200, 200)，那么整个CALayer就会在短时间内从(100, 100)这个位置平移到(200, 200)*/
    
    //position和anchorPoint
    //position和anchorPoint属性都是CGPoint类型的
    //position可以用来设置CALayer在父层中的位置，它是以父层的左上角为坐标原点(0, 0)
    //anchorPoint称为"定位点"，它决定着CALayer身上的哪个点会在position属性所指的位置。它的x、y取值范围都是0~1，默认值为(0.5, 0.5)
    
    CALayer *myLayer = [CALayer layer];
    // 设置层的宽度和高度（100x100）
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    // 设置层的位置
    myLayer.position = CGPointMake(100, 100);
    // 设置层的背景颜色：红色
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    
    // 添加myLayer到控制器的view的layer中
    [self.view.layer addSublayer:myLayer];
    //第5行设置了myLayer的position为(100, 100)，又因为anchorPoint默认是(0.5, 0.5)，所以最后的效果是：myLayer的中点会在父层的(100, 100)位置
    
    //若将anchorPoint改为(0, 0)，myLayer的左上角会在(100, 100)位置
    myLayer.anchorPoint = CGPointMake(0, 0);
    
    //若将anchorPoint改为(1, 1)，myLayer的右下角会在(100, 100)位置
    myLayer.anchorPoint = CGPointMake(1, 1);
    
    //将anchorPoint改为(0, 1)，myLayer的左下角会在(100, 100)位置
    myLayer.anchorPoint = CGPointMake(0, 1);
    
    //我想，你应该已经明白anchorPoint的用途了吧，它决定着CALayer身上的哪个点会在position所指定的位置上。它的x、y取值范围都是0~1，默认值为(0.5, 0.5)，因此，默认情况下，CALayer的中点会在position所指定的位置上。当anchorPoint为其他值时，以此类推。
    
    
    
//    CLYLayer *layer = [CLYLayer layer];
//    // 设置层的宽高
//    layer.bounds = CGRectMake(0, 0, 100, 100);
//    // 设置层的位置
//    layer.position = CGPointMake(100, 100);
//    // 开始绘制图层
//    [layer setNeedsDisplay];//需要调用setNeedsDisplay这个方法，才会触发drawInContext:方法的调用，然后进行绘图
//    [self.tableView.layer addSublayer:layer];
    
    
//    CALayer *layer = [CALayer layer];
//    // 设置delegate
//    layer.delegate = self;//设置了CALayer的delegate，这里的self是指控制器
//    // 设置层的宽高
//    layer.bounds = CGRectMake(0, 0, 100, 100);
//    // 设置层的位置
//    layer.position = CGPointMake(100, 100);
//    // 开始绘制图层
//    [layer setNeedsDisplay];//需要调用setNeedsDisplay这个方法，才会通知delegate进行绘图
//    [self.view.layer addSublayer:layer];
    
    
    
    //无论采取哪种方法来自定义层，都必须调用CALayer的setNeedsDisplay方法才能正常绘图。
    //UIView的详细显示过程
    //* 当UIView需要显示时，它内部的层会准备好一个CGContextRef(图形上下文)，然后调用delegate(这里就是UIView)的drawLayer:inContext:方法，并且传入已经准备好的CGContextRef对象。而UIView在drawLayer:inContext:方法中又会调用自己的drawRect:方法
    //* 平时在drawRect:中通过UIGraphicsGetCurrentContext()获取的就是由层传入的CGContextRef对象，在drawRect:中完成的所有绘图都会填入层的CGContextRef中，然后被拷贝至屏幕
    
    
    //使用它需要先添加QuartzCore.framework框架和引入主头文件<QuartzCore/QuartzCore.h>
    //2.初始化一个CAAnimation对象，并设置一些动画相关属性
    //3.通过调用CALayer的addAnimation:forKey:方法增加CAAnimation对象到CALayer中，这样就能开始执行动画了
    //4.通过调用CALayer的removeAnimationForKey:方法可以停止CALayer中的动画
    
    /*CAAnimation是所有动画类的父类，但是它不能直接使用，应该使用它的子类
    * 常见属性有：
    1> duration：动画的持续时间
    2> repeatCount：动画的重复次数
    3> timingFunction：控制动画运行的节奏
    
    timingFunction可选的值有：
    kCAMediaTimingFunctionLinear（线性）：匀速，给你一个相对静态的感觉
    kCAMediaTimingFunctionEaseIn（渐进）：动画缓慢进入，然后加速离开
    kCAMediaTimingFunctionEaseOut（渐出）：动画全速进入，然后减速的到达目的地
    kCAMediaTimingFunctionEaseInEaseOut（渐进渐出）：动画缓慢的进入，中间加速，然后减速的到达目的地。这个是默认的动画行为。
    4> delegate：动画代理，用来监听动画的执行过程
    代理对象需要实现的方法有：（这几个方法被定义在某个分类中）
    @interface NSObject (CAAnimationDelegate)
    // 动画开始执行的时候触发这个方法
    - (void)animationDidStart:(CAAnimation *)anim;
    // 动画执行完毕的时候触发这个方法
    - (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
    @end
    * 上面介绍的所有属性都是属于CAAnimation的，因此，CAAnimation的所有子类都能使用它们。
    2.其他
    * CAPropertyAnimation也是不能直接使用的，也要使用它的子类
    * 所以，能用的动画类只剩下4个：CABasicAnimation、CAKeyframeAnimation、CATransition、CAAnimationGroup
    
    四、CAPropertyAnimation
    * CAPropertyAnimation是CAAnimation的子类，但是不能直接使用，要想创建动画对象，应该使用它的两个子类：CABasicAnimation和CAKeyframeAnimation
    * 它有个NSString类型的keyPath属性，你可以指定CALayer的某个属性名为keyPath，并且对CALayer的这个属性的值进行修改，达到相应的动画效果。比如，指定@"position"为keyPath，就会修改CALayer的position属性的值，以达到平移的动画效果
    * 因此，初始化好CAPropertyAnimation的子类对象后，必须先设置keyPath，搞清楚要修改的是CALayer的哪个属性，执行的是怎样的动画
    */
    
    
    //CABasicAnimation是CAPropertyAnimation的子类,使用它可以实现一些基本的动画效果它可以让CALayer的某个属性从某个值渐变到另一个值
    //下面就用CABasicAnimation实现几个简单的动画。
    
    //1.先初始化一个UIView添加到控制器的view中，然后在这个UIView的layer上执行动画，下面的self是指控制器
    myView=[[UIView alloc]init];
    myView.layer.position=CGPointMake(100, 100);
    myView.layer.bounds=CGRectMake(0, 0, 100, 100);
    myView.backgroundColor=[UIColor blueColor];
    [self.tableView addSubview:myView];
    
    //一、平移动画
    //实现平移动画有好几种方法，这里列举2种。
    
    /*
    //方法1
    // 说明这个动画对象要对CALayer的position属性执行动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    //设置的keyPath是@"position"，说明要修改的是CALayer的position属性，也就是会执行平移动画
    // 动画持续1.5s
    anim.duration = 1.5;
    // position属性值从(50, 80)渐变到(300, 350)
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 80)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 350)];
    //这里并不是直接使用CGPoint这种结构体类型，而是要先包装成NSValue对象后再使用。这2行代码表示CALayer从位置(50, 80)移动到位置(300, 350)
    //toValue换成byValue，代表CALayer从位置(50, 80)开始向右移动300、向下移动350，也就是移动到位置(350, 430)
    
    // 设置动画的代理
    anim.delegate = self;//设置动画的代理，可以监听动画的执行过程，这里设置控制器为代理
    
    // 保持动画执行后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    //默认情况下，动画执行完毕后，动画会自动从CALayer上移除，CALayer又会回到原来的状态。为了保持动画执行后的状态，可以加入第14、15行代码
    
    // 添加动画对象到图层上
    [myView.layer addAnimation:anim forKey:@"translate"];
    //后面的@"translate"是给动画对象起个名称，以后可以调用CALayer的removeAnimationForKey:方法根据动画名称停止相应的动画
    */
    
    
    /*
    //方法2
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.duration = 1;
    CATransform3D form = CATransform3DMakeTranslation(350, 350, 0);
    anim.toValue = [NSValue valueWithCATransform3D:form];
    [myView.layer addAnimation:anim forKey:nil];
    //通过CALayer的transform属性实现平移动画，layer会从自己的初始位置平移到(350, 350)位置
    */

    /*
    //二、缩放动画
    //实现缩放动画有好几种方法，这里列举2种。
    //方法1
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    anim.duration = 2;
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, 30)];
    [myView.layer addAnimation:anim forKey:nil];
    //layer会从原来的尺寸(100x100)变为30x30
    */
    
    /*
    //方法2
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.duration = 1.5; // 动画持续1.5s
    // CALayer的宽度从0.5倍变为2倍
    // CALayer的高度从0.5倍变为1.5倍
    anim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)];
    anim.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 1.5, 1)];
    [myView.layer addAnimation:anim forKey:nil];
    */
    
    //三、旋转动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.duration = 1.5;
    // 绕着(0, 0, 1)这个向量轴顺时针旋转45°
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, 1)];
    [myView.layer addAnimation:anim forKey:nil];
    //其实可以不用设置fromValue，这里只设置了toValue
    
    
    //四、其他
    //除开前面使用的position、transform属性，其实CALayer还有好多属性都可以形成动画，这些属性统称为"Animatable Properties"。在《CALayer3-层的属性》开头有介绍如何搜索这些属性
    //ABasicAnimation虽然能够做很多基本的动画效果，但是有个局限性，只能让CALayer的属性从某个值渐变到另一个值，仅仅是在2个值之间渐变
    
    
    
    
    
    
    
    
//    下面的请求路径写法是错误的：
//    1 NSString *urlString = @"http://192.168.1.102:8080/MJServer/login?username=母鸡";
//    应该这样写
//    1 // 使用UTF-8对中文参数进行编码
//    2 NSString *param = [@"母鸡" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    4 // 请求地址
//    5 NSString *baseUrl = @"http://192.168.1.102:8080/MJServer/login?username=";
//    6 NSString *urlString = [baseUrl stringByAppendingString:param];
//    1> 第2行使用UTF-8对中文参数进行编码
//    2> 在第6行拼接编码后的参数到请求路径中
//
//    4.取消请求
//    如果用户的网络状况不是很好，那么在登录的过程中，用户很可能会点击"取消"按钮来取消登录
//    当用户点击了取消按钮，我们也应该终止之前发送的请求，这时候可以这样做
//    [conn cancel];
    
    
//    二、NSURLConnection的其他请求方法
//    
//    除了start方法，NSURLConnection还提供了2个静态方法帮助我们发送HTTP请求
//    
//    1.异步请求
//    复制代码
//    1 // 请求地址
//    2 NSString *urlString = @"http://192.168.1.102:8080/MJServer/login?username=123&pwd=123";
//    3 // 初始化一个NSURL对象
//    4 NSURL *url = [NSURL URLWithString:urlString];
//    5
//    6 // 初始化一个请求
//    7 NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    8
//    9 // 初始化一个操作队列
//    10 NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
//    11 // 发送一个异步请求
//    12 [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:
//        13 ^(NSURLResponse *response, NSData *data, NSError *error) {
//            14     // 解析成字符串数据
//            15     NSString *str = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//            16     NSLog(@"%@", str);
//            17 }];
//    复制代码
//    在12行调用sendAsynchronousRequest:queue:completionHandler:方法发送一个异步HTTP请求，这个方法接收3个参数
//    
//    * 第1个参数是一个NSURLRequest对象，封装的是一个GET请求
//    
//    * 第3个参数是一个Block，当服务器成功返回数据时会回调这个Block，Block中的NSData *data参数就是服务器返回的数据
//    
//    * 第2个参数是一个操作队列NSOperationQueue，当服务器成功返回数据时，系统会将第3个参数中传入的Block放到这个操作队列中执行
//    
//    
//    
//    2.同步请求
//    前面说的都是异步请求，也是比较推荐的请求方式。NSURLConnection也提供了一个静态方法可以发送一个同步请求。
//    
//    复制代码
//    1 // 请求地址
//    2 NSString *urlString = @"http://192.168.1.102:8080/MJServer/login?username=123&pwd=123";
//    3 // 初始化一个NSURL对象
//    4 NSURL *url = [NSURL URLWithString:urlString];
//    5
//    6 // 初始化一个请求
//    7 NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    8
//    9 // 发送一个同步请求
//    10 NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    11
//    12 // 解析成字符串数据
//    13 NSString *str = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//    14 NSLog(@"%@", str);
//    复制代码
//    在第10行调用了sendSynchronousRequest:returningResponse:error:方法发送了一个同步请求，这是一个阻塞式的方法，也就是等服务器返回所有数据后，这个方法才会返回，返回值是一个NSData对象，存放着服务器返回的所有数据
    
    
    
    

//    OC点语法和变量作用域
//    
//    一、点语法
//    
//    （一）认识点语法
//    
//    声明一个Person类:
//    
//    复制代码
//    1 #import <Foundation/Foundation.h>
//    2
//    3 @interface Person : NSObject
//    4 {
//        5     int _age;//默认为@protected
//        6 }
//    7
//    8 - (void)setAge:(int)age;
//    9 - (int)age;
//    10
//    11 @end
//    复制代码
//    　　　　Person类的实现：
//    
//    
//    
//    复制代码
//    1 #import "Person.h"
//    2
//    3 @implementation Person
//    4
//    5 - (void)setAge:(int)age
//    6 {
//        7     _age = age;// 不能写成self.age = newAge,相当与 [self setAge:newAge];
//        8 }
//    9
//    10 - (int)age  //get方法
//    11 {
//        12     return _age;
//        13 }
//    14
//    15 @end
//    复制代码
//    
//    
//    点语法的使用：
//    
//    复制代码
//    1 #import <Foundation/Foundation.h>
//    2 #import "Person.h"
//    3
//    4 int main(int argc, const char * argv[])
//    5 {
//        6
//        7     @autoreleasepool {
//            8
//            9         // insert code here...
//            10         Person *person = [[Person alloc] init];
//            11
//            12         //[person setAge:10];
//            13         person.age = 10;//点语法，等效与[person setAge:10];
//            14 //这里并不是给person的属性赋值，而是调用person的setAge方法
//            15
//            16         //int age = [person age];
//            17         int age = person.age;//等效与int age = [person age]
//            18        NSLog(@"age is %i", age);
//            19         [person release];
//            20
//            21     }
//        22     return 0;
//        23 }
//    复制代码
//    
//    
//    （二）点语法的作用
//    
//    OC设计点语法的目的，是为了让其他语言的开发者可以很快的上手OC语言开发，使用点语法，让它和其他面向对象的语言如java很像。
//    
//    （三）点语法的本质
//    
//    点语法的本质是方法的调用，而不是访问成员变量，当使用点语法时，编译器会自动展开成相应的方法。切记点语法的本质是转换成相应的set和get方法，如果没有set和get方法，则不能使用点语法。
//    
//    如：
//    
//    Stu.age=10;展开为：[stu setAge:10];
//    
//    int  a=stu.age;展开为：[stu age];
//    
//    编译器如何知道是set方法还是get方法？主要是看赋值（可以使用断点调试来查看）。
//    
//    在OC中访问成员变量只有一种方式即使用-> 如stu->age，这种情况要求在@public的前提下。
//    
//    （四）点语法的使用注意
//    
//    下面的使用方式是一个死循环：
//    
//    　　(1)在set方法中，self.age=age;相当于是[self setAge:age];
//    
//    (2)在get方法中，return self.age;相当于是[self age];
//    
//    二、变量作用域
//    
//    （一）变量的作用域主要分为四种：
//    
//    （1）@public (公开的)在有对象的前提下，任何地方都可以直接访问。
//    
//    （2）@protected （受保护的）只能在当前类和子类的对象方法中访问
//    
//    （3）@private （私有的）只能在当前类的对象方法中才能直接访问
//    
//    （4）@package (框架级别的)作用域介于私有和公开之间，只要处于同一个框架中就可以直接通过变量名访问
//    
//    （二）使用注意和补充
//    
//    （1）在类的实现即.m文件中也可以声明成员变量，但是因为在其他文件中通常都只是包含头文件而不会包含实现文件，所以在这里声明的成员变量是@private的。在.m中定义的成员变量不能喝它的头文件.h中的成员变量同名，在这期间使用@public等关键字也是徒劳的。
//    
//    （2）在@interface  @end之间声明的成员变量如果不做特别的说明，那么其默认是protected的。
//    
//    （3）一个类继承了另一个类，那么就拥有了父类的所有成员变量和方法，注意所有的成员变量它都拥有，只是有的它不能直接访问。
    
    
    
    
    

    
    

                         
                         
                         
                         
    
    self.title = NSLocalizedString(@"AFNetworking", nil);
//    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 100.0f)];
//    [self.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
    //[self.tableView.tableHeaderView addSubview:self.refreshControl];
    self.tableView.rowHeight = 70.0f;
    //[self reload:nil];
}


#pragma mark 动画开始
-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始了");
}
#pragma mark 动画结束
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    // 查看一下动画执行完毕后的position值
    NSString *string = NSStringFromCGPoint(myView.layer.position);
    NSLog(@"动画结束了，position:%@", string);
}

#pragma mark 画一个矩形框
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // 设置蓝色
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    // 设置边框宽度
    CGContextSetLineWidth(ctx, 10);
    
    // 添加一个跟层一样大的矩形到路径中
    CGContextAddRect(ctx, layer.bounds);
    
    // 绘制路径
    CGContextStrokePath(ctx);
}



-(void)thread{
    //多线程编程1-NSThread
    //每个iOS应用程序都有个专门用来更新显示UI界面、处理用户触摸事件的主线程，因此不能将其他太耗时的操作放在主线程中执行，不然会造成主线程堵塞(出现卡机现象)，带来极坏的用户体验。一般的解决方案就是将那些耗时的操作放到另外一个线程中去执行，多线程编程是防止主线程堵塞，增加运行效率的最佳方法。
    
    //iOS中有3种常见的多线程编程方法
    //1.NSThread
    //这种方法需要管理线程的生命周期、同步、加锁问题，会导致一定的性能开销
    
    //2.NSOperation和NSOperationQueue
    //是基于OC实现的。NSOperation以面向对象的方式封装了需要执行的操作，然后可以将这个操作放到一个NSOperationQueue中去异步执行。不必关心线程管理、同步等问题。
    
    //3.Grand Centeral Dispatch
    //简称GCD，iOS4才开始支持，是纯C语言的API。自iPad2开始，苹果设备开始有了双核CPU，为了充分利用这2个核，GCD提供了一些新特性来支持多核并行编程
    
    //一个NSThread实例就代表着一条线程
    //一、获取当前线程
    NSThread *current = [NSThread currentThread];
    NSLog(@"当前线程:%@", current);
    //二、获取主线程
    NSThread *main = [NSThread mainThread];
    NSLog(@"主线程:%@", main);
    //主线程:<NSThread: 0x71434e0>{name = (null), num = 1}num相当于线程的id，主线程的num是为1的
    
    //三、NSThread的创建
    //1.动态方法- (id)initWithTarget:(id)target selector:(SEL)selector object:(id)argument;
    // 初始化线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"mj"];
    // 开启线程
    [thread start];
    
    //2.静态方法+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument;
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"mj"];
    //执行完上面代码后会马上启动一条新线程，并且在这条线程上调用self的run:方法，以@"mj"为方法参数
    
    // 3.隐式创建线程
    [self performSelectorInBackground:@selector(run:) withObject:@"mj"];
    //会隐式地创建一条新线程，并且在这条线程上调用self的run:方法，以@"mj"为方法参数
    
    //四、暂停当前线程
    [NSThread sleepForTimeInterval:2];
    NSDate *date = [NSDate dateWithTimeInterval:2 sinceDate:[NSDate date]];
    [NSThread sleepUntilDate:date];
    //上面两种做法都是暂停当前线程2秒
    
    //五、线程的其他操作
    
    //1.在指定线程上执行操作
    [self performSelector:@selector(run) onThread:thread withObject:nil waitUntilDone:YES];
    //上面代码的意思是在thread这条线程上调用self的run方法
    //最后的YES代表：上面的代码会阻塞，等run方法在thread线程执行完毕后，上面的代码才会通过
    
    //2.在主线程上执行操作
    [self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:YES];
    //在主线程调用self的run方法
    
    //3.在当前线程执行操作
    [self performSelector:@selector(run) withObject:nil];
    //在当前线程调用self的run方法
    
    //六、优缺点
    //优点：NSThread比其他多线程方案较轻量级，更直观地控制线程对象
    //缺点：需要自己管理线程的生命周期，线程同步。线程同步对数据的加锁会有一定的系统开销
}
- (void)run:(NSString *)string {
    NSThread *current = [NSThread currentThread];
    NSLog(@"执行了run:方法-参数：%@，当前线程：%@", string, current);
}
//执行了run:方法-参数：mj，当前线程：<NSThread: 0x889e8d0>{name = (null), num = 3}
//可以发现，这条线程的num值为3，说明不是主线程，主线程的num为1
-(void)Operation{
    //上一讲简单介绍了NSThread的使用，虽然也可以实现多线程编程，但是需要我们去管理线程的生命周期，还要考虑线程同步、加锁问题，造成一些性能上的开销。我们也可以配合使用NSOperation和NSOperationQueue实现多线程编程，实现步骤大致是这样的：
    /*
     1> 先将需要执行的操作封装到一个NSOperation对象中
     2> 然后将NSOperation对象添加到NSOperationQueue中
     3> 系统会自动将NSOperation中封装的操作放到一条新线程中执行
     在此过程中，我们根本不用考虑线程的生命周期、同步、加锁等问题
     
     2.默认情况下，NSOperation并不具备封装操作的能力，必须使用它的子类，使用NSOperation子类的方式有3种：
     1> NSInvocationOperation
     2> NSBlockOperation
     3> 自定义子类继承NSOperation，实现内部相应的方法
     这讲先介绍如何用NSOperation封装一个操作，后面再结合NSOperationQueue来使用。
     */
    
    
    //一、NSInvocationOperation
    NSInvocationOperation *operationa = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run:) object:@"mj"];
    [operationa start];
    //第1行初始化了一个NSInvocationOperation对象，它是基于一个对象和selector来创建操作
    //第2行调用了start方法，紧接着会马上执行封装好的操作，也就是会调用self的run:方法，并且将@"mj"作为方法参数
    //这里要注意：默认情况下，调用了start方法后并不会开一条新线程去执行操作，而是在当前线程同步执行操作。只有将operation放到一个NSOperationQueue中，才会异步执行操作。
    
    //二、NSBlockOperation
    //1.同步执行一个操作
    NSBlockOperation *operationb = [NSBlockOperation blockOperationWithBlock:^(){
        NSLog(@"执行了一个新的操作");
    }];
    // 开始执行任务
    [operationb start];
    //第1行初始化了一个NSBlockOperation对象，它是用一个Block来封装需要执行的操作
    //第2行调用了start方法，紧接着会马上执行Block中的内容
    //这里还是在当前线程同步执行操作，并没有异步执行
    
    //2.并发执行多个操作
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^(){
        NSLog(@"执行第1次操作，线程：%@", [NSThread currentThread]);
    }];
    [operation addExecutionBlock:^() {
        NSLog(@"又执行了1个新的操作，线程：%@", [NSThread currentThread]);
    }];
    [operation addExecutionBlock:^() {
        NSLog(@"又执行了1个新的操作，线程：%@", [NSThread currentThread]);
    }];
    [operation addExecutionBlock:^() {
        NSLog(@"又执行了1个新的操作，线程：%@", [NSThread currentThread]);
    }];
    // 开始执行任务
    [operation start];
    /*第1行初始化了一个NSBlockOperation对象
     分别在第5、9、13行通过addExecutionBlock:方法添加了新的操作，包括第1行的操作，一共封装了4个操作
     在第18行调用start方法后，就会并发地执行这4个操作，也就是会在不同线程中执行
     1 2013-02-02 21:38:46.102 thread[4602:c07] 又执行了1个新的操作，线程：<NSThread: 0x7121d50>{name = (null), num = 1}
     2 2013-02-02 21:38:46.102 thread[4602:3f03] 又执行了1个新的操作，线程：<NSThread: 0x742e1d0>{name = (null), num = 5}
     3 2013-02-02 21:38:46.102 thread[4602:1b03] 执行第1次操作，线程：<NSThread: 0x742de50>{name = (null), num = 3}
     4 2013-02-02 21:38:46.102 thread[4602:1303] 又执行了1个新的操作，线程：<NSThread: 0x7157bf0>{name = (null), num = 4}
     可以看出，每个操作所在线程的num值都不一样，说明是不同线程
     */
    
    
    //三、NSOperation的其他用法
    //1.取消操作
    //operation开始执行之后, 默认会一直执行操作直到完成，我们也可以调用cancel方法中途取消操作
    [operation cancel];
    //2.在操作完成后做一些事情
    //如果想在一个NSOperation执行完毕后做一些事情，就调用NSOperation的setCompletionBlock方法来设置想做的事情
    operation.completionBlock = ^() {
        NSLog(@"执行完毕");
    };
    //当operation封装的操作执行完毕后，就会回调Block里面的内容
    
    //四、自定义NSOperation
    //如果NSInvocationOperation和NSBlockOperation不能满足需求，我们可以直接新建子类继承NSOperation，并添加任何需要执行的操作。如果只是简单地自定义NSOperation，只需要重载-(void)main这个方法，在这个方法里面添加需要执行的操作。
    //下面写个子类DownloadOperation来下载图片
    //1.继承NSOperation，重写main方法
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)[self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[PostTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.post = [self.posts objectAtIndex:(NSUInteger)indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PostTableViewCell heightForCellWithPost:[self.posts objectAtIndex:(NSUInteger)indexPath.row]];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
