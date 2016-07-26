//
//  BGFirstDetailCell.m
//  WCProject
//
//  Created by dangMac on 16/7/25.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGFirstDetailCell.h"
#import "wcHeader.h"


@implementation BGFirstDetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

-(UILabel *)groupName{
    if (!_groupName) {
        _groupName = [UILabel new];
        
        [self.contentView addSubview:_groupName];
         __weak __typeof(&*self)ws = self;
        [_groupName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(ws);
        }];

        
    }
    return _groupName;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIView *)headerbgView{
    if(_headerbgView == nil) {
        _headerbgView = [[UIView alloc] init];
        [self.contentView addSubview:_headerbgView];
         __weak __typeof(&*self)ws = self;
        [_headerbgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws.groupName.mas_right).offset(10);
            make.right.mas_equalTo(ws.yueBtn.mas_left).offset(-5);
            make.bottom.mas_equalTo(ws.contentView.mas_bottom).offset(-10);
            make.top.mas_equalTo(ws.mas_top).offset(10);
        }];

        [self reloadmyData:self.headArr];
        
        
        
    }
    return _headerbgView;
}

- (UIButton *)yueBtn {
    if(_yueBtn == nil) {
        _yueBtn = [UIButton buttonWithType:0];
        [_yueBtn setTitle:@"约" forState:0];
        _yueBtn.backgroundColor = appYellow;
        _yueBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_yueBtn];
         __weak __typeof(&*self)ws = self;
        [_yueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(ws);
            make.size.mas_equalTo(CGSizeMake(30, 20));
        }];
        
    }
    return _yueBtn;
}


- (void)reloadmyData:(NSMutableArray *)arr{

  //  [self.headerbgView removeFromSuperview];
    
     __weak __typeof(&*self)ws = self;
    for (int i = 0; i < 7; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        [imageView setTag:i+100];
        imageView.image = [UIImage imageNamed:@"caiicon.jpg"];
        imageView.layer.cornerRadius = 15;
        imageView.layer.masksToBounds=YES;
        [_headerbgView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i*appheaderWidth);
            make.centerY.mas_equalTo(ws);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        UIImageView *imagefff = (UIImageView *)[imageView viewWithTag:100];
        
        //最多只能加7个
        if (i == 7) {
            break;
        }
    }

}
@end
