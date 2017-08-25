//
//  VideoContainerView.h
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/23.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoContainerView : UIView

@property (nonatomic, assign, getter=isFullScreen) BOOL  fullScreen;

- (instancetype)initWithFullScreenBlock:(void(^)(BOOL))fullScreenBlock;

@end
