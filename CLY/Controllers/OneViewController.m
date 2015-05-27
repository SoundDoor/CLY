//
//  OneViewController.m
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "OneViewController.h"
#import "NJWeibo.h"
#import "NJWeiboCell.h"

@interface OneViewController ()
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation OneViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
}

#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusFrames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NJWeiboCell *cell = [NJWeiboCell cellWithTableView:tableView];
    // 3.设置数据
    cell.weibo=self.statusFrames[indexPath.row];
    // 4.返回
    return cell;
}
#pragma mark - 懒加载
- (NSArray *)statusFrames{
    if (_statusFrames == nil) {
        NJWeibo *njw=[[NJWeibo alloc]initWithDict:YES b:@"内容" c:@"a.png" d:@"昵称"];
        NJWeibo *njww=[[NJWeibo alloc]initWithDict:YES b:@"内容" c:@"a.png" d:@"昵asdasdfsaffsa称"];
        NJWeibo *njwq=[[NJWeibo alloc]initWithDict:YES b:@"内容" c:@"a.png" d:@"昵adsasffsaasf称"];
        NSArray *dictArray = [NSArray arrayWithObjects:njw,njwq,njww, nil];
        
        self.statusFrames = [dictArray copy];
        }
    return _statusFrames;
}
#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (BOOL) prefersStatusBarHidden{
    return YES;
}
@end