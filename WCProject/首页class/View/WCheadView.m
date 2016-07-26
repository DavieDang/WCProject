//
//  WCheadView.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/26.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "WCheadView.h"
#import "wcHeader.h"

@implementation WCheadView
- (UIImageView *)headIcon {
    if(_headIcon == nil) {
        _headIcon = [[UIImageView alloc] init];
        _headIcon.frame = CGRectMake(0, 0, 30, 30);
    }
    return _headIcon;
}

@end
