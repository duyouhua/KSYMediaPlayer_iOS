//
//  PlayerTableViewCell.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/23.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "PlayerTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "VideoModel.h"

@interface PlayerTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *videoTitleLab;

@end

@implementation PlayerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configeWithVideoModel:(VideoModel *)videoModel {
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:videoModel.CoverURL.firstObject] placeholderImage:[UIImage imageNamed:@""]];
    self.videoTitleLab.text = videoModel.VideoTitle;
}

@end
