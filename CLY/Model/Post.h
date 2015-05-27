// Post.h
//  CLY
//
//  Created by chenliangyu on 14/12/9.
//  Copyright (c) 2014年 ioschen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject
{
    @public
    int _age;
    NSString *sss;
}
//- (void)setAge:(int)age;
//- (int)age;

@property (nonatomic, assign) NSUInteger postID;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *roomSelect;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
