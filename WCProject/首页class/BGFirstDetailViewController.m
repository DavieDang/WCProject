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
#import "BSCommentCell.h"

static NSString *const Identifier = @"Cell";
static NSString *const Identifier2 = @"Cell2";

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
        [_tableView registerClass:[BSCommentCell class] forCellReuseIdentifier:Identifier2];
        
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
    [self setNavigationStyle];
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
    
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        BGFirstDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
        cell.groupName.text = @"团123";
        
        self.headArray = [NSMutableArray array];
        [self.headArray addObject:@"aa"];
        [self.headArray addObject:@"aaf"];
        [self.headArray addObject:@"aaff"];
        cell.headArr = self.headArray;
        cell.headerbgView.hidden = NO;
        
        
        
        [cell.yueBtn addTarget:self action:@selector(yueEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else{
        
        BSCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier2 forIndexPath:indexPath];
        cell.headImageView.image = [UIImage imageNamed:@"caiicon.jpg"];
        cell.nameLabel.text = @"吃货";
        cell.commentLabel.text = @"很好很好6666666";
        cell.bgStarView.hidden = NO;
        cell.starView.scorePercent = 0.4;
        cell.dateLabel.text = @"2016-07-25";
        
        
        return cell;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 90;
    }else{
        
        return 100;
    }
    
    
  
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.headerView;
    }else{
    
    UIView *commentLbView = [UIView new];
        commentLbView.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1.0];
    UILabel *label = [UILabel new];
    label.text = @"全部评论";
        label.font = [UIFont systemFontOfSize:15];
    [commentLbView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.mas_equalTo(commentLbView);
    }];
    
    return commentLbView;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        
        return 200;
    }else{
        
        return 30;
    }
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (void)yueEvent:(UIButton *)sender{
    BGFirstDetailCell *cell = (BGFirstDetailCell *)[[sender superview] superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    
    [cell.headArr addObject:@"fff"];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];

    [cell reloadmyData:self.headArray];
    NSLog(@"=======%ld",cell.headArr.count);
    
 
}


#pragma mark--导航栏

- (void)setNavigationStyle{
    

    self.navigationItem.backBarButtonItem.image = [UIImage imageNamed:@"Back"];
    self.navigationItem.backBarButtonItem.title = @"返回";
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
