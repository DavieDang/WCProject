//
//  WCTool.m
//  WCProject
//
//  Created by dangMac on 16/7/23.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "WCTool.h"

@implementation WCTool

+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
    
    // new size
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // 从上下文获取新的图片
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文 context
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
@end
