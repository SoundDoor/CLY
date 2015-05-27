//
//  Student.m
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)eat{
    weight+=1;
    NSLog(@"eat   %d",weight);
}
-(void)run{
    weight-=1;
    NSLog(@"run %d",weight);
}
-(void)print{
    NSLog(@"%d %d  %d-%d-%d  %@",sex,favColor,birthday.year,birthday.month,birthday.day,name);
}
-(void)eatDog{
    [dog eat];
}
-(void)runDog{
    [dog run];
}
@end
