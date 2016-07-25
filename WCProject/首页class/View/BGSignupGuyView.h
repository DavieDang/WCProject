//
//  BGSignupGuyView.h
//  companyScholl
//
//  Created by chensb on 16/6/3.
//  Copyright © 2016年 chensb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGSignupGuyView : UIView

@property (nonatomic,strong) NSMutableArray *signupGuys;

@property (nonatomic,copy) void(^showGuysBlock)(NSString *);

@end
