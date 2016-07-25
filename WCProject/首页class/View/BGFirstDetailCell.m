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
        
        _groupName.frame = CGRectMake(12, 12, 50, 17);
        _groupName.centerY = self.contentView.centerY;
        
        [self.contentView addSubview:_groupName];
        
    }
    return _groupName;
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
