//
//  DownloadOperation.m
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "DownloadOperation.h"

@implementation DownloadOperation
@synthesize delegate=_delegate;
@synthesize imageUrl=_imageUrl;

//// 初始化
-(id)initWithUrl:(NSString *)url delegate:(id<DownloadOperationDelegate>)delegate{
    if (self=[super init]) {
        self.imageUrl=url;
        self.delegate=delegate;
    }
    return self;
}
// 释放内存
//-(void)dealloc{
//    [super dealloc];
//    [_imageUrl release];
//}
-(void)main{
    // 新建一个自动释放池，如果是异步执行操作，那么将无法访问到主线程的自动释放池
    @autoreleasepool {
        //main方法的开头就先判断operation有没有被取消。如果被取消了，那就没有必要往下执行了
        if (self.isCancelled) return;
        // 获取图片数据
        NSURL *url = [NSURL URLWithString:self.imageUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        if (self.isCancelled){
            url=nil;
            imageData=nil;
            return;
        }
        // 初始化图片
        UIImage *image = [UIImage imageWithData:imageData];
        //经过第8行下载图片后，在第10行也需要判断操作有没有被取消
        //总之，执行了一段比较耗时的操作之后，都需要判断操作有没有被取消
        if (self.isCancelled) {
            image=nil;
            return;
        }
        ///图片下载完毕后将图片数据传递给了代理(delegate)对象
        if ([self.delegate respondsToSelector:@selector(downloadFinishWithImage:)]){
            // 把图片数据传回到主线程
            [(NSObject *)self.delegate performSelectorOnMainThread:@selector(downloadFinishWithImage:) withObject:image waitUntilDone:NO];
        }
    }
    //如果这个DownloadOperation是在异步线程中执行操作，也就是说main方法在异步线程调用，那么将无法访问主线程的自动释放池，所以创建了一个属于当前线程的自动释放池
    
    /*
     2.正确响应取消事件
     * 默认情况下，一个NSOperation开始执行之后，会一直执行任务到结束，就比如上面的DownloadOperation，默认会执行完main方法中的所有代码
     * NSOperation提供了一个cancel方法，可以取消当前的操作。
     * 如果是自定义NSOperation的话，需要手动处理这个取消事件。比如，一旦调用了cancel方法，应该马上终止main方法的执行，并及时回收一些资源
     * 处理取消事件的具体做法是：在main方法中定期地调用isCancelled方法检测操作是否已经被取消，也就是说是否调用了cancel方法，如果返回YES，表示已取消，则立即让main方法返回。
     * 以下地方可能需要调用isCancelled方法:
     在执行任何实际的工作之前，也就是在main方法的开头。因为取消可能发生在任何时候，甚至在operation执行之前。
     执行了一段耗时的操作之后也需要检测操作是否已经被取消
     */
}
@end