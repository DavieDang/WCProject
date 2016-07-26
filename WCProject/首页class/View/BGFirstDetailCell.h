//
//  BGFirstDetailCell.h
//  WCProject
//
//  Created by dangMac on 16/7/25.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCheadView.h"

@interface BGFirstDetailCell : UITableViewCell

@property(nonatomic,strong)UILabel *groupName;
@property (nonatomic,strong)  UIView *headerbgView;
@property (nonatomic,strong)  WCheadView *headerView;
@property (nonatomic,strong)  NSMutableArray *headArr;
@property (nonatomic,strong)  UIButton *yueBtn;

- (UIView *)headerbgViewWith:(NSMutableArray *)Arr;

- (void)reloadmyData:(NSMutableArray *)arr;



@end
