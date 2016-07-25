//
//  BGMeViewController.m
//  WCProject
//
//  Created by dangMac on 16/7/23.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGMeViewController.h"
#import "wcHeader.h"
#import "ZJCircularBtn.h"


@interface BGMeViewController ()<ZJCircularBtnDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *scoreNum;
@property (weak, nonatomic) IBOutlet UIView *bottomBgView;

@property (nonatomic,strong) ZJCircularBtn *circlarBtn;


@end

@implementation BGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self navigationStyle];
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)setUI{
   // self.lookBtn.layer.cornerRadius = 25;
    
    self.headImageView.layer.cornerRadius=60/2;
    self.headImageView.layer.masksToBounds = YES;
 
    self.circlarBtn = [[ZJCircularBtn alloc] init];
    self.circlarBtn.delegate = self;
    CGPoint point = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height-100-64-150-64);
    [self.circlarBtn createCircularBtnWithBtnNum:4 center:point raiuds:90 btnRaiuds:100 btnImages:nil titleArray:@[@"发起的团",@"参与的团",@"待评价",@"反馈"] superView:self.bottomBgView];
    
    //[self.bottomBgView addSubview:self.self.circlarBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)navigationStyle{
    self.title = @"我";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:245.0/255 green:228.0/255 blue:0 alpha:1.0];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}


- (void)viewWillDisappear:(BOOL)animated{

}

- (void)clickCircularBtnNum:(NSInteger)num{
    NSLog(@"====");
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
