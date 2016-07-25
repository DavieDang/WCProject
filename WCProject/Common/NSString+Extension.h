//
//  NSString+Extension.h
//  
//
//  Created by apple on 14-10-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH;
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;

/**
 *  判断string是否为空
 *
 *  @param string string
 *
 *  @return bool
 */
- (BOOL) isBlankString;

/**
 *  字符创不为空
 *
 *  @param string
 *
 *  @return
 */
-(BOOL)isNotBlankString;


@end
