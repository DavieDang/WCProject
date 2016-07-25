//
//  wcHeader.h
//  WCProject
//
//  Created by BingoMacMini on 16/7/11.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#ifndef wcHeader_h
#define wcHeader_h


#endif /* wcHeader_h */


#import"UIView+Frame.h"
#import <MBProgressHUD.h>
#import <AFNetworking.h>
#import "NSObject+WCTool.h"
#import "UIView+Frame.h"

#define kcScreenWidth [UIScreen mainScreen].bounds.size.width
#define kcScreenHeight [UIScreen mainScreen].bounds.size.height


#define SBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SBColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define SBGrayColor(rgb) [UIColor colorWithRed:(rgb)/255.0 green:(rgb)/255.0 blue:(rgb)/255.0 alpha:1.0]
#define SBSystemFont(size) [UIFont systemFontOfSize:(size)]