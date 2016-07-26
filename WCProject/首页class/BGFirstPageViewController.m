//
//  BGFirstPageViewController.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/21.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGFirstPageViewController.h"
#import "BGFirstPageViewCell.h"
#import "wcHeader.h"
#import "CWStarRateView.h"
#import "BGFirstDetailViewController.h"
#import "NaBarView.h"

static NSString *const Identifier = @"CELL";

@interface BGFirstPageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)  UITextView *textView;

@end

@implementation BGFirstPageViewController

#pragma mark-----tableView代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BGFirstPageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    //cell.headImageView.backgroundColor = [UIColor redColor];
    cell.peopleNumber.text = [NSString stringWithFormat:@"%d",15];
    cell.headImageView.image = [UIImage imageNamed:@"caiicon.jpg"];
    CWStarRateView *start = [[CWStarRateView alloc] initWithFrame:CGRectMake(0, -5, 90, 30) numberOfStars:5];
    start.userInteractionEnabled = NO;
    [cell.starView addSubview:start];
    start.scorePercent = 0.5;
    
    //cell.startIv.scorePercent = 0.2;
    //星星控件
    
    return cell;
    
}

-(void)navigationStyle{

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:245.0/255 green:228.0/255 blue:0 alpha:1.0];
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_alert"] style:UIBarButtonItemStyleDone target:self action:@selector(message)];
    [messageItem setTintColor:[UIColor blueColor]];
    self.navigationItem.rightBarButtonItem = messageItem;
    
    UIView *naCenterView = [UIView new];
    naCenterView.backgroundColor = [UIColor whiteColor];
    naCenterView.frame = CGRectMake(0, 0, 200, 50);
    
    
  //  [self.navigationController.navigationBar setHidden:YES];
    
//       self.textView = [[UITextView alloc] init];
//    
//        self.textView.backgroundColor = [UIColor redColor];
//    
//        [self.view addSubview:self.textView];
//        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(50);
//            make.left.mas_equalTo(30);
//            make.right.mas_equalTo(-30);
//            make.height.mas_equalTo(30);
//        }];
//    
//        self.textView.layer.cornerRadius = 15;
//        self.textView.layer.masksToBounds = YES;
    
   // self.navigationItem.titleView = naCenterView;
    
    
    
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.navigationController.navigationBar setHidden:YES];
//    NaBarView  *naview = [[NaBarView alloc] init];
//    naview.backgroundColor = appYellow;
//    [self.view addSubview:naview];
//    [naview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.mas_equalTo(0);
//        make.height.mas_equalTo(64);
//    }];
    
//   self.textView = [[UITextView alloc] init];
//  
//    [naview addSubview:self.textView];
//    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(naview.mas_top).offset(25);
//        make.left.mas_equalTo(naview.mas_left).offset(30);
//        make.right.mas_equalTo(-30);
//        make.height.mas_equalTo(30);
//    }];
//
//    self.textView.layer.cornerRadius = 15;
//    self.textView.layer.masksToBounds = YES;
    
    
  //  [naview.moreBtn addTarget:self action:@selector(message) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[BGFirstDetailViewController new] animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark -- 点击事件
- (void)message{
    NSLog(@"提醒消息");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationStyle];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
 
    
}


- (void)viewDidAppear:(BOOL)animated{
    self.textView = [[UITextView alloc] init];
    
    self.textView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(30);
    }];
    
    self.textView.layer.cornerRadius = 15;
    self.textView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textView resignFirstResponder];
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
