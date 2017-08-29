//
//  VodPlayControlView.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/24.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "VodPlayControlView.h"
#import "Masonry.h"

@implementation VodPlayControlView

- (void)screenRotateHandler:(BOOL)fullScreen {
    if (fullScreen) {
        [self fullScreenHandler];
    } else {
        [self portraitScreenHandler];
    }
}

- (void)fullScreenHandler {
    self.nextButton.hidden = NO;
    [self.nextButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pauseButton.mas_right).offset(6);
        make.centerY.equalTo(self.pauseButton);
        make.size.mas_equalTo(CGSizeMake(40, 30));
    }];
    [self.playedTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nextButton.mas_right).offset(6);
        make.centerY.equalTo(self.nextButton);
    }];
}

- (void)portraitScreenHandler {
    self.nextButton.hidden = YES;
    [self.playedTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pauseButton.mas_right).offset(6);
        make.centerY.equalTo(self.pauseButton);
    }];
}

@end
