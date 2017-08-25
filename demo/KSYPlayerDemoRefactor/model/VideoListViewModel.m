//
//  VideoListViewModel.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/22.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "VideoListViewModel.h"
#import "VideoModel.h"

@implementation VideoListViewModel

- (instancetype)initWithListDataSource:(NSMutableArray<VideoModel*> *)listViewDataSource {
    if (self = [super init]) {
        _listViewDataSource = listViewDataSource;
    }
    return self;
}

- (instancetype)initForTest {
    if (self = [super init]) {
        [self testDataHandler];
    }
    return self;
}

- (void)testDataHandler {
    self.listViewDataSource = [NSMutableArray new];
    for (NSInteger i = 0; i < 6; ++i) {
        VideoModel *videoModel = [[VideoModel alloc] init];
        videoModel.vUrl = @"http://lavaweb-10015286.video.myqcloud.com/ideal-pick-2.mp4";
        videoModel.vDescription = @"It's a test description";
        videoModel.vCoverImageUrl = @"";
        [_listViewDataSource addObject:videoModel];
    }
}

@end
