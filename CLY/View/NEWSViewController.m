//
//  NEWSViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/5.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "NEWSViewController.h"
//#import "MJExtension.h"
#import "YYnews.h"
#import "YYcell.h"

#define YYIDCell @"cell"

@interface NEWSViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) UICollectionView *collectinView;
@property(nonatomic,strong)NSArray *news;
@end

@implementation NEWSViewController

#pragma mark-懒加载
-(NSArray *)news
{
    if (_news==nil) {
//        _news=[YYnews objectArrayWithFilename:@"newses.plist"];
        //扩展类里面的工具方法
    }
    return _news;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //注册cell
    //    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
    [self.collectinView registerNib:[UINib nibWithNibName:@"YYcell" bundle:nil] forCellWithReuseIdentifier:YYIDCell];
    
}

#pragma mark- UICollectionViewDataSource
//一共多少组，默认为1组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.news.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YYcell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:YYIDCell forIndexPath:indexPath];
    cell.news=self.news[indexPath.item];
    return cell;
}

#pragma mark-UICollectionViewDelegate
@end


//一、简单说明
//
//　　之前的程序还存在一个问题，那就是不能循环展示，因为plist文件中只有五个数组，因此第一个和最后一个之后就没有了，下面介绍处理这种循环展示问题的小技巧。
//
//　　
//
//方法一：使用一个for循环，循环200次，创建200*=1000个模型，且默认程序启动后处在第100组的位置，向前有500个模型，向后也有500个模型，产生一种循环展示的假象。
//
//　　代码如下：
////
////  YYViewController.m
////  07-无限滚动（循环利用）
////
////  Created by apple on 14-8-3.
////  Copyright (c) 2014年 yangyong. All rights reserved.
////
//
//#import "YYViewController.h"
//#import "MJExtension.h"
//#import "YYnews.h"
//#import "YYcell.h"
//
//#define YYIDCell @"cell"
//
//@interface YYViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
//@property (weak, nonatomic) IBOutlet UICollectionView *collectinView;
//@property(nonatomic,strong)NSMutableArray *news;
//@end
//
//@implementation YYViewController
//
//#pragma mark-懒加载
////-(NSArray *)news
////{
////    if (_news==nil) {
////        _news=[YYnews objectArrayWithFilename:@"newses.plist"];
////    }
////    return _news;
////}
//-(NSMutableArray *)news
//{
//    if (_news==nil) {
//        _news=[NSMutableArray array];
//        for (int i=0; i<200; i++) {
//            NSArray *array=[YYnews objectArrayWithFilename:@"newses.plist"];
//            [_news addObjectsFromArray:array];
//        }
//    }
//    return _news;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //注册cell
//    //    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
//    [self.collectinView registerNib:[UINib nibWithNibName:@"YYcell" bundle:nil] forCellWithReuseIdentifier:YYIDCell];
//    
//    //默认处于第0组的第500个模型的左边
//    [self.collectinView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:500 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    
//}
//
//#pragma mark- UICollectionViewDataSource
////一共多少组，默认为1组
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.news.count;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    YYcell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:YYIDCell forIndexPath:indexPath];
//    cell.news=self.news[indexPath.item];
//    NSLog(@"%p,%d",cell,indexPath.item);
//    return cell;
//}
//
//#pragma mark-UICollectionViewDelegate
//@end
//打印查看所处的索引（全程依然只创建了两个cell）：
//
//　　
//
//说明：
//
//　　[self.collectinView scrollToItemAtIndexPath:<#(NSIndexPath *)#> atScrollPosition:<#(UICollectionViewScrollPosition)#> animated:<#(BOOL)#>]
//
//　//默认处于第0组的第500个模型的左边
//
//方法二：设置其有100组，那么一共有100*5=500个模型。且设置默认处于第50组的索引为0处。
//
//　　代码如下：
//
//  YYViewController.m
//  07-无限滚动（循环利用）
//
//  Created by apple on 14-8-3.
//  Copyright (c) 2014年 yangyong. All rights reserved.
//
//
//#import "YYViewController.h"
//#import "MJExtension.h"
//#import "YYnews.h"
//#import "YYcell.h"
//
//#define YYIDCell @"cell"
//
//@interface YYViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
//@property (weak, nonatomic) IBOutlet UICollectionView *collectinView;
//@property(nonatomic,strong)NSArray *news;
//@end
//
//@implementation YYViewController
//
//#pragma mark-懒加载
//-(NSArray *)news
//{
//    if (_news==nil) {
//        _news=[YYnews objectArrayWithFilename:@"newses.plist"];
//    }
//    return _news;
//}
//-(NSMutableArray *)news
//{
//    if (_news==nil) {
//        _news=[NSMutableArray array];
//        for (int i=0; i<200; i++) {
//            NSArray *array=[YYnews objectArrayWithFilename:@"newses.plist"];
//            [_news addObjectsFromArray:array];
//        }
//    }
//    return _news;
//}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //注册cell
//    //    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
//    [self.collectinView registerNib:[UINib nibWithNibName:@"YYcell" bundle:nil] forCellWithReuseIdentifier:YYIDCell];
//    
//    //默认处于第0组的第500个模型的左边
//    //    [self.collectinView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:500 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    
//    [self.collectinView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    
//}
//
//#pragma mark- UICollectionViewDataSource
////一共多少组，默认为1组
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 100;
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.news.count;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    YYcell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:YYIDCell forIndexPath:indexPath];
//    cell.news=self.news[indexPath.item];
//    NSLog(@"%p,%d",cell,indexPath.item);
//    return cell;
//}
//
//#pragma mark-UICollectionViewDelegate
//@end
//注意：上面的两种方法都创建了大量的无用的模型，不太可取。且在实际开发中，建议模型的总数不要太大，因为在其内部需要遍历计算所有控件的frame。
//
//　　如果模型数量太大，会占用资源。
//
//改进建议：可以监听手指在上面的滚动，当停止滚动的时候，又重新设置初始的中间位置。
//OS开发UI篇—无限轮播（功能完善）
//
//一、自动滚动
//
//添加并设置一个定时器，每个2.0秒，就跳转到下一条。
//
//　　获取当前正在展示的位置。
//[self addNSTimer];
//}
//
//-(void)addNSTimer
//{
//    //    NSTimer timerWithTimeInterval:<#(NSTimeInterval)#> target:<#(id)#> selector:<#(SEL)#> userInfo:<#(id)#> repeats:<#(BOOL)#>
//    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//}
//-(void)nextPage
//{
//    NSLog(@"%@",[self.collectinView indexPathsForVisibleItems]);
//    //    NSIndexPath *currentIndexPath=[[self.collectinView indexPathsForVisibleItems]lastObject];
//}
//实现步骤：
//
//（1）添加并设置定时器
//
//（2）设置定时器的调用方法
//
//　　1）获取当前正在展示的位置
//
//　　2）计算出下一个需要展示的位置
//
//　　3）通过动画滚动到下一个位置
//
//　　注意点：需要进行判断。
//
//实现代码：
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //注册cell
//    //    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
//    [self.collectinView registerNib:[UINib nibWithNibName:@"YYcell" bundle:nil] forCellWithReuseIdentifier:YYIDCell];
//    
//    
//    [self.collectinView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    [self addNSTimer];
//}
//
//-(void)addNSTimer
//{
//    //    NSTimer timerWithTimeInterval:<#(NSTimeInterval)#> target:<#(id)#> selector:<#(SEL)#> userInfo:<#(id)#> repeats:<#(BOOL)#>
//    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//    //添加到runloop中
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//}
//-(void)nextPage
//{
//    //    NSLog(@"%@",[self.collectinView indexPathsForVisibleItems]);
//    //1）获取当前正在展示的位置
//    NSIndexPath *currentIndexPath=[[self.collectinView indexPathsForVisibleItems]lastObject];
//    
//    　  //2）计算出下一个需要展示的位置
//    NSInteger nextItem=currentIndexPath.item+1;
//    NSInteger nextSection=currentIndexPath.section;
//    if (nextItem==self.news.count) {
//        nextItem=0;
//        nextSection++;
//    }
//    NSIndexPath *nextIndexPath=[NSIndexPath indexPathForItem:nextItem inSection:nextSection];
//    
//    　　//3）通过动画滚动到下一个位置
//    [self.collectinView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//}
//定时器的说明：
//
//　　当用户在处理其他事情的时候，定时器会停止工作。应该把定时器添加到runloop中，告诉系统在处理其他事情的时候分一部分空间给它。
//
//
//
//二、设置页码
//
//　　在storyboard中添加一个页码控件。
//
//实现代码：
//#pragma mark-懒加载
//-(NSArray *)news
//{
//    if (_news==nil) {
//        _news=[YYnews objectArrayWithFilename:@"newses.plist"];
//        self.pageControl.numberOfPages=self.news.count;
//    }
//    return _news;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //注册cell
//    //    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
//    [self.collectinView registerNib:[UINib nibWithNibName:@"YYcell" bundle:nil] forCellWithReuseIdentifier:YYIDCell];
//    
//    
//    [self.collectinView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    [self addNSTimer];
//}
//
//-(void)addNSTimer
//{
//    //    NSTimer timerWithTimeInterval:<#(NSTimeInterval)#> target:<#(id)#> selector:<#(SEL)#> userInfo:<#(id)#> repeats:<#(BOOL)#>
//    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//    //添加到runloop中
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//}
//-(void)nextPage
//{
//    //    NSLog(@"%@",[self.collectinView indexPathsForVisibleItems]);
//    //1）获取当前正在展示的位置
//    NSIndexPath *currentIndexPath=[[self.collectinView indexPathsForVisibleItems]lastObject];
//    
//    　  //2）计算出下一个需要展示的位置
//    NSInteger nextItem=currentIndexPath.item+1;
//    NSInteger nextSection=currentIndexPath.section;
//    if (nextItem==self.news.count) {
//        nextItem=0;
//        nextSection++;
//    }
//    NSIndexPath *nextIndexPath=[NSIndexPath indexPathForItem:nextItem inSection:nextSection];
//    
//    　　//3）通过动画滚动到下一个位置
//    [self.collectinView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    
//    //4)设置页码
//    self.pageControl.currentPage=nextItem;
//}
//三、完善
//
//说明：监听collectionView的滚动，当手动触摸collectionView，尝试拖拽的时候，把定时器停掉，当手指移开的时候，重启定时器。
//
//完整的实现代码：
////
////  YYViewController.m
////  07-无限滚动（循环利用）
////
////  Created by apple on 14-8-3.
////  Copyright (c) 2014年 yangyong. All rights reserved.
////
//
//#import "YYViewController.h"
//#import "MJExtension.h"
//#import "YYnews.h"
//#import "YYcell.h"
//
//#define YYIDCell @"cell"
////注意：这里需要考虑用户的手动拖拽
//#define YYMaxSections 100
//@interface YYViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
//@property (weak, nonatomic) IBOutlet UICollectionView *collectinView;
//@property(nonatomic,strong)NSArray *news;
//@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
//@property(nonatomic,strong)NSTimer *timer;
//
//@end
//
//@implementation YYViewController
//
//#pragma mark-懒加载
//-(NSArray *)news
//{
//    if (_news==nil) {
//        _news=[YYnews objectArrayWithFilename:@"newses.plist"];
//        self.pageControl.numberOfPages=self.news.count;
//    }
//    return _news;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //注册cell
//    //    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
//    [self.collectinView registerNib:[UINib nibWithNibName:@"YYcell" bundle:nil] forCellWithReuseIdentifier:YYIDCell];
//    
//    
//    [self.collectinView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    [self addNSTimer];
//}
//
////添加定时器
//-(void)addNSTimer
//{
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//    //添加到runloop中
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//    self.timer=timer;
//}
//
////删除定时器
//-(void)removeNSTimer
//{
//    [self.timer invalidate];
//    self.timer=nil;
//}
//
////自动滚动
//-(void)nextPage
//{
//    //1获取当前正在展示的位置
//    NSIndexPath *currentIndexPath=[[self.collectinView indexPathsForVisibleItems]lastObject];
//    
//    //马上显示回最中间那组的数据
//    NSIndexPath *currentIndexPathRest=[NSIndexPath indexPathForItem:currentIndexPath.item inSection:YYMaxSections/2];
//    [self.collectinView scrollToItemAtIndexPath:currentIndexPathRest atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//    
//    　  //2计算出下一个需要展示的位置
//    NSInteger nextItem=currentIndexPathRest.item+1;
//    NSInteger nextSection=currentIndexPathRest.section;
//    if (nextItem==self.news.count) {
//        nextItem=0;
//        nextSection++;
//    }
//    NSIndexPath *nextIndexPath=[NSIndexPath indexPathForItem:nextItem inSection:nextSection];
//    
//    　　//3通过动画滚动到下一个位置
//    [self.collectinView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    
//    //    //4)设置页码
//    //    self.pageControl.currentPage=nextItem;
//}
//
//#pragma mark- UICollectionViewDataSource
////一共多少组，默认为1组
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return YYMaxSections;
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.news.count;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    YYcell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:YYIDCell forIndexPath:indexPath];
//    cell.news=self.news[indexPath.item];
//    NSLog(@"%p,%d",cell,indexPath.item);
//    return cell;
//}
//
//#pragma mark-UICollectionViewDelegate
////当用户开始拖拽的时候就调用
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    [self removeNSTimer];
//}
////当用户停止拖拽的时候调用
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    [self addNSTimer];
//}
////设置页码
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    int page=(int)(scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.news.count;
//    self.pageControl.currentPage=page;
//}
//@end
//补充说明：
//
//　　实现瀑布流最理想的做法是继承UIScrollView，不建议使用多个UITableView的方式实现（这种方式无法实现cell的循环利用，且禁止了cell的滚动时间后，整体的tableView需要随着滚动会出现空白）。
//
//　　也可以使用collectionView来实现，但使用这种方法需要自定义collectionView的布局（流水布局）