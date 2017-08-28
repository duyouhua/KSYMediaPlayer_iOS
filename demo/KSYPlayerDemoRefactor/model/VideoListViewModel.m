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

- (instancetype)initWithJsonResponseData:(NSData *)data {
    if (self = [super init]) {
        NSError *error;
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
        VideoModelData *modelData = [[VideoModelData alloc] initWithString:jsonString error:&error];
        if (!error) {
            if ([modelData.Data.RetMsg isEqualToString:@"success"]) {
                self.listViewDataSource = [[NSMutableArray alloc] initWithArray:modelData.Data.Detail];
            }
        }
    }
    return self;
}

@end
