//
//  BGFirstPageViewCell.h
//  WCProject
//
//  Created by BingoMacMini on 16/7/21.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wcHeader.h"
#import "CWStarRateView.h"

@interface BGFirstPageViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *canteenName;
@property (weak, nonatomic) IBOutlet UILabel *peopleNumber;
@property (weak, nonatomic) IBOutlet UIView *starView;
//@property (nonatomic,strong) CWStarRateView *startIv;
@property (weak, nonatomic) IBOutlet UIButton *togetherBtn;
@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@end
