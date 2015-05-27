//
//  YYLockView.h
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYLockView;
@protocol YYLockViewDelegate <NSObject>

//自定义一个协议
//协议方法，把当前视图作为参数
-(void)LockViewDidClick:(YYLockView *)lockView andPwd:(NSString *)pwd;

@end
@interface YYLockView : UIView

//代理
@property(nonatomic,strong) id<YYLockViewDelegate>delegate;

@end