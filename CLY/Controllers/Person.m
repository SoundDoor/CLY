//
//  Person.m
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)walk{
    NSLog(@"%d age %d kg  run",self->_age,_weight);
}
-(void)print{
//    4.定义变量时遵守协议的限制
//    类名<协议名称> *变量名    NSObject<.Myprotocol> *obj;
//    Id  <协议名称>  变量名   id  <.Myprotocol> obj1;
//    
//    5.Property中声明的属性也可以做遵守协议的限制
//    @property (nonatomic ,strong ) 类名<协议名称> *属性名；
//    @property (nonatomic ,strong ) id<协议名称>  属性名；
}
-(void)eat{
    
}
@end
