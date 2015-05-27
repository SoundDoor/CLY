//
//  Dog.m
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)eat{
    weight+=1;
    NSLog(@"Dogeat   %f",weight);
}
-(void)run{
    weight-=1;
    NSLog(@"Dogrun %f",weight);
}
@end
