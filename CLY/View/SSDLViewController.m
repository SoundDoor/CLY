//
//  SSDLViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "SSDLViewController.h"
@interface SSDLViewController ()<UIGestureRecognizerDelegate>

@end
@implementation SSDLViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self pinchTest];
    [self gestureTest];
}
-(void)pinchTest{
    //缩放
    UIPinchGestureRecognizer *pinch=[[UIPinchGestureRecognizer alloc]init];
    [self.view addGestureRecognizer:pinch];
    [pinch addTarget:self action:@selector(pinchView:)];
    //设置代理
    pinch.delegate=self;
}
-(void)pinchView:( UIPinchGestureRecognizer* )pinch{
    //缩放的比例    pinch.scale;
    NSLog(@"缩放：%f",pinch.scale);
    //对图片进行缩放
    //    self.iconView.transform=CGAffineTransformMakeScale(pinch.scale,pinch.scale);
    //在已有的基础上对图片进行缩放
    self.view.transform=CGAffineTransformScale(self.view.transform, pinch.scale, pinch.scale);
    //清零
    pinch.scale=1.0;
}
-(void)gestureTest{
    //旋转
    //创建手势识别器（旋转）
    UIRotationGestureRecognizer *gesture=[[UIRotationGestureRecognizer alloc]init];
    //添加手势识别器
    [self.view addGestureRecognizer:gesture];
    //监听
    [gesture addTarget:self action:@selector(gestureView:)];
    
    //设置代理
    gesture.delegate=self;
}
-(void)gestureView:(UIRotationGestureRecognizer*)gesture{
    
    //旋转的弧度：gesture.rotation
    NSLog(@"旋转事件，旋转的弧度为:%1f",gesture.rotation);
    
    //让图片跟随手指一起旋转
    //每次从最初的位置开始
    //    self.iconView.transform=CGAffineTransformMakeRotation(gesture.rotation);
    
    //在传入的transform的基础上旋转
    //在之前的基础上，让图片跟随一起旋转（去掉自动布局）
    //注意问题：以风火轮的速度旋转
    self.view.transform=CGAffineTransformRotate(self.view.transform, gesture.rotation);
    //将旋转的弧度清零
    //（注意不是将图片旋转的弧度清零，而是将当前手指旋转的弧度清零）
    gesture.rotation=0;
}

//实现代理方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    //默认为NO,这里设置为YES
    return YES;
}
@end