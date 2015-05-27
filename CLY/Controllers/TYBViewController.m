//
//  TYBViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "TYBViewController.h"
//#import "TYBView.m"
#import "UIImage+YYcaptureView.h"
@interface TYBViewController ()
{
//    TYBView *customView;
    UIView *customView;
}
@end

@implementation TYBViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    customView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [self.view addSubview:customView];
}
//调用清理方法
- (void)clearOnClick:(UIButton *)sender {
//    [customView clearView];
}
//调用回退方法
- (void)backOnClick:(UIButton *)sender {
//    [customView backView];
}

- (void)saveBtnOnClick:(UIButton *)sender {
    //调用分类中的方法，获取图片
    UIImage *newImage = [UIImage YYcaptureImageWithView:customView];
    //将图片保存到手机的相册中去
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//处理图片的保存事件
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"涂鸦保存失败，请检查权限");
    }else{
        NSLog(@"保存成功");
    }
    
}
@end
