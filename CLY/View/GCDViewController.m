//
//  GCDViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "GCDViewController.h"

@implementation GCDViewController

-(void)viewDidLoad{
    /*
    1.什么是GCD？
    全称是Grand Central Dispatch，可译为“牛逼的中枢调度器” 纯C语言，提供了非常多强大的函数
    
    2.GCD的优势
    GCD是苹果公司为多核的并行运算提出的解决方案
    GCD会自动利用更多的CPU内核（比如双核、四核）
    GCD会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
    程序员只需要告诉GCD想要执行什么任务，不需要编写任何线程管理代码

    3.提示
    (1)GCD存在于libdispatch.dylib这个库中，这个调度库包含了GCD的所有的东西，但任何IOS程序，默认就加载了这个库，在程序运行的过程中会动态的加载这个库，不需要我们手动导入。
    (2)GCD是纯C语言的，因此我们在编写GCD相关代码的时候，面对的函数，而不是方法。
    (3)GCD中的函数大多数都以dispatch开头。
    
    二、任务和队列
    GCD中有2个核心概念
    （1）任务：执行什么操作
    （2）队列：用来存放任务
    
    GCD的使用就2个步骤
    （1）定制任务
    （2）确定想做的事情
    
    将任务添加到队列中，GCD会自动将队列中的任务取出，放到对应的线程中执行
    提示：任务的取出遵循队列的FIFO原则：先进先出，后进后出
    
    三、执行任务
    1.GCD中有2个用来执行任务的函数
    说明：把右边的参数（任务）提交给左边的参数（队列）进行执行。
    （1）用同步的方式执行任务 dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);
    参数说明：
    queue：队列
    block：任务
    
    （2）用异步的方式执行任务 dispatch_async(dispatch_queue_t queue, dispatch_block_t block);
    2.同步和异步的区别
    同步：在当前线程中执行
    异步：在另一条线程中执行
    
    四、队列
    1.队列的类型
    GCD的队列可以分为2大类型
    （1）并发队列（Concurrent Dispatch Queue）
    可以让多个任务并发（同时）执行（自动开启多个线程同时执行任务）并发功能只有在异步（dispatch_async）函数下才有效
    （2）串行队列（Serial Dispatch Queue））
    让任务一个接着一个地执行（一个任务执行完毕后，再执行下一个任务）
    
    2.补充说明
    有4个术语比较容易混淆：同步、异步、并发、串行
    同步和异步决定了要不要开启新的线程
    同步：在当前线程中执行任务，不具备开启新线程的能力
    异步：在新的线程中执行任务，具备开启新线程的能力
    
    并发和串行决定了任务的执行方式
    并发：多个任务并发（同时）执行
    串行：一个任务执行完毕后，再执行下一个任务
    
    3.串行队列
    GCD中获得串行有2种途径
    （1）使用dispatch_queue_create函数创建串行队列
    dispatch_queue_t  dispatch_queue_create(const char *label,  dispatch_queue_attr_t attr); // 队列名称， 队列属性，一般用NULL即可
    示例：
    dispatch_queue_t queue = dispatch_queue_create("wendingding", NULL); // 创建
    dispatch_release(queue); // 非ARC需要释放手动创建的队列
    
    （2）使用主队列（跟主线程相关联的队列）
    主队列是GCD自带的一种特殊的串行队列,放在主队列中的任务，都会放到主线程中执行
    使用dispatch_get_main_queue()获得主队列
    示例：
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    4.并发队列
    GCD默认已经提供了全局的并发队列，供整个应用使用，不需要手动创建
    使用dispatch_get_global_queue函数获得全局的并发队列
    dispatch_queue_t dispatch_get_global_queue(dispatch_queue_priority_t priority,unsigned long flags); // 此参数暂时无用，用0即可
    示例：
    这个参数是留给以后用的，暂时用不上，传个0。
    第一个参数为优先级，这里选择默认的。获取一个全局的默认优先级的并发队列。
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); // 获得全局并发队列
    
    说明：全局并发队列的优先级
#define DISPATCH_QUEUE_PRIORITY_HIGH 2 // 高
#define DISPATCH_QUEUE_PRIORITY_DEFAULT 0 // 默认（中）
#define DISPATCH_QUEUE_PRIORITY_LOW (-2) // 低
#define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN // 后台
    
    5.各种队列的执行效果
            全局并发队列      手动创建串行队列    主队列
    同步     没有开启新线程    没有开启新线程      没有开启新线程
          //串行执行任务      串行执行任务        串行执行任务
    异步     有开启新线程      有开启新线程      没有开启新线程
           //并发执行任务      串行执行任务        串行执行任务
    */
    
    
    /*
    （5）补充
    队列名称的作用：
    将来调试的时候，可以看得出任务是在哪个队列中执行的。
    （6）小结
    说明：同步函数不具备开启线程的能力，无论是什么队列都不会开启线程；异步函数具备开启线程的能力，开启几条线程由队列决定（串行队列只会开启一条新的线程，并发队列会开启多条线程）。
    同步函数
    （1）并发队列：不会开线程
    （2）串行队列：不会开线程
    异步函数
    （1）并发队列：能开启N条线程
    （2）串行队列：开启1条线程
    
    凡是函数中，各种函数名中带有create\copy\new\retain等字眼，都需要在不需要使用这个数据的时候进行release。
    GCD的数据类型在ARC的环境下不需要再做release。
    CF（core Foundation）的数据类型在ARC环境下还是需要做release。
    异步函数具备开线程的能力，但不一定会开线程
    */
    [self four];
    
    
//    iOS开发多线程篇—线程的状态
//    线程的创建：
//    self.thread=[[NSThread alloc]initWithTarget:self selector:@selector(test) object:nil];
//    说明：创建线程有多种方式，这里不做过多的介绍。
//    线程的开启：
//    [self.thread start];
//    线程的运行和阻塞：
//    （1）设置线程阻塞1，阻塞2秒
//    [NSThread sleepForTimeInterval:2.0];
//    （2）第二种设置线程阻塞2，以当前时间为基准阻塞4秒
//    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:4.0];
//    [NSThread sleepUntilDate:date];
//    线程处理阻塞状态时在内存中的表现情况：（线程被移出可调度线程池，此时不可调度）
//    线程的死亡：
//    
//    当线程的任务结束，发生异常，或者是强制退出这三种情况会导致线程的死亡。
//    线程死亡后，线程对象从内存中移除。
    [self testone];
    
    
//    主队列：是和主线程相关联的队列，主队列是GCD自带的一种特殊的串行队列，放在主队列中得任务，都会放到主线程中执行。
//    提示：如果把任务放到主队列中进行处理，那么不论处理函数是异步的还是同步的都不会开启新的线程。
//    获取主队列的方式：
//    dispatch_queue_t queue=dispatch_get_main_queue();
//    
    //使用异步函数执行主队列中得任务，代码示例：
    [self testtwo];
    
//    2）使用同步函数，在主线程中执行主队列中得任务，会发生死循环，任务无法往下执行。示意图如下：
//    任务1和任务2是在主线程执行还是子线程执行，还是单独再开启一个新的线程？
    [self performSelectorInBackground:@selector(testtest) withObject:nil];//开启一个后台线程，调用执行test方法
  
    
   
//    2.开启子线程，加载图片
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView;
//    //当手指触摸屏幕的时候，从网络上下载一张图片到控制器的view上显示
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//        //1.获取一个全局串行队列
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        //2.把任务添加到队列中执行
//        dispatch_async(queue, ^{
//            //打印当前线程
//            NSLog(@"%@",[NSThread currentThread]);
//            //3.从网络上下载图片
//            NSURL *urlstr=[NSURL URLWithString:@"http://h.hiphotos.baidu.com/baike/w%3D268/sign=30b3fb747b310a55c424d9f28f444387/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg"];
//            NSData *data=[NSData dataWithContentsOfURL:urlstr];
//            UIImage *image=[UIImage imageWithData:data];
//            //提示
//            NSLog(@"图片加载完毕");
//            
//            //4.回到主线程，展示图片
//            [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
//        });
//    }
    
//    要求使用GCD的方式，在子线程加载图片完毕后，主线程拿到加载的image刷新UI界面。
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView;
//    //当手指触摸屏幕的时候，从网络上下载一张图片到控制器的view上显示
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//        //1.获取一个全局串行队列
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        //2.把任务添加到队列中执行
//        dispatch_async(queue, ^{
//            //打印当前线程
//            NSLog(@"%@",[NSThread currentThread]);
//            //3.从网络上下载图片
//            NSURL *urlstr=[NSURL URLWithString:@"http://h.hiphotos.baidu.com/baike/w%3D268/sign=30b3fb747b310a55c424d9f28f444387/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg"];
//            NSData *data=[NSData dataWithContentsOfURL:urlstr];
//            UIImage *image=[UIImage imageWithData:data];
//            NSLog(@"图片加载完毕");//提示
//            //4.回到主线程，展示图片
//            //        [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.imageView.image=image;
//                //打印当前线程
//                NSLog(@"%@",[NSThread currentThread]);
//            });
//        });
//    }
//    好处：子线程中得所有数据都可以直接拿到主线程中使用，更加的方便和直观。

//    三、线程间通信
//    从子线程回到主线程
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 执⾏耗时的异步操作...
        dispatch_async(dispatch_get_main_queue(), ^{
            // 回到主线程,执⾏UI刷新操作
        });
    });
    
    
    
