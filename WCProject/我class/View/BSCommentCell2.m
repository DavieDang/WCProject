//
//  BSCommentCell.m
//  BSCourseController
//
//  Created by BingoMacMini on 16/5/13.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BSCommentCell2.h"
#import "wcHeader.h"




@implementation BSCommentCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (UIImageView *)headImageView {
    if(_headImageView == nil) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.image = [UIImage imageNamed:@"默认头像小"];
        _headImageView.contentMode = UIViewContentModeScaleAspectFit;
        _headImageView.layer.cornerRadius = 17.5;
        _headImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(18);
            make.top.mas_equalTo(32/3);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
        
    }
    return _headImageView;
}

- (UILabel *)nameLabel {
    if(_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = [UIColor colorWithRed:162.0/255 green:162.0/255 blue:162.0/255 alpha:1.0];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(36/3);
            make.left.mas_equalTo(self.headImageView.mas_right).offset(58/3);
        }];
        
    }
    return _nameLabel;
}

- (UILabel *)commentLabel {
    if(_commentLabel == nil) {
        _commentLabel = [[UILabel alloc] init];
          _commentLabel.numberOfLines = 0;
        _commentLabel.font = [UIFont systemFontOfSize:14];
        _commentLabel.textColor = [UIColor colorWithRed:81.0/255 green:81.0/255 blue:81.0/255 alpha:1.0];
      
        [self.contentView addSubview:_commentLabel];
        [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.headImageView.mas_bottom).offset(51/3);
            make.leftMargin.mas_equalTo(self.nameLabel);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-32/3);
            make.right.mas_equalTo(-18);
        }];
        
    }
    return _commentLabel;
}

- (UIView *)bgStarView {
    if(_bgStarView == nil) {
        _bgStarView = [[UIView alloc] init];
        
        [self.contentView addSubview:_bgStarView];
        [_bgStarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(90, 15));
            make.right.mas_equalTo(-18);

        }];
        

    }
    return _bgStarView;
}

- (CWStarRateView *)starView {
    if(_starView == nil) {
        
        _starView = [[CWStarRateView alloc] initWithFrame:CGRectMake(0, 0, 90, 15) numberOfStars:5];
        
        [self.bgStarView addSubview:_starView];
        


    }
    return _starView;
}

//日期
- (UILabel *)dateLabel {
    if(_dateLabel == nil) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textColor = [UIColor colorWithRed:162.0/255 green:162.0/255 blue:162.0/255 alpha:1.0];
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10);
            make.leftMargin.mas_equalTo(self.nameLabel);
        }];
    }
    return _dateLabel;
}

//时间
- (UILabel *)timeLabel {
    if(_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor colorWithRed:162.0/255 green:162.0/255 blue:162.0/255 alpha:1.0];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10);
            make.left.mas_equalTo(self.dateLabel.mas_right).offset(5);
            make.bottomMargin.mas_equalTo(self.headImageView);
        }];
    }
    return _timeLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
