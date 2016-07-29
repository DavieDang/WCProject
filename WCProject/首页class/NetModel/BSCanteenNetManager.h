//
//  BSCanteenNetManager.h
//  WCProject
//
//  Created by BingoMacMini on 16/7/29.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BaseNetManager.h"

@interface BSCanteenNetManager : BaseNetManager
+ (id)completionHanle : (void(^)(id model,NSError *error))completionHandle;

@end
