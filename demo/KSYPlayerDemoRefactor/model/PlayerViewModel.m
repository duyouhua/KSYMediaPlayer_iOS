//
//  PlayerViewModel.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/23.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "PlayerViewModel.h"

@implementation PlayerViewModel

- (instancetype)initWithPlayingVideoModel:(VideoModel *)playingVideoModel
                       videoListViewModel:(VideoListViewModel *)videoListViewModel {
    if (self = [super init]) {
        _playingVideoModel = playingVideoModel;
        _videoListViewModel = videoListViewModel;
    }
    return self;
}

@end
