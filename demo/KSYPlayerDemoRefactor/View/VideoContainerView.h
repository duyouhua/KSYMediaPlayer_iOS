//
//  VideoContainerView.h
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/23.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VCPlayHandlerState) {
    VCPlayHandlerStatePause,
    VCPlayHandlerStatePlay
};

@interface VideoContainerView : UIView

@property (nonatomic, assign, getter=isFullScreen) BOOL  fullScreen;

@property (nonatomic, assign) NSTimeInterval totalPlayTime;

@property (nonatomic, copy) void(^playStateBlock)(VCPlayHandlerState);
@property (nonatomic, copy) void(^dragSliderBlock)(float progress);
@property (nonatomic, copy) void(^nextButtonBLock)(void);

- (instancetype)initWithFullScreenBlock:(void(^)(BOOL))fullScreenBlock;

- (void)updatePlayedTime:(NSTimeInterval)playedTime;

- (void)updateTotalPlayTime:(NSTimeInterval)totalPlayTime;

@end
