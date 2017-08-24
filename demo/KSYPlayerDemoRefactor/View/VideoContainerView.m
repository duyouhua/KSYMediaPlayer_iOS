//
//  VideoContainerView.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/23.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "VideoContainerView.h"
#import "VodPlayControlView.h"
#import "Masonry.h"

@interface VideoContainerView ()
@property (nonatomic, strong) VodPlayControlView *playControlView;
@property (nonatomic, strong) UIView             *aMaskView;
@end

@implementation VideoContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.aMaskView];
    [self addSubview:self.playControlView];
    [self configeConstraints];
}

- (VodPlayControlView *)playControlView {
    if (!_playControlView) {
        _playControlView = [[NSBundle mainBundle] loadNibNamed:@"VodPlayControlView" owner:self options:nil].firstObject;
        _playControlView.backgroundColor = [UIColor clearColor];
    }
    return _playControlView;
}

- (UIView *)aMaskView {
    if (!_aMaskView) {
        _aMaskView = [[UIView alloc] init];
        _aMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    return _aMaskView;
}

- (void)configeConstraints {
    [self.aMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    [self.playControlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.aMaskView);
//        make.leading.trailing.bottom.equalTo(self);
//        make.height.mas_equalTo(30);
    }];
}

@end
