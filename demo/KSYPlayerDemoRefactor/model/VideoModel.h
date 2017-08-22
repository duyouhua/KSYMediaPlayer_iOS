//
//  VideoModel.h
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/22.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingModel.h"

@interface VideoModel : NSObject

@property (nonatomic, copy)   NSString *vDescription;

@property (nonatomic, copy)   NSString *vCoverImageUrl;

@property (nonatomic, copy)   NSString *vUrl;

@property (nonatomic, strong) SettingModel   *vSettingModel;

@end
