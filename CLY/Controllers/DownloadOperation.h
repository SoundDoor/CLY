//
//  DownloadOperation.h
//  CLY
//
//  Created by chenliangyu on 15/1/27.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol DownloadOperationDelegate;

@interface DownloadOperation : NSOperation

@property (nonatomic, copy) NSString *imageUrl;// 图片的url路径
@property (nonatomic, assign) id<DownloadOperationDelegate> delegate;// 代理
- (id)initWithUrl:(NSString *)url delegate:(id<DownloadOperationDelegate>)delegate;

@end

// 图片下载的协议
@protocol DownloadOperationDelegate <NSObject>
- (void)downloadFinishWithImage:(UIImage *)image;
@end

