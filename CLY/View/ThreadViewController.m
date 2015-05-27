//
//  ThreadViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "ThreadViewController.h"
@implementation ThreadViewController

//使用古老的方式创建
//#import <pthread.h>
-(void)btnClick{
    //1.获取当前线程
    NSThread *current=[NSThread currentThread];
    //主线程
    NSLog(@"btnClick----%@",current);
    
    //2.使用for循环执行一些耗时操作
    pthread_t thread;
    pthread_create(&thread, NULL, run, NULL);
}
//c语言函数
void *run(void *data)
{
    //获取当前线程，是新创建出来的线程
    NSThread *current=[NSThread currentThread];
    for (int i=0; i<10000; i++) {
        NSLog(@"btnClick---%d---%@",i,current);
    }
    return NULL;
}
//多个线程，点击按钮执行按钮调用方法的时候，主线程没有被阻塞
-(void)two{
    for (double i=0; i<=1000000; i++) {
    }
    NSLog(@"two");
}
-(void)viewDidLoad{
    /*
    1个线程中任务的执行是串行的
    如果要在1个线程中执行多个任务，那么只能一个一个地按顺序执行这些任务
    也就是说，在同一时间内，1个线程只能执行1个任务
    比如在1个线程中下载3个文件（分别是文件A、文件B、文件C）
    
    1个进程中可以开启多条线程，每条线程可以并行（同时）执行不同的任务
    进程 ->车间，线程->车间工人
    多线程技术可以提高程序的执行效率
    比如同时开启3条线程分别下载3个文件（分别是文件A、文件B、文件C）
    
    2.多线程的原理
    同一时间，CPU只能处理1条线程，只有1条线程在工作（执行）
    多线程并发（同时）执行，其实是CPU快速地在多条线程之间调度（切换）
    如果CPU调度线程的时间足够快，就造成了多线程并发执行的假象
    思考：如果线程非常非常多，会发生什么情况？
    CPU会在N多线程之间调度，CPU会累死，消耗大量的CPU资源
    每条线程被调度执行的频次会降低（线程的执行效率降低）
    
    3.多线程的优缺点
    多线程的优点
    能适当提高程序的执行效率
    能适当提高资源利用率（CPU、内存利用率）
    
    多线程的缺点
    开启线程需要占用一定的内存空间（默认情况下，主线程占用1M，子线程占用512KB），如果开启大量的线程，会占用大量的内存空间，降低程序的性能
    线程越多，CPU在调度线程上的开销就越大
    程序设计更加复杂：比如线程之间的通信、多线程的数据共享
    
    4.多线程在iOS开发中的应用
    主线程:一个iOS程序运行后，默认会开启1条线程，称为“主线程”或“UI线程”
    主线程的主要作用
    显示\刷新UI界面
    处理UI事件（比如点击事件、滚动事件、拖拽事件等）
    
    主线程的使用注意:别将比较耗时的操作放到主线程中。
    耗时操作会卡住主线程，严重影响UI的流畅度，给用户一种“卡”的坏体验
    */
    
    
//    NSThread *threadone = [[NSThread alloc] initWithTarget:self selector:@selector(btnClick) object:nil];
//    threadone.threadPriority=0.8;
//    [threadone start];
//
//    NSThread *threadtwo = [[NSThread alloc] initWithTarget:self selector:@selector(two) object:nil];
//    threadtwo.threadPriority=0.9;
//    [threadtwo start];
    
//    其他创建线程的方式
//    (2)创建线程后自动启动线程   [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
//    (3)隐式创建并启动线程  [self performSelectorInBackground:@selector(run) withObject:nil];
//    优点：简单快捷
//    缺点：无法对线程进行更详细的设置
    
//    + (NSThread *)mainThread; // 获得主线程
//    - (BOOL)isMainThread; // 是否为主线程
//    NSThread *current = [NSThread currentThread];//获得当前线程

//    线程的调度优先级：调度优先级的取值范围是0.0 ~ 1.0，默认0.5，值越大，优先级越高
//    + (double)threadPriority;
//    + (BOOL)setThreadPriority:(double)p;

//    设置线程的名字
//    - (void)setName:(NSString *)n;
//    - (NSString *)name;
    
    
//    [self three];
    
    
    /*
    多线程的安全隐患-资源共享
    1块资源可能会被多个线程共享，也就是多个线程可能会访问同一块资源
    比如多个线程访问同一个对象、同一个变量、同一个文件
    当多个线程访问同一块资源时，很容易引发数据错乱和数据安全问题
    */
    
    //默认有10张票
    self.leftTicketsCount=10;
    //开启多个线程，模拟售票员售票
    self.thread1=[[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:nil];
    self.thread1.name=@"售票员A";
    self.thread2=[[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:nil];
    self.thread2.name=@"售票员B";
    self.thread3=[[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:nil];
    self.thread3.name=@"售票员C";
    
//    互斥锁使用格式
//    @synchronized(锁对象) { // 需要锁定的代码  }
//        注意：锁定1份代码只用1把锁，用多把锁是无效的
    
    /*
    线程间通信的体现
    1个线程传递数据给另1个线程
    在1个线程中执行完特定任务后，转到另1个线程继续执行任务
    
    线程间通信常用方法
    - (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;
    - (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait;
    */
    
    
    _iconView=[[UIImageView alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
    _iconView.image=[UIImage imageNamed:@"a"];
    [self.view addSubview:_iconView];
}
//-(void)sellTickets{
//    while (1) {
//        int count=self.leftTicketsCount;//1.先检查票数
//        if (count>0) {
//            [NSThread sleepForTimeInterval:0.002];//暂停一段时间
//            self.leftTicketsCount= count-1;//2.票数-1
//            NSThread *current=[NSThread currentThread];//获取当前线程
//            NSLog(@"%@--卖了一张票，还剩余%d张票",current,self.leftTicketsCount);
//        }else{
//            [NSThread exit];//退出线程
//        }
//    }
//}
-(void)sellTickets{
    while (1) {
        @synchronized(self){//只能加一把锁
            int count=self.leftTicketsCount;//1.先检查票数
            if (count>0) {
                [NSThread sleepForTimeInterval:0.002];//暂停一段时间
                self.leftTicketsCount= count-1;//2.票数-1
                NSThread *current=[NSThread currentThread];//获取当前线程
                NSLog(@"%@--卖了一张票，还剩余%d张票",current,self.leftTicketsCount);
            }else{
                [NSThread exit];//退出线程
            }
        }
    }
//    互斥锁的优缺点
//    优点：能有效防止因多线程抢夺资源造成的数据安全问题
//    缺点：需要消耗大量的CPU资源
//    
//    互斥锁的使用前提：多条线程抢夺同一块资源
//    相关专业术语：线程同步,多条线程按顺序地执行任务
//    互斥锁，就是使用了线程同步技术
//    四：原子和非原子属性
//    
//    OC在定义属性时有nonatomic和atomic两种选择
//    atomic：原子属性，为setter方法加锁（默认就是atomic）
//    nonatomic：非原子属性，不会为setter方法加锁
//    atomic加锁原理
//    @property (assign, atomic) int age;
//    - (void)setAge:(int)age{
//        @synchronized(self) {
//            _age = age;
//        }
//    }
//    原子和非原子属性的选择
//    nonatomic和atomic对比
//    atomic：线程安全，需要消耗大量的资源
//    nonatomic：非线程安全，适合内存小的移动设备
//    
//    iOS开发的建议
//    所有属性都声明为nonatomic
//    尽量避免多线程抢夺同一块资源
//    尽量将加锁、资源抢夺的业务逻辑交给服务器端处理，减小移动客户端的压力
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 在子线程中调用download方法下载图片
    [self performSelectorInBackground:@selector(download) withObject:nil];
    
//    //开启线程
//    [self.thread1 start];
//    [self.thread2 start];
//    [self.thread3 start];
    
}
-(void)download{
    //1.根据URL下载图片
    //从网络中下载图片
    NSURL *urlstr=[NSURL URLWithString:@"fdsf"];
    //把图片转换为二进制的数据
    NSData *data=[NSData dataWithContentsOfURL:urlstr];//这一行操作会比较耗时
    //把数据转换成图片
    UIImage *image=[UIImage imageWithData:data];
    //2.回到主线程中设置图片
    //第一种方式
    //[self performSelectorOnMainThread:@selector(settingImage:) withObject:image waitUntilDone:NO];
    //第二种方式
    //[self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:NO];
    //第三种方式
    [self.iconView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
}

////设置显示图片
//-(void)settingImage:(UIImage *)image{
//    self.iconView.image=image;
//}

//按钮的点击事件
- (void)three {
    //1.获取当前线程
    NSThread *current=[NSThread currentThread];
    //主线程
    NSLog(@"btnClick----%@",current);
    
    //获取主线程的另外一种方式
    NSThread *main=[NSThread mainThread];
    NSLog(@"主线程-------%@",main);
    
    //2.执行一些耗时操作
//    [self creatNSThread];
//    [self creatNSThread2];
    [self creatNSThread3];
}


/**
 * NSThread创建线程方式1
 * 1> 先创建初始化线程
 * 2> start开启线程
 */
-(void)creatNSThread
{
    NSThread  *thread=[[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"线程A"];
    //为线程设置一个名称
    thread.name=@"线程A";
    //开启线程
    [thread start];
    
    
    NSThread  *thread2=[[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"线程B"];
    //为线程设置一个名称
    thread2.name=@"线程B";
    //开启线程
    [thread2 start];
}


/**
 * NSThread创建线程方式2
 *创建完线程直接(自动)启动
 */
-(void)creatNSThread2
{
    //    NSThread *thread=[NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"创建完线程直接(自动)启动"];
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"创建完线程直接(自动)启动"];
}

/**
 * NSThread创建线程方式3
 * 隐式创建线程, 并且直接(自动)启动
 */
-(void)creatNSThread3
{
    //在后台线程中执行===在子线程中执行
    [self performSelectorInBackground:@selector(run:) withObject:@"隐式创建"];
}
-(void)run:(NSString *)str
{
    //获取当前线程
    NSThread *current=[NSThread currentThread];
    //打印输出
    for (int i=0; i<10; i++) {
        NSLog(@"run---%@---%@",current,str);
    }
}
@end
