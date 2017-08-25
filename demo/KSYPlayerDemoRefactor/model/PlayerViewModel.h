//
//  PlayerViewModel.h
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/23.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VideoListViewModel.h"

@class VideoContainerView;

@interface PlayerViewModel : NSObject

@property (nonatomic, strong) VideoModel         *playingVideoModel;

@property (nonatomic, strong) VideoListViewModel *videoListViewModel;

@property (nonatomic, weak) UIViewController *owner;

- (instancetype)initWithPlayingVideoModel:(VideoModel *)playingVideoModel
                       videoListViewModel:(VideoListViewModel *)videoListViewModel;

- (void)fullScreenHandlerForView:(VideoContainerView *)aView
                   isFullScreen:(BOOL) isFullScreen;

@end
