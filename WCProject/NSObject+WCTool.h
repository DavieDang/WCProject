//
//  NSObject+WCTool.h
//  WCProject
//
//  Created by BingoMacMini on 16/7/11.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WCTool)
- (void)showErrorMsg:(NSObject *)msg;
- (void)showSuccessMsg:(NSObject *)msg;
- (void)showProgress;
- (void)hideProgress;

@end
