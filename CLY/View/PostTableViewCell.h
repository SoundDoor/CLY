// TweetTableViewCell.h
//  CLY
//
//  Created by chenliangyu on 14/12/9.
//  Copyright (c) 2014年 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Post;

@interface PostTableViewCell : UITableViewCell


@property(nonatomic,strong)UILabel* deviceNamelabel;

@property (nonatomic, strong) Post *post;

+ (CGFloat)heightForCellWithPost:(Post *)post;

@end
