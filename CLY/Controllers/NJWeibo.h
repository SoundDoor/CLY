//
//  NJWeibo.h
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJWeibo : NSObject

@property (nonatomic, copy) NSString *text; // 内容
@property (nonatomic, copy) NSString *icon; // 头像
@property (nonatomic, copy) NSString *name; // 昵称
@property (nonatomic, assign) BOOL vip;


- (id)initWithDict:(BOOL)a b:(NSString *)b c:(NSString *)c d:(NSString *)d;

@end