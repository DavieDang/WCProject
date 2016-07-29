//
//  BSCanteenNetManager.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/29.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BSCanteenNetManager.h"
#import "BSCanteenModel.h"
#import "wcHeader.h"

@implementation BSCanteenNetManager
+ (id)completionHanle:(void (^)(id, NSError *))completionHandle{
    NSString *path = @"http://10.200.201.35:8015/7FanApp/Handler/InterfaceHandler.ashx?action=RES_LIST";
    return [self POST:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BSCanteenModel mj_objectArrayWithKeyValuesArray:responseObj[@"rtnResult"]],error);
        
        NSLog(@"%@=======",responseObj);
        
    }];
    
    
}





@end