//    iOS常见的延时执行有2种方式
//    调用NSObject的方法
//    [self performSelector:@selector(run) withObject:nil afterDelay:2.0];、、2秒后再调用self的run方法
//    
//    使用GCD函数
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 2秒后异步执行这里的代码...
//    });
//    
//    2.说明
//    第一种方法，该方法在那个线程调用，那么run就在哪个线程执行（当前线程），通常是主线程。
//    [self performSelector:@selector(run) withObject:nil afterDelay:3.0];
//    说明：在3秒钟之后，执行run函数
//    
//    代码示例
//    - (void)viewDidLoad{
//        [super viewDidLoad];
//        NSLog(@"打印线程----%@",[NSThread currentThread]);
//        //延迟执行
//        //第一种方法：延迟3秒钟调用run函数
//        [self performSelector:@selector(run) withObject:nil afterDelay:2.0];
//    }
//    -(void)run{
//        NSLog(@"延迟执行----%@",[NSThread currentThread]);
//    }
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//    {
//        //在异步函数中执行
//        dispatch_queue_t queue = dispatch_queue_create("wendingding", 0);
//        dispatch_sync(queue, ^{
//            [self performSelector:@selector(test) withObject:nil afterDelay:1.0];
//        });
//        NSLog(@"异步函数");
//    }
//    -(void)test{
//        NSLog(@"异步函数中延迟执行----%@",[NSThread currentThread]);
//    }
//    说明：如果把该方法放在异步函数中执行，则方法不会被调用（BUG?）
//    
//    
//    第二种方法，
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        //延迟执行的方法
//    });
//    说明：在5秒钟之后，执行block中的代码段。
//    
//    什么时间，执行这个队列中的这个任务。
//    代码示例
//    - (void)viewDidLoad{
//        [super viewDidLoad];
//        NSLog(@"打印当前线程---%@",  [NSThread currentThread]);
//        //延迟执行，第二种方式
//        //可以安排其线程(1),主队列
//        dispatch_queue_t queue= dispatch_get_main_queue();
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), queue, ^{
//            NSLog(@"主队列--延迟执行------%@",[NSThread currentThread]);
//        });
//        //可以安排其线程(2),并发队列
//        //1.获取全局并发队列
//        dispatch_queue_t queue1= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        //2.计算任务执行的时间
//        dispatch_time_t when=dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC));
//        //3.会在when这个时间点，执行queue中的这个任务
//        dispatch_after(when, queue1, ^{
//            NSLog(@"并发队列-延迟执行------%@",[NSThread currentThread]);
//        });
//    }
//    延迟执行：不需要再写方法，且它还传递了一个队列，我们可以指定并安排其线程。
//    如果队列是主队列，那么就在主线程执行，如果队列是并发队列，那么会新开启一个线程，在子线程中执行。
//    
//    二、一次性代码
//    1.实现一次性代码
//    需求：点击控制器只有第一次点击的时候才打印。
//    实现代码
//    @property(nonatomic,assign) BOOL log;
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//        if (_log==NO) {
//            NSLog(@"该行代码只执行一次");
//            _log=YES;
//        }
//    }
//    缺点：这是一个对象方法，如果又创建一个新的控制器，那么打印代码又会执行，因为每个新创建的控制器都有自己的布尔类型，且新创建的默认为NO，因此不能保证改行代码在整个程序中只打印一次。
//    
//    2.使用dispatch_once一次性代码
//    使用dispatch_once函数能保证某段代码在程序运行过程中只被执行1次
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        // 只执行1次的代码(这里面默认是线程安全的)
//    });
//    整个程序运行过程中，只会执行一次。
//    代码示例
//    @property(nonatomic,assign) BOOL log;
//    //-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//    //{
//    //    if (_log==NO) {
//    //        NSLog(@"该行代码只执行一次");
//    //        _log=YES;
//    //    }
//    //}
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//    {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            NSLog(@"该行代码只执行一次");
//        });
//    }
//    效果（程序运行过程中，打印代码只会执行一次）：
//    
//    三、队列组
//    从网络上下载两张图片，把两张图片合并成一张最终显示在view上。
//    1.第一种方法 代码示例
//    //宏定义全局并发队列
//#define global_quque    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//    //宏定义主队列
//#define main_queue       dispatch_get_main_queue()
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView1;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView2;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView3;
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//    {
//        //获取全局并发队列
//        //    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        //获取主队列
//        //    dispatch_queue_t queue= dispatch_get_main_queue();
//        
//        //    图片1：http://d.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=2b9a12172df5e0fefa1581533d095fcd/cefc1e178a82b9019115de3d738da9773912ef00.jpg
//        //    图片2：http://h.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=f47fd63ca41ea8d39e2f7c56f6635b2b/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg
//        dispatch_async(global_quque, ^{
//            //下载图片1
//            UIImage *image1= [self imageWithUrl:@"http://d.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=2b9a12172df5e0fefa1581533d095fcd/cefc1e178a82b9019115de3d738da9773912ef00.jpg"];
//            NSLog(@"图片1下载完成---%@",[NSThread currentThread]);
//            
//            //下载图片2
//            UIImage *image2= [self imageWithUrl:@"http://h.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=f47fd63ca41ea8d39e2f7c56f6635b2b/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg"];
//            NSLog(@"图片2下载完成---%@",[NSThread currentThread]);
//            
//            //回到主线程显示图片
//            dispatch_async(main_queue, ^{
//                NSLog(@"显示图片---%@",[NSThread currentThread]);
//                self.imageView1.image=image1;
//                self.imageView2.image=image2;
//                //合并两张图片
//                UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 100), NO, 0.0);
//                [image1 drawInRect:CGRectMake(0, 0, 100, 100)];
//                [image2 drawInRect:CGRectMake(100, 0, 100, 100)];
//                self.imageView3.image=UIGraphicsGetImageFromCurrentImageContext();
//                //关闭上下文
//                UIGraphicsEndImageContext();
//                NSLog(@"图片合并完成---%@",[NSThread currentThread]);
//            });
//            //
//        });
//    }
//    
//    //封装一个方法，传入一个url参数，返回一张网络上下载的图片
//    -(UIImage *)imageWithUrl:(NSString *)urlStr{
//        NSURL *url=[NSURL URLWithString:urlStr];
//        NSData *data=[NSData dataWithContentsOfURL:url];
//        UIImage *image=[UIImage imageWithData:data];
//        return image;
//    }
//    
//    问题：这种方式的效率不高，需要等到图片1.图片2都下载完成后才行。
//    提示：使用队列组可以让图片1和图片2的下载任务同时进行，且当两个下载任务都完成的时候回到主线程进行显示。
//    2.使用队列组解决
//    步骤
//    创建一个组
//    开启一个任务下载图片1
//    开启一个任务下载图片2
//    同时执行下载图片1\下载图片2操作
//    等group中的所有任务都执行完毕, 再回到主线程执行其他操作
//    代码示例
//    //宏定义全局并发队列
//#define global_quque    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//    //宏定义主队列
//#define main_queue       dispatch_get_main_queue()
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView1;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView2;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageView3;
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//        //    图片1：http://d.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=2b9a12172df5e0fefa1581533d095fcd/cefc1e178a82b9019115de3d738da9773912ef00.jpg
//        //    图片2：http://h.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=f47fd63ca41ea8d39e2f7c56f6635b2b/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg
//        
//        //1.创建一个队列组
//        dispatch_group_t group = dispatch_group_create();
//        
//        //2.开启一个任务下载图片1
//        __block UIImage *image1=nil;
//        dispatch_group_async(group, global_quque, ^{
//            image1= [self imageWithUrl:@"http://d.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=2b9a12172df5e0fefa1581533d095fcd/cefc1e178a82b9019115de3d738da9773912ef00.jpg"];
//            NSLog(@"图片1下载完成---%@",[NSThread currentThread]);
//        });
//        
//        //3.开启一个任务下载图片2
//        __block UIImage *image2=nil;
//        dispatch_group_async(group, global_quque, ^{
//            image2= [self imageWithUrl:@"http://h.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=f47fd63ca41ea8d39e2f7c56f6635b2b/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg"];
//            NSLog(@"图片2下载完成---%@",[NSThread currentThread]);
//        });
//        
//        //同时执行下载图片1\下载图片2操作
//        
//        //4.等group中的所有任务都执行完毕, 再回到主线程执行其他操作
//        dispatch_group_notify(group,main_queue, ^{
//            NSLog(@"显示图片---%@",[NSThread currentThread]);
//            self.imageView1.image=image1;
//            self.imageView2.image=image2;
//            
//            //合并两张图片
//            //注意最后一个参数是浮点数（0.0），不要写成0。
//            UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 100), NO, 0.0);
//            [image1 drawInRect:CGRectMake(0, 0, 100, 100)];
//            [image2 drawInRect:CGRectMake(100, 0, 100, 100)];
//            self.imageView3.image=UIGraphicsGetImageFromCurrentImageContext();
//            //关闭上下文
//            UIGraphicsEndImageContext();
//            
//            NSLog(@"图片合并完成---%@",[NSThread currentThread]);
//        });
//    }
//    -(void)download2image
//    {
//        //获取全局并发队列
//        //    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        //获取主队列
//        //    dispatch_queue_t queue= dispatch_get_main_queue();
//        dispatch_async(global_quque, ^{
//            //下载图片1
//            UIImage *image1= [self imageWithUrl:@"http://news.baidu.com/z/resource/r/image/2014-06-22/2a1009253cf9fc7c97893a4f0fe3a7b1.jpg"];
//            NSLog(@"图片1下载完成---%@",[NSThread currentThread]);
//            
//            //下载图片2
//            UIImage *image2= [self imageWithUrl:@"http://news.baidu.com/z/resource/r/image/2014-06-22/2a1009253cf9fc7c97893a4f0fe3a7b1.jpg"];
//            NSLog(@"图片2下载完成---%@",[NSThread currentThread]);
//            
//            //回到主线程显示图片
//            dispatch_async(main_queue, ^{
//                NSLog(@"显示图片---%@",[NSThread currentThread]);
//                self.imageView1.image=image1;
//                self.imageView2.image=image2;
//                //合并两张图片
//                UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 100), NO, 0.0);
//                [image1 drawInRect:CGRectMake(0, 0, 100, 100)];
//                [image2 drawInRect:CGRectMake(0, 0, 100, 100)];
//                self.imageView3.image=UIGraphicsGetImageFromCurrentImageContext();
//                //关闭上下文
//                UIGraphicsEndImageContext();
//                NSLog(@"图片合并完成---%@",[NSThread currentThread]);
//            });
//            //
//        });
//    }
//    
//    //封装一个方法，传入一个url参数，返回一张网络上下载的图片
//    -(UIImage *)imageWithUrl:(NSString *)urlStr{
//        NSURL *url=[NSURL URLWithString:urlStr];
//        NSData *data=[NSData dataWithContentsOfURL:url];
//        UIImage *image=[UIImage imageWithData:data];
//        return image;
//    }
//    @end
//    打印查看（同时开启了两个子线程，分别下载图片）：
//    
//    2.补充说明
//    有这么1种需求：
//    首先：分别异步执行2个耗时的操作
//    其次：等2个异步操作都执行完毕后，再回到主线程执行操作
//    如果想要快速高效地实现上述需求，可以考虑用队列组
//    dispatch_group_t group =  dispatch_group_create();
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // 执行1个耗时的异步操作
//    });
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // 执行1个耗时的异步操作
//    });
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        // 等前面的异步操作都执行完毕后，回到主线程...
//    });
    
}


