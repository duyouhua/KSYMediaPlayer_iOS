//
//  SettingModel.h
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/22.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KSYMediaPlayer/KSYMoviePlayerDefines.h>

@interface SettingModel : NSObject
@property (nonatomic, assign) MPMovieVideoDecoderMode videoDecoderMode;
@property (nonatomic, assign) float bufferTime;
@property (nonatomic, assign) float bufferSize;
@property (nonatomic, assign) float timeOutPrepare;
@property (nonatomic, assign) float timeOutRead;
@property (nonatomic, assign) BOOL  isLoopPlay;
@end
