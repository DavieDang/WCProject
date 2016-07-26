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

@property (weak, nonatomic) IBOutlet UIButton *startGroupBtn;
@property (weak, nonatomic) IBOutlet UIButton *joinGroupBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *keHuBtn;

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
    
    
    //附加毛玻璃效果
//    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectview.frame = self.view.bounds;
//    [self.bottomBgView addSubview:effectview];
    

    
    self.headImageView.layer.cornerRadius=60/2;
    self.headImageView.layer.masksToBounds = YES;
    
    
    
     self.startGroupBtn.layer.cornerRadius=10;
    self.startGroupBtn.layer.masksToBounds = YES;
    
    self.joinGroupBtn.layer.cornerRadius=10;
    self.joinGroupBtn.layer.masksToBounds = YES;
    
    self.commentBtn.layer.cornerRadius=10;
    self.commentBtn.layer.masksToBounds = YES;
    
    self.keHuBtn.layer.cornerRadius=10;
    self.keHuBtn.layer.masksToBounds = YES;
    

 
//    self.circlarBtn = [[ZJCircularBtn alloc] init];
//    self.circlarBtn.delegate = self;
//    CGPoint point = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height-100-64-150-64);
//    [self.circlarBtn createCircularBtnWithBtnNum:4 center:point raiuds:90 btnRaiuds:100 btnImages:nil titleArray:@[@"发起的团",@"参与的团",@"待评价",@"反馈"] superView:self.bottomBgView];
    
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


- (void)clickCircularBtnNum:(NSInteger)num{
    NSLog(@"====");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    
}

- (IBAction)startEvent:(id)sender {
}
- (IBAction)joinEvent:(id)sender {
}
- (IBAction)commentEvent:(id)sender {
}
- (IBAction)keFuEvent:(id)sender {
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