- (void)testone{
    //创建线程
    self.thread=[[NSThread alloc]initWithTarget:self selector:@selector(test) object:nil];
    //设置线程的名称
    [self.thread setName:@"线程A"];
    //开启线程
    [self.thread start];
}
-(void)testtwo{
    NSLog(@"打印主线程--%@", [NSThread mainThread]);//打印主线程
    dispatch_queue_t queue=dispatch_get_main_queue();//1.获取主队列
    //2.把任务添加到主队列中执行
    dispatch_async(queue, ^{
        NSLog(@"使用异步函数执行主队列中的任务1--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"使用异步函数执行主队列中的任务2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"使用异步函数执行主队列中的任务3--%@",[NSThread currentThread]);
    });
}
-(void)testtest
{
    NSLog(@"当前线程---%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //异步函数
    dispatch_async(queue, ^{
        NSLog(@"任务1所在的线程----%@",[NSThread currentThread]);
    });
    //同步函数
    dispatch_sync(queue, ^{
        NSLog(@"任务2所在的线程----%@",[NSThread currentThread]);
    });
}

-(void)test
{
    //获取线程
    NSThread *current=[NSThread currentThread];
    NSLog(@"test---打印线程---%@",self.thread.name);
    NSLog(@"test---线程开始---%@",current.name);
    //设置线程阻塞1，阻塞2秒
    NSLog(@"接下来，线程阻塞2秒");
    [NSThread sleepForTimeInterval:2.0];
    //第二种设置线程阻塞2，以当前时间为基准阻塞4秒
    NSLog(@"接下来，线程阻塞4秒");
    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:4.0];
    [NSThread sleepUntilDate:date];
    for (int i=0; i<20; i++) {
        NSLog(@"线程--%d--%@",i,current.name);
    }
    NSLog(@"test---线程结束---%@",current.name);
    
    
//    //退出线程
//    //获取线程
//    NSThread *current=[NSThread currentThread];
//    NSLog(@"test---打印线程---%@",self.thread.name);
//    NSLog(@"test---线程开始---%@",current.name);
//    
//    //设置线程阻塞1，阻塞2秒
//    NSLog(@"接下来，线程阻塞2秒");
//    [NSThread sleepForTimeInterval:2.0];
//    
//    //第二种设置线程阻塞2，以当前时间为基准阻塞4秒
//    NSLog(@"接下来，线程阻塞4秒");
//    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:4.0];
//    [NSThread sleepUntilDate:date];
//    for (int i=0; i<20; i++) {
//        NSLog(@"线程--%d--%@",i,current.name);
//        if (5==i) {
//            //结束线程
//            [NSThread exit];
//        }
//    }
//    NSLog(@"test---线程结束---%@",current.name);
//    //注意：人死不能复生，线程死了也不能复生（重新开启），如果在线程死亡之后，再次点击屏幕尝试重新开启线程，则程序会挂。
}


