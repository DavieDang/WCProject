//
//  BSCanteenModel.h
//  WCProject
//
//  Created by BingoMacMini on 16/7/29.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BaseModel.h"

@interface BSCanteenModel : BaseModel

@property (nonatomic,strong)  NSString *Id;
@property (nonatomic,strong)  NSString *ResName;
@property (nonatomic,strong)  NSString *Address;
@property (nonatomic,assign)  int Acount;
@property (nonatomic,strong)  NSString *ImgName;

@end
