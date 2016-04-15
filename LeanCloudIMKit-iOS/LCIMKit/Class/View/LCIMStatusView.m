//
//  LCIMStatusView.m
//  LeanCloudIMKit-iOS
//
//  Created by 陈宜龙 on 16/3/11.
//  Copyright © 2016年 ElonChan. All rights reserved.
//

#import "LCIMStatusView.h"

static CGFloat LCIMStatusImageViewHeight = 20;
static CGFloat LCIMHorizontalSpacing = 15;
static CGFloat LCIMHorizontalLittleSpacing = 5;

@interface LCIMStatusView ()

@property (nonatomic, strong) UIImageView *statusImageView;

@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation LCIMStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:199 / 255.0 blue:199 / 255.0 alpha:1];
    [self addSubview:self.statusImageView];
    [self addSubview:self.statusLabel];
}

#pragma mark - Propertys

- (UIImageView *)statusImageView {
    if (_statusImageView == nil) {
        _statusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(LCIMHorizontalSpacing, (LCIMStatusViewHight - LCIMStatusImageViewHeight) / 2, LCIMStatusImageViewHeight, LCIMStatusImageViewHeight)];
        _statusImageView.image =  ({
            NSString *imageName = @"MessageSendFail";
            NSString *imageNameWithBundlePath = [NSString stringWithFormat:@"MessageBubble.bundle/%@", imageName];
            UIImage *image = [UIImage imageNamed:imageNameWithBundlePath];
            image;});
    }
    return _statusImageView;
}

- (UILabel *)statusLabel {
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_statusImageView.frame) + LCIMHorizontalLittleSpacing, 0, self.frame.size.width - CGRectGetMaxX(_statusImageView.frame) - LCIMHorizontalSpacing - LCIMHorizontalLittleSpacing, LCIMStatusViewHight)];
        _statusLabel.font = [UIFont systemFontOfSize:15.0];
        _statusLabel.textColor = [UIColor grayColor];
        _statusLabel.text = @"会话断开，请检查网络";
    }
    return _statusLabel;
}

@end