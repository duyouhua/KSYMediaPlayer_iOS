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
@property (nonatomic, strong) UIButton           *backButton;
@property (nonatomic, strong) UIView             *aMaskView;

@property (nonatomic, copy) void(^fullScreenBlock)(BOOL isFullScreen);
@end

@implementation VideoContainerView

- (instancetype)initWithFullScreenBlock:(void(^)(BOOL))fullScreenBlock {
    if (self = [super init]) {
        _fullScreenBlock = fullScreenBlock;
        _fullScreen = NO;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.backButton];
    [self addSubview:self.aMaskView];
    [self addSubview:self.playControlView];
    [self configeConstraints];
}

- (VodPlayControlView *)playControlView {
    if (!_playControlView) {
        _playControlView = [[NSBundle mainBundle] loadNibNamed:@"VodPlayControlView" owner:self options:nil].firstObject;
        _playControlView.backgroundColor = [UIColor clearColor];
        [_playControlView.fullScreenButton addTarget:self action:@selector(fullScreenAction) forControlEvents:UIControlEventTouchUpInside];
        [_playControlView.pauseButton addTarget:self action:@selector(pauseAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playControlView;
}

- (void)pauseAction {
    
}

- (void)fullScreenAction {
    if (self.fullScreenBlock) {
        self.fullScreenBlock(YES);
    }
}

- (UIView *)aMaskView {
    if (!_aMaskView) {
        _aMaskView = [[UIView alloc] init];
        _aMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    return _aMaskView;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (void)backAction {
    if (self.isFullScreen) {
        if (self.fullScreenBlock) {
            self.fullScreenBlock(NO);
        }
    } else {
        UIViewController *controller = nil;
        for (UIView *view = self; view; view = view.superview) {
            UIResponder *nextResponder = [view nextResponder];
            if ([nextResponder isKindOfClass:[UIViewController class]]) {
                controller = (UIViewController *)nextResponder;
            }
        }
        if ([controller isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController *)controller popViewControllerAnimated:YES];
        } else {
            [controller.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)configeConstraints {
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.mas_equalTo(18);
        make.width.height.mas_equalTo(22);
    }];
    [self.aMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    [self.playControlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.aMaskView);
    }];
}

@end
