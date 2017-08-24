//
//  VodViewController.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/22.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "VodViewController.h"
#import "VideoListViewModel.h"
#import "PlayerViewController.h"
#import "FlowLayout.h"
#import "Masonry.h"
#import "VideoCollectionViewCell.h"
#import "PlayerViewController.h"
#import "PlayerViewModel.h"
#import "Constant.h"
#import "VideoCollectionHeaderView.h"

@interface VodViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, FlowLayoutDelegate>
@property (nonatomic, strong) VideoListViewModel        *videoListViewModel;
@property (nonatomic, strong) UICollectionView          *videoCollectionView;
@property (nonatomic, strong) VideoCollectionHeaderView *headerView;
@end


@implementation VodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self fetchDatasource];
}

- (void)fetchDatasource {
    self.videoListViewModel = [[VideoListViewModel alloc] initForTest];
    [self.headerView configeVideoModel:self.videoListViewModel.listViewDataSource.firstObject];
    [self.videoCollectionView reloadData];
}

- (void)setupUI {
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.videoCollectionView];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self.view);
        make.height.mas_equalTo(197);
    }];
    [self.videoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(10);
        make.leading.trailing.bottom.equalTo(self.view);
    }];
}

- (UICollectionView *)videoCollectionView
{
    if (!_videoCollectionView)
    {
        _videoCollectionView = ({
            FlowLayout *flowLayout = [[FlowLayout alloc]init];
            flowLayout.delegate = self;
            UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
            collectionView.dataSource = self;
            collectionView.delegate = self;
            collectionView.scrollsToTop = NO;
            collectionView.alwaysBounceVertical = YES;
            [collectionView registerNib:[UINib nibWithNibName:@"VideoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kVideoCollectionViewCellId];
            collectionView;
        });
    }
    return _videoCollectionView;
}

- (VideoCollectionHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[NSBundle mainBundle] loadNibNamed:@"VideoCollectionHeaderView" owner:self options:nil].firstObject;
        __weak typeof(self) weakSelf = self;
        _headerView.tapBlock = ^{
            typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf didSelectedVideoHandler:strongSelf.videoListViewModel.listViewDataSource.firstObject];
        };
    }
    return _headerView;
}

- (void)didSelectedVideoHandler:(VideoModel *)videoModel {
    if (!videoModel) {
        return;
    }
    PlayerViewModel *playerViewModel = [[PlayerViewModel alloc] initWithPlayingVideoModel:videoModel videoListViewModel:_videoListViewModel];
    PlayerViewController *pvc = [[PlayerViewController alloc] initWithPlayerViewModel:playerViewModel];
    [self.navigationController pushViewController:pvc animated:YES];
}

#pragma mark - CollectionView Datasource and Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _videoListViewModel.listViewDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kVideoCollectionViewCellId forIndexPath:indexPath];
    if (indexPath.row < self.videoListViewModel.listViewDataSource.count) {
        [cell configeWithVideoModel:self.videoListViewModel.listViewDataSource[indexPath.row]];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoModel *videoModel = nil;
    if (indexPath.row < self.videoListViewModel.listViewDataSource.count) {
        videoModel = self.videoListViewModel.listViewDataSource[indexPath.row];
    }
    if (videoModel) {
        [self didSelectedVideoHandler:videoModel];
    }
}

#pragma mark --
#pragma mark - FlowLayoutDelegate

- (CGFloat)flowLayout:(FlowLayout *)flowLayout heightForRowAtIndexPath:(NSInteger )index itemWidth:(CGFloat)itemWidth {
    return kVideoCollectionViewCellHeight;
}

@end