#pragma mark 用异步函数往并发队列中添加任务
-(void)one{
    //1.获得全局的并发队列
    dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //2.添加任务到队列中，就可以执行任务
    //异步函数：具备开启新线程的能力
    dispatch_async(queue, ^{
        NSLog(@"下载图片1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    //打印主线程
    NSLog(@"主线程----%@",[NSThread mainThread]);
    
    //总结：同时开启三个子线程
}
#pragma mark 用异步函数往串行队列中添加任务
-(void)two{
    //打印主线程
    NSLog(@"主线程----%@",[NSThread mainThread]);
    //创建串行队列
    dispatch_queue_t  queue= dispatch_queue_create("wendingding", NULL);
    //第一个参数为串行队列的名称，是c语言的字符串
    //第二个参数为队列的属性，一般来说串行队列不需要赋值任何属性，所以通常传空值（NULL）
    
    //2.添加任务到队列中执行
    dispatch_async(queue, ^{
        NSLog(@"下载图片1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    
    //3.释放资源
    //dispatch_release(queue);
    
    //总结：会开启线程，但是只开启一个线程
}
#pragma mark 用同步函数往并发队列中添加任务
//用同步函数往并发队列中添加任务
-(void)three{
    NSLog(@"主线程----%@",[NSThread mainThread]);//打印主线程
    dispatch_queue_t  queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//创建串行队列
    //2.添加任务到队列中执行
    dispatch_sync(queue, ^{
        NSLog(@"下载图片1----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片3----%@",[NSThread currentThread]);
    });
    //总结：不会开启新的线程，并发队列失去了并发的功能
}
#pragma mark 用同步函数往串行队列中添加任务
//用同步函数往串行队列中添加任务
-(void)four{
    NSLog(@"用同步函数往串行队列中添加任务");
    NSLog(@"主线程----%@",[NSThread mainThread]);//打印主线程
    dispatch_queue_t  queue= dispatch_queue_create("wendingding", NULL);//创建串行队列
    //2.添加任务到队列中执行
    dispatch_sync(queue, ^{
        NSLog(@"下载图片1----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片3----%@",[NSThread currentThread]);
    });
    //总结：不会开启新的线程
}
@end
