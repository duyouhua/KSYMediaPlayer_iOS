//
//  VodViewController.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/22.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "VodViewController.h"
#import "SettingViewController.h"
#import "VideoListViewModel.h"
#import "PlayerViewController.h"

@interface VodViewController ()
@property (nonatomic, strong) VideoListViewModel *videoListViewModel;
@property (nonatomic, strong) UICollectionView   *videoCollectionView;
@end

@implementation VodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)settingAction:(id)sender {
    [self.navigationController pushViewController:[[SettingViewController alloc] init] animated:YES];
}


@end
