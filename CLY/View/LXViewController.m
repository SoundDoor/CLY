//
//  LXViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/5.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "LXViewController.h"
#import "YYimageCell.h"
#define YYCell @"cell"

@interface LXViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) UICollectionView *collectinView;
//200 112设置cell的格子的大小。其默认为向上滚动的，调整为水平滚动
@end
@implementation LXViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
//    （1）如果collectionCell是以xib的方式自定义的，那么在注册cell的时候，需要使用另外一种方式。
//    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
//    [self.collectinView registerNib:[UINib nibWithNibName:@"YYcell" bundle:nil] forCellWithReuseIdentifier:YYIDCell];
//    （2）在自定义xib的时候，使用collectionViewCell。并设置其标识为cell.
    
    self.collectinView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, 200, 112)];
    self.collectinView.dataSource=self;
    self.collectinView.delegate=self;
    [self.view addSubview:self.collectinView];
    
    [self.collectinView registerClass:[YYimageCell class] forCellWithReuseIdentifier:YYCell];
    
//    static NSString *ID=@"cell";//注册cell
//    [self.collectinView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}
#pragma mark- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;//一共多少组，默认为1组
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 16;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YYimageCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:YYCell forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    NSLog(@"%p,%d",cell,indexPath.item);
    cell.icon=[NSString stringWithFormat:@"minion_%02d",indexPath.item+1];
    return cell;
//    
//    static NSString *ID=@"cell";
//    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    cell.backgroundColor=[UIColor redColor];
//    return cell;
}

//打印查看有没有实现cell的循环利用。可以看出，整个程序中只创建了两个cell。
@end