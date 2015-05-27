//
//  JTViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "JTViewController.h"
@interface JTViewController ()
@end

@implementation JTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"string" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor blueColor];
    [button addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)BtnClick:(UIButton *)sender {
    //延迟两秒保存
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIGraphicsBeginImageContext(self.view.frame.size);//获取图形上下文
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];//将view绘制到图形上下文中
        //将截屏保存到相册
        UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
        UIImageWriteToSavedPhotosAlbum(newImage,self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    });
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        NSLog(@"保存失败，请检查是否拥有相关的权限");
    }else{
        NSLog(@"保存成功");
    }
}

////3.从上下文中取出绘制好的图片
//-(void)s{
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    NSData *data = UIImagePNGRepresentation(newImage);
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"abc.png"];
//    NSLog(@"%@", path);
//    [data writeToFile:path atomically:YES];
//}

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