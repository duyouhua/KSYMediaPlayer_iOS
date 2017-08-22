//
//  PlayerViewController.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/22.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "PlayerViewController.h"
#import <KSYMediaPlayer/KSYMoviePlayerController.h>
#import "VideoListViewModel.h"

@interface PlayerViewController ()
@property (nonatomic, strong) VideoListViewModel       *videoListViewModel;
@property (nonatomic, strong) KSYMoviePlayerController *player;
@end

@implementation PlayerViewController

- (instancetype)initWithVideoListViewModel:(VideoListViewModel *)videoListViewModel {
    if (self = [super init]) {
        _videoListViewModel = videoListViewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupPlayer {
    //初始化播放器并设置播放地址
//    self.player = [[KSYMoviePlayerController alloc] initWithContentURL: aURL fileList:fileList sharegroup:nil];
//    [self setupObservers:_player];
//    _player.controlStyle = MPMovieControlStyleNone;
//    [_player.view setFrame: videoView.bounds];  // player's frame must match parent's
//    [videoView addSubview: _player.view];
//    videoView.autoresizesSubviews = TRUE;
//    _player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    if(config)
//    {
//        //设置播放参数
//        _player.videoDecoderMode = config.decodeMode;
//        _player.scalingMode = config.contentMode;
//        _player.shouldAutoplay = config.bAutoPlay;
//        _player.deinterlaceMode = config.deinterlaceMode;
//        _player.shouldLoop = config.bLoop;
//        _player.bInterruptOtherAudio = config.bAudioInterrupt;
//        _player.bufferTimeMax = config.bufferTimeMax;
//        _player.bufferSizeMax = config.bufferSizeMax;
//        [_player setTimeout:config.connectTimeout readTimeout:config.readTimeout];
//    }
//    NSKeyValueObservingOptions opts = NSKeyValueObservingOptionNew;
//    [_player addObserver:self forKeyPath:@"currentPlaybackTime" options:opts context:nil];
//    [_player addObserver:self forKeyPath:@"clientIP" options:opts context:nil];
//    [_player addObserver:self forKeyPath:@"localDNSIP" options:opts context:nil];
//    prepared_time = (long long int)([self getCurrentTime] * 1000);
//    [_player prepareToPlay];
}

@end
