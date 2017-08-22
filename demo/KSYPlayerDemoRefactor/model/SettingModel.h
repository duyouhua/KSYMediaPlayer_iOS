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
@property (nonatomic, assign) float bufferTimeMax;
@property (nonatomic, assign) float bufferSizeMax;
@property (nonatomic, assign) float preparetimeOut;
@property (nonatomic, assign) float readtimeOut;
@property (nonatomic, assign) BOOL  isLoopPlay;
@end
