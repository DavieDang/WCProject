//
//  BGFirstDetailViewController.m
//  WCProject
//
//  Created by dangMac on 16/7/24.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGFirstDetailViewController.h"
#import "BGFirstDetailCell.h"
#import "wcHeader.h"
#import "BGHeaderView.h"

static NSString *const Identifier = @"Cell";

@interface BGFirstDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UITabBarDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)  BGHeaderView *headerView;

@property (nonatomic,strong) NSMutableArray *headArray;

@end

@implementation BGFirstDetailViewController


- (BGHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[BGHeaderView alloc] initWithFrame:CGRectZero];
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.memuImageView.image = [UIImage imageNamed:@"bg_share"];
        _headerView.nameLb.text = @"美味通";
        _headerView.numLb.text = @"就餐人数：12";
        _headerView.starView.scorePercent = 0.2;
        _headerView.yueLb.text = @"约";
        
//        [self.view addSubview:_headerView];
//        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.mas_equalTo(0);
//            make.top.mas_equalTo(0);
//            make.height.mas_equalTo(200);
//        }];
    }
    return _headerView;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:[BGFirstDetailCell class] forCellReuseIdentifier:Identifier];
        
        _tableView.frame = CGRectMake(0, 0, kcScreenWidth, kcScreenHeight);
        
        [self.view addSubview:_tableView];
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.alpha = 1.0;
    self.tableView.hidden = NO;
  //  self.headerView.hidden = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -----tableDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BGFirstDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    cell.groupName.text = @"团123";
    
    self.headArray = [NSMutableArray array];
    [self.headArray addObject:@"aa"];
    [self.headArray addObject:@"aaf"];
    [self.headArray addObject:@"aaff"];
    cell.headArr = self.headArray;
    cell.headerbgView.hidden = NO;
   //[cell headerbgViewWith:self.headArray];
    
   
    [cell.yueBtn addTarget:self action:@selector(yueEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}

- (void)yueEvent:(UIButton *)sender{
    BGFirstDetailCell *cell = (BGFirstDetailCell *)[[sender superview] superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    //[self.headArray addObject:@"fff"];
    
    [cell.headArr addObject:@"fff"];
    
    //[self.tableView reloadData];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];

    [cell reloadmyData:self.headArray];
    NSLog(@"=======%ld",cell.headArr.count);
    
   
 
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
