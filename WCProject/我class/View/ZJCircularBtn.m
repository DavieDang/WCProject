//
//  ZJCircularBtn.m
//  CircularBtn
//
//  Created by zhuoyue on 16/3/14.
//  Copyright © 2016年 YZ. All rights reserved.
//

#import "ZJCircularBtn.h"

@implementation ZJCircularBtn

-(void)createCircularBtnWithBtnNum:(NSInteger)btnNum center:(CGPoint)center raiuds:(CGFloat)raiuds btnRaiuds:(CGFloat)btnRaiuds btnImages:(NSArray *)imageArray titleArray:(NSArray *)titleArray superView:(UIView *)superView{
    
    for (int i = 0; i < btnNum; i++) {
        
        CGFloat x = raiuds*(cosf(M_PI_2 +(i - 1)*M_PI*2/btnNum));
        
        CGFloat y = raiuds*(sinf(M_PI_2 +(i - 1)*M_PI*2/btnNum));
        
        CGPoint point1 = CGPointMake(center.x - x,center.y - y);
        
        UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        subBtn.frame = CGRectMake(0, 0, btnRaiuds, btnRaiuds);
        
        if (titleArray.count > i) {
            
            [subBtn setTitle:titleArray[i] forState:UIControlStateNormal];
            
        }else{
            
            [subBtn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];

        }
        subBtn.tag = i;
        [subBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        subBtn.backgroundColor = [UIColor colorWithRed:245.0/255 green:228.0/255 blue:0 alpha:1.0];
        subBtn.center = point1;
        subBtn.layer.masksToBounds = YES;
        subBtn.layer.cornerRadius = subBtn.frame.size.width/2;
        [superView addSubview:subBtn];
    }

}

-(void)clickBtn:(UIButton *)btn{
    
    [self.delegate clickCircularBtnNum:btn.tag];

}


@end
