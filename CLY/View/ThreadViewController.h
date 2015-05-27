//
//  ThreadViewController.h
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreadViewController : UIViewController

//剩余票数
@property(nonatomic,assign) int leftTicketsCount;
@property(nonatomic,strong)NSThread *thread1;
@property(nonatomic,strong)NSThread *thread2;
@property(nonatomic,strong)NSThread *thread3;

@property (strong, nonatomic) UIImageView *iconView;
@end
