//
//  BGSignupGuyView.m
//  companyScholl
//
//  Created by chensb on 16/6/3.
//  Copyright © 2016年 chensb. All rights reserved.
//

#import "BGSignupGuyView.h"
#import "wcHeader.h"

#define GuyViewWidth 44
#define RightViewWidth 72

@class BGGuyView;

@interface BGSignupGuyView()

@property (nonatomic,weak) UIView *rightView;

@property (nonatomic,weak) UILabel *countLabel;

//@property (nonatomic,weak) UILabel *titleLabel;

@property (nonatomic,strong) NSMutableArray *signupGuyViews;

@end

@implementation BGSignupGuyView

-(NSMutableArray *)signupGuyViews
{
    if (!_signupGuys) {
        _signupGuys = [NSMutableArray array];
        NSInteger guyViewsCount = kcScreenWidth - 12 - RightViewWidth - 7;
        for (int i=0; i<guyViewsCount/GuyViewWidth; i++)
        {
           // [_signupGuys addObject:[BGGuyView new]];
        }
    }
    
    return _signupGuys;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.width = kcScreenWidth;
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
        
    }
    return self;
}



-(void)setupUI
{
//    UILabel *titleLabel = [[UILabel alloc]init];
//    titleLabel.text = @"TA 们报名了这次培训";
//    titleLabel.textColor = APPNormalColor;
//    titleLabel.font = SBSystemFont(16);
//    
//    titleLabel.left = APPMagin;
//    titleLabel.top = 14;
//    titleLabel.size = LabelSize(titleLabel);
//    titleLabel.width = self.width;
//    [self addSubview:titleLabel];
//    self.titleLabel = titleLabel;
    
    
    UIView *rightView = [[UIView alloc]init];
    rightView.width = RightViewWidth;
//    rightView.height = GuyIconWH;
//    rightView.left = self.width - rightView.width - APPMagin;
    rightView.top = 10;
    self.rightView = rightView;
    
    //添加 手势，点击事件
    UITapGestureRecognizer *recognazer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showSignupGuys:)];
    [rightView addGestureRecognizer:recognazer];
    
    
    UIImageView *arrawView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cs_icon_more"]];
    arrawView.contentMode = UIViewContentModeCenter;
    arrawView.height = rightView.height;
    arrawView.left = rightView.width - arrawView.width;
    [rightView addSubview:arrawView];
    
    UILabel *countLabel = [[UILabel alloc]init];
    countLabel.textAlignment = NSTextAlignmentRight;
    countLabel.textColor = [UIColor blackColor];
    countLabel.font = SBSystemFont(14);
    countLabel.left = 0;
    countLabel.width = arrawView.left - 10;
    countLabel.height = rightView.height;
    self.countLabel = countLabel;
    [rightView addSubview:countLabel];
    
    [self addSubview:rightView];
}

-(void)setSignupGuys:(NSMutableArray *)signupGuys
{
    _signupGuys = signupGuys;
    
    //计算右边view的大小
    NSString *countStr = [NSString stringWithFormat:@"%ld人",20l];
    self.countLabel.text = countStr;
    
    //排布报名人控件
    //将控件上所有头像都移除
    for (BGGuyView *guyView in self.signupGuyViews)
    {
 //       [guyView removeFromSuperview];
    }
    
 //   CGFloat top = CGRectGetMaxY(self.titleLabel.frame);
    CGFloat maxX = 7;
    CGFloat maxY = 0;
    
    NSInteger count = 10;
    if (count > self.signupGuyViews.count) {
        count = self.signupGuyViews.count;
    }
    
    for (int i=0;i<count;i++)
    {
        BGGuyView *guyView = self.signupGuyViews[i];
//        guyView.name = @"Spencer";
//        guyView.left = maxX;
//        guyView.top = top;
//        maxX = CGRectGetMaxX(guyView.frame);
        
        [self addSubview:guyView];
    
//        if (CGRectGetMaxY(guyView.frame) > maxY) {
//            maxY = CGRectGetMaxY(guyView.frame);
        }
    }
    
   // self.height = maxY;
    
//}

#pragma mark -报名的人
-(void)showSignupGuys:(UITapGestureRecognizer *)recognizer
{
    if (self.showGuysBlock)
    {
        self.showGuysBlock(@"3");
    }
}





@end
