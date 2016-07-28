//
//  BSCommentCell.m
//  BSCourseController
//
//  Created by BingoMacMini on 16/5/13.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BSCommentCell3.h"
#import "wcHeader.h"




@implementation BSCommentCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (UIImageView *)headImageView {
    if(_headImageView == nil) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.image = [UIImage new];
        _headImageView.contentMode = UIViewContentModeScaleAspectFit;
       // _headImageView.layer.cornerRadius = 17.5;
       // _headImageView.layer.masksToBounds = YES;
         __weak __typeof(&*self)ws = self;
        [self.contentView addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(ws.nameLabel.mas_bottom).offset(5);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(40);
            make.bottom.mas_equalTo(-8);
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
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(12);
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
            make.leftMargin.mas_equalTo(self.headImageView);
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
            make.left.mas_equalTo(self.headImageView.mas_right).offset(5);
            make.topMargin.mas_equalTo(self.headImageView);
        }];
    }
    return _dateLabel;
}

//人数
- (UILabel *)timeLabel {
    if(_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor colorWithRed:162.0/255 green:162.0/255 blue:162.0/255 alpha:1.0];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headImageView.mas_right).offset(5);
            make.bottomMargin.mas_equalTo(self.headImageView);
        }];
    }
    return _timeLabel;
}

- (UIButton *)yueBtn {
    if(_yueBtn == nil) {
        _yueBtn = [UIButton buttonWithType:0];
        [_yueBtn setTitle:@"约" forState:0];
        _yueBtn.layer.borderColor = [UIColor colorWithRed:228.0/255 green:96.0/255 blue:24.0/255.0 alpha:1.0].CGColor;
        _yueBtn.layer.borderWidth = 1;
        
        [_yueBtn setTitleColor:[UIColor colorWithRed:228.0/255 green:96.0/255 blue:24.0/255.0 alpha:1.0] forState:0];
       //_yueBtn.titleLabel.textColor = [UIColor colorWithRed:228.0/255 green:96.0/255 blue:24.0/255.0 alpha:1.0];
        
       // _yueBtn.backgroundColor = appYellow;
        _yueBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_yueBtn];
        __weak __typeof(&*self)ws = self;
        [_yueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(ws);
            make.size.mas_equalTo(CGSizeMake(50, 30));
        }];
        
    }
    return _yueBtn;
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
