//
//  BGJoinViewController.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/28.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGJoinViewController.h"
#import "BSCommentCell4.h"
#import "wcHeader.h"

@interface BGJoinViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation BGJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.hidden = NO;
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
    
    
    BSCommentCell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.headImageView.image = [UIImage imageNamed:@"caiicon.jpg"];
    cell.nameLabel.text = @"吃货";
    //  cell.commentLabel.text = @"很好很好6666666";
    //cell.bgStarView.hidden = NO;
    // cell.starView.scorePercent = 0.4;
    cell.dateLabel.text = @"2016-07-25";
    cell.timeLabel.text = @"开团人数";
     cell.joinLabel.text = @"已参加人数";
    [cell.yueBtn addTarget:self action:@selector(yueBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
    
    
    
    
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:[BSCommentCell4 class] forCellReuseIdentifier:@"Cell"];
        
        _tableView.frame = CGRectMake(0, 64, kcScreenWidth, kcScreenHeight);
        
        [self.view addSubview:_tableView];
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
    }
    return _tableView;
}


- (void)yueBtnEvent{
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
