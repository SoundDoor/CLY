//
//  YYimageCell.m
//  CLY
//
//  Created by chenliangyu on 15/2/5.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "YYimageCell.h"
@interface YYimageCell ()
@property(nonatomic,strong)UIImageView *imageView;
@end
@implementation YYimageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView=[[UIImageView alloc]init];
        [self addSubview:imageView];
        self.imageView=imageView;
    }
    return self;
}

-(void)setIcon:(NSString *)icon
{
    _icon=[icon copy];
    self.imageView.image=[UIImage imageNamed:icon];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame=self.bounds;
}

@end