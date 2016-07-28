//
//  BGCommentViewController.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/28.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BGCommentViewController.h"
#import "XWCatergoryView.h"
#import "UICollectionViewFlowLayout+XWFullItem.h"
#import "XWCatergoryViewCell.h"
#import "wcHeader.h"
#import "BSCommentCell1.h"
#import "BSCommentCell2.h"

static NSString *const Identifier2 = @"Cell2";
static NSString *const Identifier3 = @"Cell3";

@interface BGCommentViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,XWCatergoryViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) XWCatergoryView * catergoryView;
@property (nonatomic,strong) UICollectionView *mainView;
@property (nonatomic,strong)  UITableView *tableView;
@property (nonatomic,strong)  UITableView *tableView2;
@end

@implementation BGCommentViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[BSCommentCell1 class] forCellReuseIdentifier:Identifier2];
        
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (UITableView *)tableView2{
    if (!_tableView2) {
        _tableView2 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView2.delegate = self;
        _tableView2.dataSource = self;
        
        [_tableView2 registerClass:[BSCommentCell2 class] forCellReuseIdentifier:Identifier3];
        
        _tableView2.tableFooterView = [[UIView alloc] init];
        _tableView2.backgroundColor = [UIColor whiteColor];
    }
    return _tableView2;
}


- (UICollectionView *)mainView{
    if (!_mainView) {
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.fullItem = YES;
        _mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainView.backgroundColor = [UIColor whiteColor];
        _mainView.dataSource = self;
        _mainView.delegate = self;
        _mainView.pagingEnabled = YES;
        _mainView.scrollsToTop = NO;
        _mainView.showsHorizontalScrollIndicator = NO;
        
        [_mainView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [self.view addSubview:_mainView];
        [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.catergoryView.mas_bottom);
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        
    }
    return _mainView;
}

- (XWCatergoryView *)catergoryView{
    if (!_catergoryView) {
        _catergoryView = [[XWCatergoryView alloc] initWithFrame:CGRectZero];
        //必须设置titles数据源
        _catergoryView.titles = @[@"待评论",@"已评论"];
        //必须设置关联的scrollview
        _catergoryView.scrollView = self.mainView;
        //代理坚挺点击;
        _catergoryView.delegate = self;
        //设置文字左右渐变
        _catergoryView.titleColorChangeGradually = YES;
        //开启底部线条
        _catergoryView.bottomLineEable = YES;
        _catergoryView.titleColor = [UIColor colorWithRed:40.0/255 green:49.0/255 blue:42.0/255 alpha:1.0];
        _catergoryView.titleFont = [UIFont boldSystemFontOfSize:15];
        //左右边距
        _catergoryView.edgeSpacing = 70;
        _catergoryView.titleSelectColor = [UIColor colorWithRed:228.0/255 green:96.0/255 blue:24.0/255.0 alpha:1.0];
        _catergoryView.bottomLineColor = [UIColor colorWithRed:228.0/255 green:96.0/255 blue:24.0/255.0 alpha:1.0];
        
        
        //设置底部线条距离item底部的距离
        _catergoryView.bottomLineSpacingFromTitleBottom = 8;
        
        //禁用点击item滚动scrollView的动画
        _catergoryView.scrollWithAnimaitonWhenClicked = NO;
        _catergoryView.backgroundColor = [UIColor whiteColor];
        _catergoryView.titleColorChangeGradually = YES;
        _catergoryView.backEllipseEable = NO;
        _catergoryView.defaultIndex = 0;
        [self.view addSubview:_catergoryView];
        [_catergoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
            make.top.mas_equalTo(64);
        }];
        
    }
    
    return _catergoryView;
}
#pragma mark ----- collectionView（代理）

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        
        self.automaticallyAdjustsScrollViewInsets = YES;
        [cell.contentView  addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        return cell;
    }
    if (indexPath.row == 1) {
        
        [cell.contentView  addSubview:self.tableView2];
        [self.tableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        return cell;
    }
    
    return cell;
}

#pragma mark -----tableDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.tableView) {
        BSCommentCell1 *cell = [tableView dequeueReusableCellWithIdentifier:Identifier2 forIndexPath:indexPath];
        cell.headImageView.image = [UIImage imageNamed:@"caiicon.jpg"];
        cell.nameLabel.text = @"吃货";
      //  cell.commentLabel.text = @"很好很好6666666";
        //cell.bgStarView.hidden = NO;
       // cell.starView.scorePercent = 0.4;
        cell.dateLabel.text = @"2016-07-25";
        cell.timeLabel.text = @"开团人数";
        [cell.yueBtn addTarget:self action:@selector(yueBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;

    }else{
        
        BSCommentCell2 *cell = [tableView dequeueReusableCellWithIdentifier:Identifier3 forIndexPath:indexPath];
        cell.headImageView.image = [UIImage imageNamed:@"caiicon.jpg"];
        cell.nameLabel.text = @"吃货";
        cell.commentLabel.text = @"很好很好6666666";
        cell.bgStarView.hidden = NO;
        cell.starView.scorePercent = 0.4;
        cell.dateLabel.text = @"2016-07-25";
        
        

        return cell;
    }
    
        
    return nil;
    
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainView.hidden = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (void)yueBtnEvent{
    
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
