//
//  OperationViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/5.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "OperationViewController.h"

@interface OperationViewController ()

@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    一、NSOperation简介
//    
//    1.简单说明
//    
//    NSOperation的作⽤：配合使用NSOperation和NSOperationQueue也能实现多线程编程
//    
//    NSOperation和NSOperationQueue实现多线程的具体步骤：
//    
//    （1）先将需要执行的操作封装到一个NSOperation对象中
//    
//    （2）然后将NSOperation对象添加到NSOperationQueue中
//    
//    （3）系统会⾃动将NSOperationQueue中的NSOperation取出来
//    
//    （4）将取出的NSOperation封装的操作放到⼀条新线程中执⾏
//    
//    2.NSOperation的子类
//    
//    NSOperation是个抽象类,并不具备封装操作的能力,必须使⽤它的子类
//    
//    使用NSOperation⼦类的方式有3种：
//    
//    （1）NSInvocationOperation
//    
//    （2）NSBlockOperation
//    
//    （3）自定义子类继承NSOperation,实现内部相应的⽅法
//    
//    二、 具体说明
//    
//    1.NSInvocationOperation子类
//    
//    创建对象和执行操作：
//    
//    //创建操作对象，封装要执行的任务
//    //NSInvocationOperation   封装操作
//    NSInvocationOperation *operation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test) object:nil];
//    
//    //执行操作
//    [operation start];
//    
//    说明：一旦执⾏操作,就会调用target的test方法
//    
//    代码示例：
//    //
//    //  YYViewController.m
//    //  01-NSOperation基本1
//    //
//    //  Created by 孔医己 on 14-6-25.
//    //  Copyright (c) 2014年 itcast. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//    
//    @interface YYViewController ()
//    
//    @end
//    
//    @implementation YYViewController
//    
//    - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //NSOperation:抽象类，不具备封装功能
//        
//        //创建操作对象，封装要执行的任务
//        //NSInvocationOperation   封装操作
//        NSInvocationOperation *operation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test) object:nil];
//        
//        //执行操作
//        [operation start];
//        
//    }
//    
//    -(void)test
//    {
//        
//        NSLog(@"--test--%@--",[NSThread currentThread]);
//    }
//    @end
//    打印查看：
//    
//    
//    
//    注意：操作对象默认在主线程中执行，只有添加到队列中才会开启新的线程。即默认情况下，如果操作没有放到队列中queue中，都是同步执行。只有将NSOperation放到一个NSOperationQueue中,才会异步执行操作
//    
//    
//    
//    2.NSBlockOperation子类
//    
//    创建对象和添加操作：
//    
//    
//    //创建NSBlockOperation操作对象
//    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
//        //......
//    }];
//    
//    //添加操作
//    [operation addExecutionBlock:^{
//        //....
//    }];
//    
//    
//    代码示例：
//    
//    代码1：
//    //
//    //  YYViewController.m
//    //  02-NSTherad基本2
//    //
//    //  Created by 孔医己 on 14-6-25.
//    //  Copyright (c) 2014年 itcast. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//    
//    @interface YYViewController ()
//    
//    @end
//    
//    @implementation YYViewController
//    
//    - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //创建NSBlockOperation操作对象
//        NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"NSBlockOperation------%@",[NSThread currentThread]);
//        }];
//        
//        
//        //开启执行操作
//        [operation start];
//    }
//    @end
//    //
//    //  YYViewController.m
//    //  02-NSTherad基本2
//    //
//    //  Created by 孔医己 on 14-6-25.
//    //  Copyright (c) 2014年 itcast. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//    
//    @interface YYViewController ()
//    
//    @end
//    
//    @implementation YYViewController
//    
//    - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //创建NSBlockOperation操作对象
//        NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"NSBlockOperation------%@",[NSThread currentThread]);
//        }];
//        
//        //添加操作
//        [operation addExecutionBlock:^{
//            NSLog(@"NSBlockOperation1------%@",[NSThread currentThread]);
//        }];
//        
//        [operation addExecutionBlock:^{
//            NSLog(@"NSBlockOperation2------%@",[NSThread currentThread]);
//        }];
//        
//        //开启执行操作
//        [operation start];
//    }
//    @end
//    注意:只要NSBlockOperation封装的操作数 > 1,就会异步执行操作
//    
//    
//    
//    3.NSOperationQueue
//    
//    NSOperationQueue的作⽤：NSOperation可以调⽤start⽅法来执⾏任务,但默认是同步执行的
//    
//    如果将NSOperation添加到NSOperationQueue(操作队列)中,系统会自动异步执行NSOperation中的操作
//    
//    添加操作到NSOperationQueue中，自动执行操作，自动开启线程
//    
// 
//    //创建NSOperationQueue
//    NSOperationQueue * queue=[[NSOperationQueue alloc]init];
//    //把操作添加到队列中
//    //第一种方式
//    [queue addOperation:operation1];
//    [queue addOperation:operation2];
//    [queue addOperation:operation3];
//    //第二种方式
//    [queue addOperationWithBlock:^{
//        NSLog(@"NSBlockOperation3--4----%@",[NSThread currentThread]);
//    }];
//    - (void)addOperation:(NSOperation *)op;
//    - (void)addOperationWithBlock:(void (^)(void))block;
//    
//    代码示例：
//    //
//    //  YYViewController.m
//    //  03-NSOperation基本3
//    //
//    //  Created by 孔医己 on 14-6-25.
//    //  Copyright (c) 2014年 itcast. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//    
//    @interface YYViewController ()
//    
//    @end
//    
//    @implementation YYViewController
//    
//    - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //创建NSInvocationOperation对象，封装操作
//        NSInvocationOperation *operation1=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test1) object:nil];
//        NSInvocationOperation *operation2=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test2) object:nil];
//        //创建对象，封装操作
//        NSBlockOperation *operation3=[NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"NSBlockOperation3--1----%@",[NSThread currentThread]);
//        }];
//        [operation3 addExecutionBlock:^{
//            NSLog(@"NSBlockOperation3--2----%@",[NSThread currentThread]);
//        }];
//        
//        //创建NSOperationQueue
//        NSOperationQueue * queue=[[NSOperationQueue alloc]init];
//        //把操作添加到队列中
//        [queue addOperation:operation1];
//        [queue addOperation:operation2];
//        [queue addOperation:operation3];
//    }
//    
//    -(void)test1
//    {
//        NSLog(@"NSInvocationOperation--test1--%@",[NSThread currentThread]);
//    }
//    
//    -(void)test2
//    {
//        NSLog(@"NSInvocationOperation--test2--%@",[NSThread currentThread]);
//    }
//    
//    @end
//    注意：系统自动将NSOperationqueue中的NSOperation对象取出，将其封装的操作放到一条新的线程中执行。上面的代码示例中，一共有四个任务，operation1和operation2分别有一个任务，operation3有两个任务。一共四个任务，开启了四条线程。通过任务执行的时间全部都是273可以看出，这些任务是并行执行的。
//    
//    提示：队列的取出是有顺序的，与打印结果并不矛盾。这就好比，选手A,BC虽然起跑的顺序是先A,后B，然后C，但是到达终点的顺序却不一定是A,B在前，C在后。
//    下面使用for循环打印，可以更明显的看出任务是并发执行的。
//        
//        代码示例：
//#import "YYViewController.h"
//        
//        @interface YYViewController ()
//        
//        @end
//        
//        @implementation YYViewController
//        
//        - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //创建NSInvocationOperation对象，封装操作
//        NSInvocationOperation *operation1=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test1) object:nil];
//        NSInvocationOperation *operation2=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test2) object:nil];
//        //创建对象，封装操作
//        NSBlockOperation *operation3=[NSBlockOperation blockOperationWithBlock:^{
//            for (int i=0; i<5; i++) {
//                NSLog(@"NSBlockOperation3--1----%@",[NSThread currentThread]);
//            }
//        }];
//        [operation3 addExecutionBlock:^{
//            for (int i=0; i<5; i++) {
//                NSLog(@"NSBlockOperation3--2----%@",[NSThread currentThread]);
//            }
//        }];
//        
//        //创建NSOperationQueue
//        NSOperationQueue * queue=[[NSOperationQueue alloc]init];
//        //把操作添加到队列中
//        [queue addOperation:operation1];
//        [queue addOperation:operation2];
//        [queue addOperation:operation3];
//    }
//    
//    -(void)test1
//    {
//        for (int i=0; i<5; i++) {
//            NSLog(@"NSInvocationOperation--test1--%@",[NSThread currentThread]);
//        }
//    }
//    
//    -(void)test2
//    {
//        for (int i=0; i<5; i++) {
//            NSLog(@"NSInvocationOperation--test2--%@",[NSThread currentThread]);
//        }
//    }
//    
//    @end
//    iOS开发多线程篇—NSOperation基本操作
//    
//    一、并发数
//    （1）并发数:同时执⾏行的任务数.比如,同时开3个线程执行3个任务,并发数就是3
//    （2）最大并发数：同一时间最多只能执行的任务的个数。
//    （3）最⼤大并发数的相关⽅方法
//    - (NSInteger)maxConcurrentOperationCount;
//    - (void)setMaxConcurrentOperationCount:(NSInteger)cnt;
//    说明：如果没有设置最大并发数，那么并发的个数是由系统内存和CPU决定的，可能内存多久开多一点，内存少就开少一点。
//    注意：num的值并不代表线程的个数，仅仅代表线程的ID。
//    提示：最大并发数不要乱写（5以内），不要开太多，一般以2~3为宜，因为虽然任务是在子线程进行处理的，但是cpu处理这些过多的子线程可能会影响UI，让UI变卡。
//    
//    二、队列的取消，暂停和恢复
//    （1）取消队列的所有操作
//    
//    - (void)cancelAllOperations;
//    
//    提⽰:也可以调用NSOperation的- (void)cancel⽅法取消单个操作
//    
//    （2）暂停和恢复队列
//    
//    - (void)setSuspended:(BOOL)b; // YES代表暂停队列,NO代表恢复队列
//    
//    - (BOOL)isSuspended; //当前状态
//    
//    （3）暂停和恢复的适用场合：在tableview界面，开线程下载远程的网络界面，对UI会有影响，使用户体验变差。那么这种情况，就可以设置在用户操作UI（如滚动屏幕）的时候，暂停队列（不是取消队列），停止滚动的时候，恢复队列。
//    
//    三、操作优先级
//    （1）设置NSOperation在queue中的优先级,可以改变操作的执⾏优先级
//    
//    - (NSOperationQueuePriority)queuePriority;
//    - (void)setQueuePriority:(NSOperationQueuePriority)p;
//    
//    （2）优先级的取值
//    
//    NSOperationQueuePriorityVeryLow = -8L,
//    
//    NSOperationQueuePriorityLow = -4L,
//    
//    NSOperationQueuePriorityNormal = 0,
//    
//    NSOperationQueuePriorityHigh = 4,
//    
//    NSOperationQueuePriorityVeryHigh = 8
//    
//    说明：优先级高的任务，调用的几率会更大。
//    
//    
//    
//    四、操作依赖
//    （1）NSOperation之间可以设置依赖来保证执行顺序，⽐如一定要让操作A执行完后,才能执行操作B,可以像下面这么写
//    
//    [operationB addDependency:operationA]; // 操作B依赖于操作
//    
//    （2）可以在不同queue的NSOperation之间创建依赖关系
//    注意：不能循环依赖（不能A依赖于B，B又依赖于A）。
//    
//    （3）代码示例
//#import "YYViewController.h"
//    
//    @interface YYViewController ()
//    
//    @end
//    
//    @implementation YYViewController
//    
//    - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //创建NSInvocationOperation对象，封装操作
//        NSInvocationOperation *operation1=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test1) object:nil];
//        NSInvocationOperation *operation2=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test2) object:nil];
//        //创建对象，封装操作
//        NSBlockOperation *operation3=[NSBlockOperation blockOperationWithBlock:^{
//            for (int i=0; i<5; i++) {
//                NSLog(@"NSBlockOperation3--1----%@",[NSThread currentThread]);
//            }
//        }];
//        [operation3 addExecutionBlock:^{
//            for (int i=0; i<5; i++) {
//                NSLog(@"NSBlockOperation3--2----%@",[NSThread currentThread]);
//            }
//        }];
//        
//        //设置操作依赖
//        //先执行operation2，再执行operation1，最后执行operation3
//        [operation3 addDependency:operation1];
//        [operation1 addDependency:operation2];
//        
//        //不能是相互依赖
//        //    [operation3 addDependency:operation1];
//        //    [operation1 addDependency:operation3];
//        
//        //创建NSOperationQueue
//        NSOperationQueue * queue=[[NSOperationQueue alloc]init];
//        //把操作添加到队列中
//        [queue addOperation:operation1];
//        [queue addOperation:operation2];
//        [queue addOperation:operation3];
//    }
//    
//    -(void)test1
//    {
//        for (int i=0; i<5; i++) {
//            NSLog(@"NSInvocationOperation--test1--%@",[NSThread currentThread]);
//        }
//    }
//    
//    -(void)test2
//    {
//        for (int i=0; i<5; i++) {
//            NSLog(@"NSInvocationOperation--test2--%@",[NSThread currentThread]);
//        }
//    }
//    
//    @end
//    A做完再做B，B做完才做C。
//    注意：一定要在添加之前，进行设置。
//    提示：任务添加的顺序并不能够决定执行顺序，执行的顺序取决于依赖。使用Operation的目的就是为了让开发人员不再关心线程。
//    
//    
//    5.操作的监听
//    可以监听一个操作的执行完毕
//    
//    - (void (^)(void))completionBlock;
//    - (void)setCompletionBlock:(void (^)(void))block;
//    
//    代码示例
//    
//    第一种方式：可以直接跟在任务后面编写需要完成的操作，如这里在下载图片后，紧跟着下载第二张图片。但是这种写法有的时候把两个不相关的操作写到了一个代码块中，代码的可阅读性不强。
//#import "YYViewController.h"
//    
//    @interface YYViewController ()
//    
//    @end
//    
//    @implementation YYViewController
//    
//    - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //创建对象，封装操作
//        NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"-operation-下载图片-%@",[NSThread currentThread]);
//            //.....下载图片后继续进行的操作
//            NSLog(@"--接着下载第二张图片--");
//        }];
//        
//        //创建队列
//        NSOperationQueue *queue=[[NSOperationQueue alloc]init];
//        //把任务添加到队列中（自动执行，自动开线程）
//        [queue addOperation:operation];
//    }
//    
//    @end
//    第二种方式：
//#import "YYViewController.h"
//    
//    @interface YYViewController ()
//    
//    @end
//    @implementation YYViewController
//    
//    - (void)viewDidLoad
//    {
//        [super viewDidLoad];
//        
//        //创建对象，封装操作
//        NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
//            for (int i=0; i<10; i++) {
//                NSLog(@"-operation-下载图片-%@",[NSThread currentThread]);
//            }
//        }];
//        
//        //监听操作的执行完毕
//        operation.completionBlock=^{
//            //.....下载图片后继续进行的操作
//            NSLog(@"--接着下载第二张图片--");
//        };
//        
//        //创建队列
//        NSOperationQueue *queue=[[NSOperationQueue alloc]init];
//        //把任务添加到队列中（自动执行，自动开线程）
//        [queue addOperation:operation];
//    }
//    
//    @end
//    说明：在上一个任务执行完后，会执行operation.completionBlock=^{}代码段，且是在当前线程执行（2）。
//    
//    一、实现一个简单的tableView显示效果
//    代码示例（使用以前在主控制器中进行业务处理的方式）
//    
//    1.新建一个项目，让控制器继承自UITableViewController。
//    //
//    //  YYViewController.h
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import <UIKit/UIKit.h>
//    
//    @interface YYViewController : UITableViewController
//    
//    @end
//    新建一个类，继承自NSObject，作为数据的模型
//    
//    YYappModel.h文件
//    //
//    //  YYappModel.h
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import <Foundation/Foundation.h>
//    
//    @interface YYappModel : NSObject
//    /**
//     *应用名称
//     */
//    @property(nonatomic,copy)NSString *name;
//    /**
//     *  应用图片
//     */
//    @property(nonatomic,copy)NSString *icon;
//    /**
//     *  应用的下载量
//     */
//    @property(nonatomic,copy)NSString *download;
//    
//    +(instancetype)appModelWithDict:(NSDictionary *)dict;
//    -(instancetype)initWithDict:(NSDictionary *)dict;
//    @end
//    //
//    //  YYappModel.m
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYappModel.h"
//    
//    @implementation YYappModel
//    
//    -(instancetype)initWithDict:(NSDictionary *)dict
//    {
//        if (self=[super init]) {
//            [self setValuesForKeysWithDictionary:dict];
//        }
//        return self;
//    }
//    
//    //工厂方法
//    +(instancetype)appModelWithDict:(NSDictionary *)dict
//    {
//        return [[self alloc]initWithDict:dict];
//    }
//    @end
//    
//    主控制器中得逻辑控制部分，YYViewController.m文件
//    //
//    //  YYViewController.m
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//#import "YYappModel.h"
//    
//    @interface YYViewController ()
//    @property(nonatomic,strong)NSArray *apps;
//    
//    @end
//    
//    @implementation YYViewController
//#pragma mark- 懒加载
//    -(NSArray *)apps
//    {
//        if (_apps==nil) {
//            NSString *path=[[NSBundle mainBundle]pathForResource:@"apps.plist" ofType:nil];
//            NSArray *tempArray=[NSArray arrayWithContentsOfFile:path];
//            
//            //字典转模型
//            NSMutableArray *array=[NSMutableArray array];
//            for (NSDictionary *dict in tempArray) {
//                YYappModel *app=[YYappModel appModelWithDict:dict];
//                [array addObject:app];
//            }
//            _apps=array;
//        }
//        return _apps;
//    }
//    
//#pragma mark-数据源方法
//    -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//    {
//        return self.apps.count;
//    }
//    
//    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//        static NSString *ID=@"ID";
//        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
//        if (cell==nil) {
//            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        }
//        YYappModel *app=self.apps[indexPath.row];
//        cell.textLabel.text=app.name;
//        cell.detailTextLabel.text=app.download;
//        
//        //下载图片数据
//        NSLog(@"加载图片数据---%@", [NSThread currentThread]);
//        NSURL *url=[NSURL URLWithString:app.icon];
//        NSData *data=[NSData dataWithContentsOfURL:url];
//        UIImage *imgae=[UIImage imageWithData:data];
//        cell.imageView.image=imgae;
//        NSLog(@"完成显示");
//        return cell;
//    }
//    
//    @end
//    
//    二、自定义NSOperation
//    
//    说明：上面的下载图片数据部分是一个非常耗时的操作，这个操作任务在主线程完成，会严重的影响到用户体验，造成UI卡的现象。下面通过自定义NSOperation，新开线程，让加载图片的任务异步执行。
//    
//    1.通过代理
//    
//    在上面的基础上，新建一个类，让其继承自NSOperation。
//    
//    YYdownLoadOperation.h文件
//    //
//    //  YYdownLoadOperation.h
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import <Foundation/Foundation.h>
//    
//#pragma mark-设置代理和代理方法
//    @class YYdownLoadOperation;
//    @protocol YYdownLoadOperationDelegate <NSObject>
//    -(void)downLoadOperation:(YYdownLoadOperation*)operation didFishedDownLoad:(UIImage *)image;
//    @end
//    
//    @interface YYdownLoadOperation : NSOperation
//    @property(nonatomic,copy)NSString *url;
//    @property(nonatomic,strong)NSIndexPath *indexPath;
//    @property(nonatomic,strong)id <YYdownLoadOperationDelegate> delegate;
//    @end
//    
//    
//    
//    YYdownLoadOperation.m文件
//    //
//    //  YYdownLoadOperation.m
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYdownLoadOperation.h"
//    
//    @implementation YYdownLoadOperation
//    -(void)main
//    {
//        NSURL *url=[NSURL URLWithString:self.url];
//        NSData *data=[NSData dataWithContentsOfURL:url];
//        UIImage *imgae=[UIImage imageWithData:data];
//        
//        NSLog(@"--%@--",[NSThread currentThread]);
//        //图片下载完毕后，通知代理
//        if ([self.delegate respondsToSelector:@selector(downLoadOperation:didFishedDownLoad:)]) {
//            dispatch_async(dispatch_get_main_queue(), ^{//回到主线程，传递数据给代理对象
//                [self.delegate downLoadOperation:self didFishedDownLoad:imgae];
//            });
//        }
//    }
//    @end
//    主控制器中的业务逻辑：
//    //
//    //  YYViewController.m
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//#import "YYappModel.h"
//#import "YYdownLoadOperation.h"
//    
//    @interface YYViewController ()<YYdownLoadOperationDelegate>
//    @property(nonatomic,strong)NSArray *apps;
//    @property(nonatomic,strong)NSOperationQueue *queue;
//    
//    @end
//    
//    @implementation YYViewController
//#pragma mark- 懒加载apps
//    -(NSArray *)apps
//    {
//        if (_apps==nil) {
//            NSString *path=[[NSBundle mainBundle]pathForResource:@"apps.plist" ofType:nil];
//            NSArray *tempArray=[NSArray arrayWithContentsOfFile:path];
//            
//            //字典转模型
//            NSMutableArray *array=[NSMutableArray array];
//            for (NSDictionary *dict in tempArray) {
//                YYappModel *app=[YYappModel appModelWithDict:dict];
//                [array addObject:app];
//            }
//            _apps=array;
//        }
//        return _apps;
//    }
//    
//#pragma mark-懒加载queue
//    -(NSOperationQueue *)queue
//    {
//        if (_queue==Nil) {
//            _queue=[[NSOperationQueue alloc]init];
//            //设置最大并发数为3
//            _queue.maxConcurrentOperationCount=3;
//        }
//        return _queue;
//    }
//    
//#pragma mark-数据源方法
//    -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//    {
//        return self.apps.count;
//    }
//    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//        static NSString *ID=@"ID";
//        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
//        if (cell==nil) {
//            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        }
//        YYappModel *app=self.apps[indexPath.row];
//        cell.textLabel.text=app.name;
//        cell.detailTextLabel.text=app.download;
//        
//        //下载图片数据
//        //    NSLog(@"加载图片数据---%@", [NSThread currentThread]);
//        //    NSURL *url=[NSURL URLWithString:app.icon];
//        //    NSData *data=[NSData dataWithContentsOfURL:url];
//        //    UIImage *imgae=[UIImage imageWithData:data];
//        //    cell.imageView.image=imgae;
//        
//        //创建一个OPeration对象
//        YYdownLoadOperation *operation=[[YYdownLoadOperation alloc]init];
//        operation.url=app.icon;
//        operation.indexPath=indexPath;
//        operation.delegate=self;
//        
//        //把操作对象添加到队列中在去
//        [self.queue addOperation:operation];
//        
//        //    NSLog(@"完成显示");
//        return cell;
//    }
//    -(void)downLoadOperation:(YYdownLoadOperation *)operation didFishedDownLoad:(UIImage *)image
//    {
//        //返回图片数据给每行对应的cell的imageview.image
//        //取出tableview中indexPath这一行对应的cell
//        UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:operation.indexPath];
//        //显示图片
//        cell.imageView.image=image;
//        //    NSLog(@"cell--index--%@---%@",operation.indexPath,[NSThread currentThread]);
//        //一定要刷新表格
//        [self.tableView reloadData];
//        NSLog(@"--%@--",[NSThread currentThread]);
//        
//    }
//    @end
//    
//    
//    说明：通过打印可以发现上面的代码存在很大的问题。
//    
//    问题1：需要保证一个url对应一个operation对象。
//    
//    问题2：下载完需要移除。移除执行完毕的操作。
//    
//    问题3：保证一个url对应一个image。
//    下面对主控制器中得代码进行改进：
//    //
//    //  YYViewController.m
//    //  01-自定义Operation
//    //
//    //  Created by apple on 14-6-26.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//#import "YYappModel.h"
//#import "YYdownLoadOperation.h"
//    
//    @interface YYViewController ()<YYdownLoadOperationDelegate>
//    @property(nonatomic,strong)NSArray *apps;
//    @property(nonatomic,strong)NSOperationQueue *queue;
//    @property(nonatomic,strong)NSMutableDictionary *operations;
//    @property(nonatomic,strong)NSMutableDictionary *images;
//    
//    @end
//    
//    @implementation YYViewController
//#pragma mark- 懒加载apps
//    -(NSArray *)apps
//    {
//        if (_apps==nil) {
//            NSString *path=[[NSBundle mainBundle]pathForResource:@"apps.plist" ofType:nil];
//            NSArray *tempArray=[NSArray arrayWithContentsOfFile:path];
//            
//            //字典转模型
//            NSMutableArray *array=[NSMutableArray array];
//            for (NSDictionary *dict in tempArray) {
//                YYappModel *app=[YYappModel appModelWithDict:dict];
//                [array addObject:app];
//            }
//            _apps=array;
//        }
//        return _apps;
//    }
//    
//#pragma mark-懒加载queue
//    -(NSOperationQueue *)queue
//    {
//        if (_queue==Nil) {
//            _queue=[[NSOperationQueue alloc]init];
//            //设置最大并发数为3
//            _queue.maxConcurrentOperationCount=3;
//        }
//        return _queue;
//    }
//    
//#pragma mark-懒加载operations
//    -(NSMutableDictionary *)operations
//    {
//        if (_operations==Nil) {
//            _operations=[NSMutableDictionary dictionary];
//        }
//        return _operations;
//    }
//    
//#pragma mark-懒加载images
//    -(NSMutableDictionary *)images
//    {
//        if (_images==Nil) {
//            _images=[NSMutableDictionary dictionary];
//        }
//        return _images;
//    }
//    
//#pragma mark-数据源方法
//    -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//    {
//        return self.apps.count;
//    }
//    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//        static NSString *ID=@"ID";
//        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
//        if (cell==nil) {
//            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        }
//        YYappModel *app=self.apps[indexPath.row];
//        cell.textLabel.text=app.name;
//        cell.detailTextLabel.text=app.download;
//        
//        //保证一个url对应一个image对象
//        UIImage *image=self.images[app.icon];
//        if (image) {//缓存中有图片
//            cell.imageView.image=image;
//        }else       //  缓存中没有图片，得下载
//        {
//            //先设置一张占位图片
//            cell.imageView.image=[UIImage imageNamed:@"57437179_42489b0"];
//            YYdownLoadOperation *operation=self.operations[app.icon];
//            if (operation) {//正在下载
//                //什么都不做
//            }else  //当前没有下载，那就创建操作
//            {
//                operation=[[YYdownLoadOperation alloc]init];
//                operation.url=app.icon;
//                operation.indexPath=indexPath;
//                operation.delegate=self;
//                [self.queue addOperation:operation];//异步下载
//                self.operations[app.icon]=operation;
//            }
//        }
//        
//        
//        return cell;
//    }
//    -(void)downLoadOperation:(YYdownLoadOperation *)operation didFishedDownLoad:(UIImage *)image
//    {
//        //1.移除执行完毕的操作
//        [self.operations removeObjectForKey:operation.url];
//        
//        //2.将图片放到缓存中
//        self.images[operation.url]=image;
//        
//        //3.刷新表格（只刷新下载的那一行）
//        
//        [self.tableView reloadRowsAtIndexPaths:@[operation.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        NSLog(@"--%d--%@--",operation.indexPath.row,[NSThread currentThread]);
//        
//    }
//    @end
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
