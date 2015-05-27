//
//  Student.h
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
//定义枚举类型 学生的性别
typedef enum{
    SexMan,
    SexWoman
}Sex;

//定义结构体生日
typedef struct{
    int year;
    int month;
    int day;
}Date;

//定义枚举类型 学生喜欢的色彩
typedef enum{
    ColorBlack,
    ColorRed,
    ColorGreen
}Color;

@interface Student : NSObject{
    @public
    Sex sex;
    Date birthday;
    int weight;
    Color favColor;
    Dog *dog;
    NSString *name;
}
-(void)eat;
-(void)run;
-(void)print;
-(void)eatDog;
-(void)runDog;
@end
