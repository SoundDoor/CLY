//
//  LINEViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "LINEViewController.h"
#import "LineView.h"
#import "YYview.h"
@interface LINEViewController ()
@property (strong, nonatomic) YYview *circleView;
- (void)valueChange:(UISlider *)sender;
@end

@implementation LINEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
//    LineView *line=[[LineView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
//    [self.view addSubview:line];
    
    _circleView=[[YYview alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [self.view addSubview:_circleView];
}
- (void)valueChange:(UISlider *)sender {
    //当值改变的时候，把值传递给view,改变圆的半径
    NSLog(@"%f",sender.value);
    //把sender的值传递给自定义view，设置圆的半径
    self.circleView.radius=sender.value;
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
