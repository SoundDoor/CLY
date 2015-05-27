//
//  NJWeiboCell.h
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NJWeibo;
@interface NJWeiboCell : UITableViewCell

@property (nonatomic, strong) NJWeibo *weibo;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end