//
//  ThreeViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController
/*
 利用上面的这种特性来做一个信纸的效果。
 默认的view上没有分割线，要在view上加上分割线有两种方式：
 （1）让美工做一张专门用来做背景的图片，把图片设置为背景。缺点：信的长度不确定，所以背景图片的长度也难以确定。
 （2）通过一张小的图片来创建一个颜色，平铺实现背景效果。
 
 第一步：生成一张以后用以平铺的小图片。
 画矩形。
 画线条。
 第二步：从上下文中取出图片设置为背景。黑乎乎一片？（其他地方时透明的，控制器的颜色，如果不设置那么默认为黑色的）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.生成一张以后用于平铺的小图片
    CGSize size = CGSizeMake(self.view.frame.size.width, 35);
    UIGraphicsBeginImageContextWithOptions(size , NO, 0);
    
    // 2.画矩形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 35;
    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    
    // 3.画线条
    
    CGFloat lineWidth = 2;
    CGFloat lineY = height - lineWidth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, 320, lineY);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);
    
    
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIColor *color=[UIColor colorWithPatternImage:image];
    self.view.backgroundColor=color;
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
////
////  YYViewController.m
////  01-信纸条纹实现简陋的电子阅读
////
////  Created by 孔医己 on 14-6-11.
////  Copyright (c) 2014年 itcast. All rights reserved.
////
//
//#import "YYViewController.h"
//
//@interface YYViewController ()
//
//@property (weak, nonatomic) IBOutlet UITextView *textview;
//- (IBAction)perBtnClick:(UIButton *)sender;
//- (IBAction)nextBtnClick:(UIButton *)sender;
//@property(nonatomic,assign)int index;
//@end
//
//@implementation YYViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    
//    // 1.生成一张以后用于平铺的小图片
//    CGSize size = CGSizeMake(self.view.frame.size.width, 26);
//    UIGraphicsBeginImageContextWithOptions(size , NO, 0);
//    
//    // 2.画矩形
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGFloat height = 26;
//    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
//    [[UIColor brownColor] set];
//    CGContextFillPath(ctx);
//    
//    // 3.画线条
//    
//    CGFloat lineWidth = 2;
//    CGFloat lineY = height - lineWidth;
//    CGFloat lineX = 0;
//    CGContextMoveToPoint(ctx, lineX, lineY);
//    CGContextAddLineToPoint(ctx, 320, lineY);
//    [[UIColor blackColor] set];
//    CGContextStrokePath(ctx);
//    
//    
//    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
//    UIColor *color=[UIColor colorWithPatternImage:image];
//    //self.view.backgroundColor=color;
//    self.textview.backgroundColor=color;
//}
//
//- (IBAction)perBtnClick:(UIButton *)sender {
//    self.index--;
//    self.textview.text=[NSString stringWithFormat:@"第%d页",self.index];
//    CATransition *ca = [[CATransition alloc] init];
//    ca.type = @"pageCurl";
//    
//    [self.textview.layer addAnimation:ca forKey:nil];
//    
//}
//
//- (IBAction)nextBtnClick:(UIButton *)sender {
//    self.index++;
//    self.textview.text=[NSString stringWithFormat:@"第%d页",self.index];
//    CATransition *ca = [[CATransition alloc] init];
//    ca.type = @"pageCurl";
//    
//    [self.textview.layer addAnimation:ca forKey:nil];
//}
//@end