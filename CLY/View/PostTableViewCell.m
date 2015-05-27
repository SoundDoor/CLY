// TweetTableViewCell.m
//  CLY
//
//  Created by chenliangyu on 14/12/9.
//  Copyright (c) 2014年 ioschen. All rights reserved.
//

#import "PostTableViewCell.h"

#import "Post.h"

#import "UIImageView+AFNetworking.h"

@implementation PostTableViewCell
@synthesize deviceNamelabel;
- (id)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    deviceNamelabel=[[UILabel alloc]initWithFrame:CGRectMake(125, 15, 150, 20)];
    deviceNamelabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:deviceNamelabel];
    
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines = 0;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)setPost:(Post *)post {
    _post = post;

    self.deviceNamelabel.text=_post.roomSelect;
    self.textLabel.text = [NSString stringWithFormat:@"%d",post.postID];
    self.detailTextLabel.text = _post.text;
    self.imageView.image=[UIImage imageNamed:@"profile-image-placeholder"];
    //[self.imageView setImageWithURL:_post.user.avatarImageURL placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    
    [self setNeedsLayout];
}

//+ (CGFloat)detailTextHeight:(NSString *)text {
//    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(240.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];
//    return rectToFit.size.height;
//}
//
//#pragma mark - UIView
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
//    self.textLabel.frame = CGRectMake(70.0f, 6.0f, 240.0f, 20.0f);
//    
//    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
//    CGFloat calculatedHeight = [[self class] detailTextHeight:self.post.text];
//    detailTextLabelFrame.size.height = calculatedHeight;
//    self.detailTextLabel.frame = detailTextLabelFrame;
//}

@end
