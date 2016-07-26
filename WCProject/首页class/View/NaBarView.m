//
//  NaBarView.m
//  companyScholl
//
//  Created by BingoMacMini on 16/6/21.
//  Copyright © 2016年 chensb. All rights reserved.
//

#import "NaBarView.h"
#import "wcHeader.h"

@implementation NaBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (UIButton *)backVC {
    if(_backVC == nil) {
        _backVC = [UIButton buttonWithType:0];
        [_backVC setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        [self addSubview:_backVC];
        [_backVC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(88/3);
        }];

    }
    return _backVC;
}

- (UIButton *)moreBtn {
    if(_moreBtn == nil) {
        _moreBtn = [UIButton buttonWithType:0];
        [_moreBtn setImage:[UIImage imageNamed:@"icon_alert"] forState:UIControlStateNormal];
        [self addSubview:_moreBtn];
         __weak __typeof(&*self)ws = self;
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.top.mas_equalTo(ws.backVC.mas_top);
        }];

    }
    return _moreBtn;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = SBSystemFont(15);
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        __weak __typeof(&*self)ws = self;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(ws);
            make.centerY.mas_equalTo(ws.backVC);
        }];
    }
    
    return _titleLabel;
}



@end
