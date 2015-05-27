//
//  YYcell.m
//  CLY
//
//  Created by chenliangyu on 15/2/5.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "YYcell.h"
#import "YYnews.h"

@interface YYcell ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation YYcell
-(void)setNews:(YYnews *)news
{
    _news=news;
    self.label.text=news.title;
    self.imageView.image=[UIImage imageNamed:news.icon];
}

@end