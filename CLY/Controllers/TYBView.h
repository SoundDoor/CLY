//
//  TYBView.h
//  CLY
//
//  Created by chenliangyu on 15/2/3.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYBView : UIView
//私有扩展
//用来存储所有的路径信息
@property(nonatomic,strong)NSMutableArray *paths;
-(void)clearView;
-(void)backView;
@end