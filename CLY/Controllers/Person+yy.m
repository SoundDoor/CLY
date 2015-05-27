//
//  Person+yy.m
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "Person+yy.h"

@implementation Person (yy)

-(void)study{
    NSLog(@"add function study");
}
+(void)load{
    /*
    1.当程序启动时，就会加载项目中所有的类和分类，而且加载后会调用每个类和分类的+load方法，只会调用一次；
    2.当第一次使用某个类时，就会调用当前类的+initialize方法；
    3.先加载父类，再加载子类（先调用父类的+load方法，再调用子类的+load方法，最后调用分类的+load方法），先初始化父类，再初始化子类（先调用父类的+initialize方法，再调用子类的+initialize方法）。
    4.注意：在初始化的时候，如果在分类中重写了+initialize方法，则会覆盖掉父类的。
    5.重写+initialize方法可以监听类的使用情况。
     */
}
+(void)initialize{
    /*
     1.当程序启动时，就会加载项目中所有的类和分类，而且加载后会调用每个类和分类的+load方法，只会调用一次；
     2.当第一次使用某个类时，就会调用当前类的+initialize方法；
     3.先加载父类，再加载子类（先调用父类的+load方法，再调用子类的+load方法，最后调用分类的+load方法），先初始化父类，再初始化子类（先调用父类的+initialize方法，再调用子类的+initialize方法）。
     4.注意：在初始化的时候，如果在分类中重写了+initialize方法，则会覆盖掉父类的。
     5.重写+initialize方法可以监听类的使用情况。
     */
}
@end
