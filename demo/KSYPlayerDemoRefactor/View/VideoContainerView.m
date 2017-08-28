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
@property (nonatomic, strong) UIView             *aBottomMaskView;
@property (nonatomic, strong) UIView             *aTopMaskView;

@property (nonatomic, copy)   void(^fullScreenBlock)(BOOL isFullScreen);
@property (nonatomic, assign) BOOL hasHideProgress;
@property (nonatomic, assign) VCPlayHandlerState playState;

@property (nonatomic, assign) NSTimeInterval playedTime;
@end

@implementation VideoContainerView

- (instancetype)initWithFullScreenBlock:(void(^)(BOOL))fullScreenBlock
{
    if (self = [super init]) {
        _fullScreenBlock = fullScreenBlock;
        _fullScreen = NO;
        _totalPlayTime = 0;
        _playedTime = 0;
        _playState = VCPlayHandlerStatePause;
        [self setupUI];
    }
    return self;
}

#pragma mark --
#pragma mark -- UI metohd

- (void)setupUI {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(aTapEv)];
    [self addGestureRecognizer:tap];
    
    [self addSubview:self.aTopMaskView];
    [self addSubview:self.backButton];
    [self addSubview:self.aBottomMaskView];
    [self addSubview:self.playControlView];
    [self configeConstraints];
    self.aTopMaskView.hidden = YES;
    self.playControlView.hidden = YES;
    self.aBottomMaskView.hidden = YES;
}

- (VodPlayControlView *)playControlView {
    if (!_playControlView) {
        _playControlView = [[NSBundle mainBundle] loadNibNamed:@"VodPlayControlView" owner:self options:nil].firstObject;
        _playControlView.backgroundColor = [UIColor clearColor];
        [_playControlView.fullScreenButton addTarget:self action:@selector(fullScreenAction) forControlEvents:UIControlEventTouchUpInside];
        [_playControlView.pauseButton addTarget:self action:@selector(playStateHandler) forControlEvents:UIControlEventTouchUpInside];
        [_playControlView.playSlider addTarget:self action:@selector(sliderValueChangedHandler) forControlEvents:UIControlEventValueChanged];
    }
    return _playControlView;
}

- (void)sliderValueChangedHandler {
    if (self.dragSliderBlock) {
        self.dragSliderBlock(self.playControlView.playSlider.value);
    }
}

- (UIView *)aBottomMaskView {
    if (!_aBottomMaskView) {
        _aBottomMaskView = [[UIView alloc] init];
        _aBottomMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    return _aBottomMaskView;
}

- (UIView *)aTopMaskView {
    if (!_aTopMaskView) {
        _aTopMaskView = [[UIView alloc] init];
        _aTopMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    return _aTopMaskView;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    return _backButton;
}

- (void)configeConstraints {
    [self.aTopMaskView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.trailing.equalTo(self);
        make.height.mas_equalTo(57);
    }];
    [self.backButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(self);
        make.width.height.mas_equalTo(60);
    }];
    [self.aBottomMaskView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    [self.playControlView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.mas_equalTo(30);
    }];
}

- (void)updateConstraintsHandler {
    [self.aTopMaskView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_top);
    }];
    [self.backButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_top);
    }];
    [self.aBottomMaskView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
    }];
    [self.playControlView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
    }];
}

#pragma mark --
#pragma mark -- private handler method

- (void)playStateHandler {
    if (self.playStateBlock) {
        self.playStateBlock(_playState);
        if (_playState == VCPlayHandlerStatePause) {
            self.playState = VCPlayHandlerStatePlay;
        } else {
            self.playState = VCPlayHandlerStatePause;
        }
    }
}

- (void)fullScreenAction {
    if (self.fullScreenBlock) {
        self.fullScreenBlock(YES);
        self.aTopMaskView.hidden = NO;
    }
}

- (void)aTapEv {
    self.userInteractionEnabled = NO;
    if (self.isFullScreen) {
        if (self.hasHideProgress) {
            [self configeConstraints];
            [UIView animateWithDuration:0.2 animations:^{
                [self layoutIfNeeded];
            } completion:^(BOOL finished) {
                self.userInteractionEnabled = YES;
                self.hasHideProgress = NO;
            }];
        } else {
            [self updateConstraintsHandler];
            [UIView animateWithDuration:0.2 animations:^{
                [self layoutIfNeeded];
            } completion:^(BOOL finished) {
                self.userInteractionEnabled = YES;
                self.hasHideProgress = YES;
            }];
        }
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.playControlView.hidden = !self.playControlView.hidden;
            self.aBottomMaskView.hidden = !self.aBottomMaskView.hidden;
            self.userInteractionEnabled = YES;
        });
    }
}

- (void)backAction {
    if (self.isFullScreen) {
        if (self.fullScreenBlock) {
            self.fullScreenBlock(NO);
            self.aTopMaskView.hidden = YES;
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

- (NSString *)convertToMinutes:(NSTimeInterval)seconds {
    NSString *timeStr = [NSString stringWithFormat:@"%02d:%02d", (int)seconds / 60, (int)seconds % 60];
    return timeStr;
}

#pragma mark --
#pragma mark -- public method

- (void)updatePlayedTime:(NSTimeInterval)playedTime {
    self.playControlView.playedTimeLab.text = [self convertToMinutes:playedTime];
    float sliderValue = 0;
    if (self.totalPlayTime > 0) {
        sliderValue = playedTime / self.totalPlayTime;
    }
    [self.playControlView.playSlider setValue:sliderValue];
}

- (void)updateTotalPlayTime:(NSTimeInterval)totalPlayTime {
    self.totalPlayTime = totalPlayTime;
    self.playControlView.hidden = NO;
    self.aBottomMaskView.hidden = NO;
    self.playControlView.totalPlayTimeLab.text = [self convertToMinutes:totalPlayTime];
}

@end
