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
#import "Masonry.h"
#import <MJExtension.h>

#define appheaderWidth 35

#define kcScreenWidth [UIScreen mainScreen].bounds.size.width
#define kcScreenHeight [UIScreen mainScreen].bounds.size.height
#define weakself __weak __typeof(&*self)ws = self

#define appYellow [UIColor colorWithRed:245.0/255 green:228.0/255 blue:0 alpha:1.0]


#define SBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SBColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define SBGrayColor(rgb) [UIColor colorWithRed:(rgb)/255.0 green:(rgb)/255.0 blue:(rgb)/255.0 alpha:1.0]
#define SBSystemFont(size) [UIFont systemFontOfSize:(size)]


//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#define kAppDelegate ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define kStoryboard(StoryboardName)     [UIStoryboard storyboardWithName:StoryboardName bundle:nil]

//通过Storyboard ID 在对应Storyboard中获取场景对象
#define kVCFromSb(VCID, SbName)     [[UIStoryboard storyboardWithName:SbName bundle:nil] instantiateViewControllerWithIdentifier:VCID]

//移除iOS7之后，cell默认左侧的分割线边距
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\

//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject