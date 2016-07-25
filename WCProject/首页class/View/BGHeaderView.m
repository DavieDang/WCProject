//
//  BGHeaderView.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/25.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGHeaderView.h"
#import "wcHeader.h"

@implementation BGHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (UIImageView *)memuImageView {
    if(_memuImageView == nil) {
        _memuImageView = [[UIImageView alloc] init];
        [self addSubview:_memuImageView];
         __weak __typeof(&*self)ws = self;
        [_memuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(64);
            make.bottom.mas_equalTo(ws.mas_bottom).offset(-40);
        }];
 
        
    }
    return _memuImageView;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.textColor = [UIColor blackColor];
        _nameLb.font = [UIFont systemFontOfSize:14];
        [self addSubview:_nameLb];
         __weak __typeof(&*self)ws = self;
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(ws.memuImageView.mas_bottom).offset(5);
        }];
    }
    return _nameLb;
}
- (UILabel *)numLb {
    if(_numLb == nil) {
        _numLb = [[UILabel alloc] init];
        _numLb.numberOfLines = 0;
        _numLb.font = [UIFont systemFontOfSize:11];
        _numLb.textColor = [UIColor blackColor];
        [self addSubview:_numLb];
         __weak __typeof(&*self)ws = self;
        [_numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(ws.nameLb);
            make.bottom.mas_equalTo(ws.mas_bottom).offset(-5);
            
        }];
    }
    return _numLb;
}

- (UIView *)starBgView {
    if(_starBgView == nil) {
        _starBgView = [[UIView alloc] init];
        
        [self addSubview:_starBgView];
         __weak __typeof(&*self)ws = self;
        [_starBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws.numLb.mas_right).offset(10);
            make.bottom.mas_equalTo(ws.mas_bottom).offset(-5);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(30);
        }];
    }
    return _starBgView;
}

- (UILabel *)yueLb {
    if(_yueLb == nil) {
        _yueLb = [[UILabel alloc] init];
        _yueLb.font = [UIFont systemFontOfSize:15];
        _yueLb.text = @"约";
        _yueLb.textColor = [UIColor whiteColor];
        _yueLb.backgroundColor = appYellow;
        [self addSubview:_yueLb];
        [_yueLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
        }];
    }
    return _yueLb;
}

- (CWStarRateView *)starView {
    if(_starView == nil) {
        _starView = [[CWStarRateView alloc] initWithFrame:CGRectMake(0, 0, 90, 30) numberOfStars:5];
        
        [self.starBgView addSubview:_starView];
     
    }
    return _starView;
}

@end
