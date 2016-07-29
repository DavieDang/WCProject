//
//  BSCommentCell.h
//  BSCourseController
//
//  Created by BingoMacMini on 16/5/13.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"


@interface BSCommentCell3 : UITableViewCell

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *commentLabel;
@property (nonatomic,strong) CWStarRateView *starView;
@property (nonatomic,strong) UIView *bgStarView;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong)  UIButton *yueBtn;
@property (nonatomic,strong) UILabel *joinLabel;








@end
