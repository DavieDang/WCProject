//
//  WCTool.h
//  WCProject
//
//  Created by dangMac on 16/7/23.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WCTool : NSObject

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

@end
