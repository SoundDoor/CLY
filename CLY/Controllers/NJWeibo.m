//
//  NJWeibo.m
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "NJWeibo.h"

@implementation NJWeibo


-(id)initWithDict:(BOOL)a b:(NSString *)b c:(NSString *)c d:(NSString *)d
{
    if (self=[super init]) {
        _vip=a;
        _text=b;
        _icon=c;
        _name=d;
    }
    return self;
}
//[self setValuesForKeysWithDictionary:dict];

@end
