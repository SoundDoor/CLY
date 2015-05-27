// Post.m
//  CLY
//
//  Created by chenliangyu on 14/12/9.
//  Copyright (c) 2014年 ioschen. All rights reserved.
//

#import "Post.h"
#import "AFHTTPSessionManager.h"
@implementation Post

-(instancetype)init{
    if (self=[super init]) {
        _age=20;
        sss=@"safd";
        NSLog(@"init");
        //int ages=12;
        //NSLog(@"%i",ages);
    }
    return self;
}

//NSLog函数一旦发现用%@输出某个OC对象时，就会调用这个对象的description方法(这个方法返回值是NSString类型，是OC中的字符串类型)，并且将description方法返回的字符串代替%@的位置进行输出
//description方法的默认实现是返回这样的格式：<类名: 对象的内存地址>，因此上面代码的输出结果为：
//%@只能用于输出OC对象，不能输出结构体等其他类型

- (NSString *)description {
    return [NSString stringWithFormat:@"age=%i", _age];
}
//你可以先记住一个规则一般情况下 静态方法返回的对象都不用手动释放。

//千万不要在description方法中同时使用%@和self
//下面的写法是错误的
/*
- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self];
}
 */
//第2行同时使用了%@和self，代表要调用self的description方法，因此最终会导致程序陷入死循环，循环调用description方法






//- (id)initWithAge:(int)age {
//    if ( self = [super init] ) {
//        _age = age;
//    }
//    return self;
//}
//- (id)initWithAge:(int)age {
//    self = [super init];
//    //if (self != nil)   if(self) 跟 if(self!=nil) 是等价的
//    if (self)
//    {
//        _age = age;
//    }
//    return self;
//}


//-(void)setAge:(int)age{
//    _age=age;
//}
//-(int)age{
//    return _age;
//}



- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    NSLog(@"initWithAttributes");
    self.postID = (NSUInteger)[[attributes valueForKeyPath:@"equ_id"] integerValue];
    self.text = [attributes valueForKeyPath:@"equipmentName"];
    self.roomSelect = [attributes valueForKeyPath:@"roomSelect"];
    
    return self;
}

#pragma mark -

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block
{
    AFHTTPSessionManager *manager=[[AFHTTPSessionManager alloc]init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
//    [parameters setObject:@"m" forKey:@"Equipments"];
//    [parameters setObject:@"a" forKey:@"EquipmentsUpdate"];
    [parameters setObject:@"user_id" forKey:@"1305151013"];
    [parameters setObject:@"equ_id" forKey:@"634"];
    [parameters setObject:@"equipmentName" forKey:@"纽扣"];
    [parameters setObject:@"equipmentType" forKey:@"DYD"];
    [parameters setObject:@"roomName" forKey:@"600"];
    [parameters setObject:@"roomSelect" forKey:@"DYD"];
    [parameters setObject:@"equipmentAddress" forKey:@"DYD"];
    
        
    //NSDictionary *parameters = @{@"user_id":indexDyd.moveUserID,@"equ_id":indexDyd.moveEquID,@"equipmentName":indexDyd.moveName,@"equipmentType":indexDyd.moveType,@"roomName":indexDyd.moveImage,@"roomSelect":@"DYD",@"equipmentAddress":indexDyd.moveAddress};
    
    return [manager POST:@"http://beijing.7caihe.cn/smarthome/api.php?m=Equipments&a=EquipmentsUpdate" parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"list"];
        NSLog(@"JSON: %@ %@",JSON,postsFromResponse);
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        NSLog(@"%@",mutablePosts);
        for (NSDictionary *attributes in postsFromResponse) {
            Post *post = [[Post alloc] initWithAttributes:attributes];
            [mutablePosts addObject:post];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
    
    //[manager POST: parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
//    return [manager GET:@"http://beijing.7caihe.cn/smarthome/api.php?m=Equipments&a=getEquipmentsList&user_id=1305151013" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
//        NSArray *postsFromResponse = [JSON valueForKeyPath:@"list"];
//        NSLog(@"%@",postsFromResponse);
//        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
//        NSLog(@"%@",mutablePosts);
//        for (NSDictionary *attributes in postsFromResponse) {
//            Post *post = [[Post alloc] initWithAttributes:attributes];
//            [mutablePosts addObject:post];
//        }
//        
//        if (block) {
//            block([NSArray arrayWithArray:mutablePosts], nil);
//        }
//    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
//        if (block) {
//            block([NSArray array], error);
//        }
//    }];
    
    
    //    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    //    [parameters setObject:@"Equipments" forKey:@"m"];
    //    [parameters setObject:@"getEquipmentsList" forKey:@"a"];
    //    [parameters setObject:@"1305151013" forKey:@"user_id"];
    //    //http://beijing.7caihe.cn/smarthome/api.php?m=Equipments&a=getEquipmentsList&user_id=1305151013
    //    return [[AFAppDotNetAPIClient sharedClient] POST:@"smarthome/api.php" parameters:parameters success:^(NSURLSessionDataTask * task, id JSON) {
    //        NSArray *postsFromResponse = [JSON valueForKeyPath:@"data"];
    //        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
    //        for (NSDictionary *attributes in postsFromResponse) {
    //            Post *post = [[Post alloc] initWithAttributes:attributes];
    //            [mutablePosts addObject:post];
    //        }
    //
    //        if (block) {
    //            block([NSArray arrayWithArray:mutablePosts], nil);
    //        }
    //    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
    //        if (block) {
    //            block([NSArray array], error);
    //        }
    //    }];
    
}

@end
