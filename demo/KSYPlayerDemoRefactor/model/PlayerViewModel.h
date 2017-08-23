//
//  PlayerViewModel.h
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/23.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoListViewModel.h"

@interface PlayerViewModel : NSObject

@property (nonatomic, strong) VideoModel         *playingVideoModel;

@property (nonatomic, strong) VideoListViewModel *videoListViewModel;

@end
