//
//  DLViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/5.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "DLViewController.h"

@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    iOS开发多线程篇—单例模式（ARC）
//    
//    一、简单说明：
//    
//    设计模式：多年软件开发，总结出来的一套经验、方法和工具
//    
//    java中有23种设计模式，在ios中最常用的是单例模式和代理模式。
//    
//    
//    
//    二、单例模式说明
//    
//    （1）单例模式的作用 :可以保证在程序运行过程，一个类只有一个实例，而且该实例易于供外界访问，从而方便地控制了实例个数，并节约系统资源。
//    
//    （2）单例模式的使用场合：在整个应用程序中，共享一份资源（这份资源只需要创建初始化1次），应该让这个类创建出来的对象永远只有一个。
//    
//    （3）单例模式在ARC\MRC环境下的写法有所不同，需要编写2套不同的代码
//    
//    可以用宏判断是否为ARC环境
//    
//#if __has_feature(objc_arc)
//    // ARC
//#else
//    // MRC
//#endif
//    （4）在ARC中，单例模式的实现思路
//    
//    在.m中保留一个全局的static的实例   static id _instance;
//    
//    1）重写allocWithZone:方法，在这里创建唯一的实例（注意线程安全）
//    + (id)allocWithZone:(struct _NSZone *)zone
//    {    @synchronized(self) {
//        if (!_instance) {
//            _instance = [super allocWithZone:zone];
//        }
//    }
//        return _instance;
//    }
//    2）提供1个类方法让外界访问唯一的实例
//    + (instancetype)sharedSoundTool
//    {
//        @synchronized(self) {
//            if (!_instance) {
//                _instance = [[self alloc] init];
//            }
//        }
//        return _instance;
//    }
//    3）实现copyWithZone:方法
//    + (id)copyWithZone:(struct _NSZone *)zone{
//        return _instance;
//    }
//    （5）非ARC中（MRC），单例模式的实现（比ARC多了几个步骤）
//    
//    实现内存管理方法
//    
//    - (id)retain { return self; }
//    
//    - (NSUInteger)retainCount { return 1; }
//    
//    - (oneway void)release {}
//    
//    - (id)autorelease { return self; }
//    
//    
//    
//    三、单例模式（ARC）
//    
//    1.说明
//    
//    重写allocWithzone:方法，控制内存分配。因为alloc内部会调用该方法，每次调用allocWithzone:方法，系统都会创建一块新的内存空间。
//    
//    alloc方法中：永远只分配一次内存
//    
//    init方法中：保证所有的MP3数据都只加载一次。
//    
//    
//    
//    2.代码示例
//    
//    创建一个音频工具类，继承子NSObject类。
//    
//    在该类中实现以下代码，观察：
//    //
//    //  YYAudioTool.m
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYAudioTool.h"
//    @interface YYAudioTool ()
//    //用来保存mp3文件
//    @property(nonatomic,strong)NSMutableDictionary *muscis;
//    @end
//    @implementation YYAudioTool
//    //构造方法
//    -(id)init
//    {
//        if (self=[super init]) {
//            //加载所需的音乐资源
//            //....
//            //        self.muscis=[NSMutableDictionary dictionary];
//            //        self.muscis[@"1.mp3"]=1mp3数据；
//            //        self.muscis[@"2.mp3"]=2mp3数据;
//        }
//        return self;
//    }
//    
//    //两个方法的调用
//    +(id)alloc
//    {
//        NSLog(@"alloc----");
//        return [super alloc];
//    }
//    
//    //控制内存分配,每次调用allocWithzone:方法，系统都会创建一块新的内存空间
//    +(id)allocWithZone:(struct _NSZone *)zone
//    {
//        NSLog(@"allocWithZone---");
//        return [super allocWithZone:zone];
//    }
//    
//    
//    
//    @end
//    在主控制器中，创建工具类对象：
//    //
//    //  YYViewController.m
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//#import "YYAudioTool.h"
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
//        YYAudioTool *tool1=[[YYAudioTool alloc]init];
//        YYAudioTool *tool2=[[YYAudioTool alloc]init];
//        YYAudioTool *tool3=[[YYAudioTool alloc]init];
//        YYAudioTool *tool4=[[YYAudioTool alloc]init];
//        NSLog(@"%p--%p--%p--%p",tool1,tool2,tool3,tool4);
//    }
//    
//    @end
//    说明：在alloc内部会调用更底层的方法allocWithZone方法分配内存空间，上面的代码创建了四个不同的对象。
//    
//    3.单例模式：设计思路
//    
//    （1）永远只分配一块内存来创建对象
//    
//    （2）提供一个类方法，返回内部唯一的一个变量
//    
//    （3）最好保证init方法也只初始化一次
//    
//    代码示例：
//    
//    创建一个音频工具类，继承子NSObject类。
//    
//    在该类中按照设计思路实现以下代码：
//    
//    YYAudioTool.m文件
//    //
//    //  YYAudioTool.m
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYAudioTool.h"
//    @interface YYAudioTool ()
//    //用来保存mp3文件
//    @property(nonatomic,strong)NSMutableDictionary *muscis;
//    @end
//    
//    @implementation YYAudioTool
//    //定义一份变量（整个程序运行过程中，只有一份）
//    static id _instace;
//    //单例模式：设计
//    //（1）永远只分配一块内存来创建对象
//    //（2）提供一个类方法，返回内部唯一的一个变量
//    //（3）最好保证init方法也只初始化一次
//    
//    //构造方法
//    -(id)init
//    {
//        //    __block id obj=nil;
//        static id obj=nil;
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            if ((obj=[super init]) != nil) {
//                //加载所需的音乐资源
//                //....
//                //        self.muscis=[NSMutableDictionary dictionary];
//                //        self.muscis[@"1.mp3"]=1mp3数据；
//                //        self.muscis[@"2.mp3"]=2mp3数据;
//            }
//        });
//        self=obj;
//        
//        return self;
//    }
//    
//    
//    //重写该方法，控制内存的分配，永远只分配一次存储空间
//    +(id)allocWithZone:(struct _NSZone *)zone
//    {
//        
//        //里面的代码只会执行一次
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _instace=[super allocWithZone:zone];
//        });
//        return _instace;
//    }
//    
//    //类方法
//    +(id)sharedAudioTool
//    {
//        //里面的代码永远都只执行一次
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _instace=[[self alloc]init];
//        });
//        return _instace;
//    }
//    
//    +(id)copyWithZone:(struct _NSZone *)zone
//    {
//        return _instace;
//    }
//    @end
//    
//    YYAudioTool.h文件
//    #import <Foundation/Foundation.h>
//    @interface YYAudioTool : NSObject
//    //提供一个类方法，返回内部唯一的一个变量
//    +(id)sharedAudioTool;
//    @end
//    
//    主控制器中创建对象:
//    //
//    //  YYViewController.m
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//#import "YYAudioTool.h"
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
//        //    YYAudioTool *tool1=[[YYAudioTool alloc]init];
//        //    YYAudioTool *tool2=[[YYAudioTool alloc]init];
//        YYAudioTool *tool1=[YYAudioTool sharedAudioTool];
//        YYAudioTool *tool2=[YYAudioTool sharedAudioTool];
//        YYAudioTool *tool3=[[YYAudioTool alloc]init];
//        YYAudioTool *tool4=[[YYAudioTool alloc]init];
//        NSLog(@"%p--%p--%p--%p",tool1,tool2,tool3,tool4);
//    }
//    
//    @end
//    
//    观察打印结果：
//    说明：整个程序中只创建一个对象实例。
//    
//    4.static补充：
//    
//    注意：static id instace=nil;和static id instace；instace=nil;的区别
//    
//    iOS开发多线程篇—单例模式（MRC）
//    
//    一、非ARC模式下的单例模式
//    
//    1.说明：把一个项目修改为非ARC的
//    2.MAC下单例模式代码示例：
//    
//    新建一个工具类，让该类继承自NSObject。
//    
//    YYAudioTool.m文件
//    //
//    //  YYAudioTool.m
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYAudioTool.h"
//    @interface YYAudioTool ()
//    //用来保存mp3文件
//    @property(nonatomic,strong)NSMutableDictionary *muscis;
//    @end
//    
//    @implementation YYAudioTool
//    //定义一份变量（整个程序运行过程中，只有一份）
//    static id _instace;
//    //单例模式：设计
//    //（1）永远只分配一块内存来创建对象
//    //（2）提供一个类方法，返回内部唯一的一个变量
//    //（3）最好保证init方法也只初始化一次
//    
//    //构造方法
//    -(id)init
//    {
//        //    __block id obj=nil;
//        static id obj=nil;
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            if ((obj=[super init]) != nil) {
//                
//            }
//        });
//        self=obj;
//        
//        return self;
//    }
//    
//    
//    //重写该方法，控制内存的分配，永远只分配一次存储空间
//    +(id)allocWithZone:(struct _NSZone *)zone
//    {
//        
//        //里面的代码只会执行一次
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _instace=[super allocWithZone:zone];
//        });
//        return _instace;
//    }
//    
//    //类方法
//    +(id)sharedAudioTool
//    {
//        //里面的代码永远都只执行一次
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _instace=[[self alloc]init];
//        });
//        return _instace;
//    }
//    
//    //重写release方法
//    //oneway :分布式对象
//    -(oneway void)release
//    {
//    }
//    
//    //不管调用哪个方法，返回的都是唯一的实例，所以这里self和instace是一样的
//    -(id)autorelease
//    {
//        return self;
//    }
//    
//    -(id)retain
//    {
//        return self;
//    }
//    
//    -(NSUInteger)retainCount
//    {
//        return 1;
//    }
//    
//    +(id)copyWithZone:(struct _NSZone *)zone
//    {
//        return _instace;
//    }
//    @end
//    YYAudioTool.h文件
//    //
//    //  YYAudioTool.h
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import <Foundation/Foundation.h>
//    
//    @interface YYAudioTool : NSObject
//    //提供一个类方法，返回内部唯一的一个变量
//    +(id)sharedAudioTool;
//    @end
//    主控制器中创建对象：
//    //
//    //  YYViewController.m
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYViewController.h"
//#import "YYAudioTool.h"
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
//        YYAudioTool *tool1=[YYAudioTool sharedAudioTool];
//        YYAudioTool *tool2=[YYAudioTool sharedAudioTool];
//        YYAudioTool *tool3=[YYAudioTool sharedAudioTool];
//        YYAudioTool *tool4=[[YYAudioTool alloc]init];
//        
//        NSLog(@"%p--%p--%p--%p",tool1,tool2,tool3,tool4);
//        
//        //对象创建只会，release对象会销毁，无法再创建新的对象（因为单例），所以还需要重写release方法
//        [tool1 release];
//        [tool2 release];
//        [tool3 release];
//        [tool4 release];
//    }
//    
//    @end
//    
//    打印结果：
//    
//    
//    
//    说明：整个程序过程中，只创建一个对象实例。
//    
//    
//    
//    二、把单例代码定义为一个带参数的宏
//    
//    1.新的困扰
//    
//    弊端：如果又创建一个新的类，是否又要把文件代码拷贝一份，所以这里可以考虑把固定的代码写成宏。
//    
//    由于项目中代码经常有移植的需要，要求项目中又有ARC的，又有非ARC的，应该怎么应用单例模式?
//    
//    不管项目是ARC的还是非ARC的，这个宏都有用。可以先判断编译器的环境，判断当前环境是否是ARC的。
//    
//    条件编译的使用：
//    2.使用条件编译，并把单例模式的代码定义为宏。
//    
//    新建一个.h头文件
//    
//    把代码定义为宏，头文件中的代码如下：
//    // ## : 连接字符串和参数
//#define singleton_h(name) + (instancetype)shared##name;
//    
//#if __has_feature(obj_arc)  //如果是ARC
//#define singleton_m(name) \
//static id _instance; \
//+ (id)allocWithZone:(struct _NSZone *)zone \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [super allocWithZone:zone]; \
//}); \
//return _instance; \
//} \
//\
//+ (instancetype)shared##name \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [[self alloc] init]; \
//}); \
//return _instance; \
//} \
//\
//+ (id)copyWithZone:(struct _NSZone *)zone \
//{ \
//return _instance; \
//}
//    
//#else //非ARC
//#define singleton_m(name) \
//static id _instance; \
//+ (id)allocWithZone:(struct _NSZone *)zone \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [super allocWithZone:zone]; \
//}); \
//return _instance; \
//} \
//\
//+ (instancetype)shared##name \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [[self alloc] init]; \
//}); \
//return _instance; \
//} \
//\
//- (oneway void)release \
//{ \
//\
//} \
//\
//- (id)autorelease \
//{ \
//return _instance; \
//} \
//\
//- (id)retain \
//{ \
//return _instance; \
//} \
//\
//- (NSUInteger)retainCount \
//{ \
//return 1; \
//} \
//\
//+ (id)copyWithZone:(struct _NSZone *)zone \
//{ \
//return _instance; \
//}
//#endif
//    在程序中的应用：
//    
//    控制器问价代码如下：
//#import "YYViewController.h"
//#import "YYAudioTool.h"
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
//        YYAudioTool *tool1=[YYAudioTool sharedAudioTool];
//        
//        //对象创建后，需要考虑
//        //    (1)alloc init
//        //    (2)release
//        //    (3)copy copy内部会调用另外一个方法copywithzone
//        //    (4)autorelease
//        //
//        YYAudioTool *tool2=[YYAudioTool sharedAudioTool];
//        YYAudioTool *tool3=[YYAudioTool sharedAudioTool];
//        NSLog(@"%p---%p---%p",tool1,tool2,tool3);
//        [tool2 release];
//        [tool3 release];
//        [tool1 release];
//        
//    }
//    
//    @end
//    工具类的头文件代码如下：
//    //
//    //  YYAudioTool.h
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import <Foundation/Foundation.h>
//#import "Singleton.h"
//    
//    @interface YYAudioTool : NSObject
//    ////提供一个类方法，返回内部唯一的一个变量
//    //+(id)sharedAudioTool;
//    singleton_h(AudioTool)
//    @end
//    工具类的实现部分代码如下：
//    //
//    //  YYAudioTool.m
//    //  06-单例模式1
//    //
//    //  Created by apple on 14-6-25.
//    //  Copyright (c) 2014年 itcase. All rights reserved.
//    //
//    
//#import "YYAudioTool.h"
//    @interface YYAudioTool ()
//    //用来保存mp3文件
//    @property(nonatomic,strong)NSMutableDictionary *muscis;
//    @end
//    
//    @implementation YYAudioTool
//    //定义一份变量（整个程序运行过程中，只有一份）
//    //static id  _instace;
//    
//    //构造方法
//    -(id)init
//    {
//        //    __block id obj=nil;
//        static id obj=nil;
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            if ((obj=[super init]) != nil) {
//                //........
//            }
//        });
//        self=obj;
//        return self;
//    }
//    
//    singleton_m(AudioTool)
//    @end
//    
//
//    
//    补充说明：如果把代码下载dispatch_once里面，那么它内部默认会进行加锁。
//    
//    
//    
//    三、补充
//    
//    问题：ARC和非ARC单例模式的区别？
//    
//    由于非ARC是进行手动内存管理，所以需要注意下面一个方法，在项目中通常使用宏。
//    
//    - (id)retain { return self; }
//    
//    - (NSUInteger)retainCount { return 1; }
//    
//    - (oneway void)release {}
//    
//    - (id)autorelease { return self; }
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
