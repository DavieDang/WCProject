//
//  BGHeaderView.h
//  WCProject
//
//  Created by BingoMacMini on 16/7/25.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"

@interface BGHeaderView : UIView

@property (nonatomic,strong)  UIImageView *memuImageView;
@property (nonatomic,strong)  UILabel *numLb;
@property (nonatomic,strong)  UILabel *nameLb;
@property (nonatomic,strong)  UIView *starBgView;
@property (nonatomic,strong)  UILabel *yueLb;

@property (nonatomic,strong)  CWStarRateView *starView;







@end
