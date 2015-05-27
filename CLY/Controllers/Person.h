//
//  Person.h
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "asd.h"
@interface Person : NSObject<asd>{
    @public
    int _age;
    int _weight;
}
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign) int age;

-(void)walk;
@end
