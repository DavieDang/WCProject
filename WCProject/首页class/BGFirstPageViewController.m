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

@interface BGFirstPageViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)  UITextView *textView;
@property (nonatomic,strong)   UISearchBar *search;

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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.search resignFirstResponder];
}

-(void)navigationStyle{

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:245.0/255 green:228.0/255 blue:0 alpha:1.0];
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_alert"] style:UIBarButtonItemStyleDone target:self action:@selector(message)];
    [messageItem setTintColor:[UIColor blueColor]];
    self.navigationItem.rightBarButtonItem = messageItem;
    
    UIView *naCenterView = [UIView new];
    naCenterView.backgroundColor = [UIColor whiteColor];
    naCenterView.frame = CGRectMake(0, 0, 200, 50);
    
   // self.automaticallyAdjustsScrollViewInsets = NO;

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    self.search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 50)];
    self.search.delegate = self;
    _search.placeholder = @"输入附近的餐厅名";
    
    return self.search;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

#pragma mark -- 点击事件


- (void)message{
    NSLog(@"提醒消息");
}

- (IBAction)lookCanteen:(id)sender {
    
     [self.navigationController pushViewController:[BGFirstDetailViewController new] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationStyle];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
 
    
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    NSMutableArray *addarray = [NSMutableArray array];
    NSString *searchTexte = self.search.text;
    NSMutableArray *searchResults = addarray;
    
    // strip out all the leading and trailing spaces
    NSString *strippedString = [searchTexte stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // break up the search terms (separated by spaces)
    NSArray *searchItems = nil;
    if (strippedString.length > 0) {
        searchItems = [strippedString componentsSeparatedByString:@" "];
    }
    
    // build all the "AND" expressions for each value in the searchString
    //
    NSMutableArray *andMatchPredicates = [NSMutableArray array];
    
    for (NSString *searchString in searchItems) {
        // each searchString creates an OR predicate for: name, id
        //
        // example if searchItems contains "iphone 599 2007":
        //      name CONTAINS[c] "lanmaq"
        //      id CONTAINS[c] "1568689942"
        NSMutableArray *searchItemsPredicate = [NSMutableArray array];
        
        // use NSExpression represent expressions in predicates.
        // NSPredicate is made up of smaller, atomic parts: two NSExpressions (a left-hand value and a right-hand value)
        
        // friendName field matching
        NSExpression *lhs = [NSExpression expressionForKeyPath:@"name"];
        NSExpression *rhs = [NSExpression expressionForConstantValue:searchString];
        NSPredicate *finalPredicate = [NSComparisonPredicate
                                       predicateWithLeftExpression:lhs
                                       rightExpression:rhs
                                       modifier:NSDirectPredicateModifier
                                       type:NSContainsPredicateOperatorType
                                       options:NSCaseInsensitivePredicateOption];
        [searchItemsPredicate addObject:finalPredicate];
        
        // friendId field matching
        
        lhs = [NSExpression expressionForKeyPath:@"address"];
        rhs = [NSExpression expressionForConstantValue:searchString];
        finalPredicate = [NSComparisonPredicate
                          predicateWithLeftExpression:lhs
                          rightExpression:rhs
                          modifier:NSDirectPredicateModifier
                          type:NSContainsPredicateOperatorType
                          options:NSCaseInsensitivePredicateOption];
        [searchItemsPredicate addObject:finalPredicate];
        
        
        
        // at this OR predicate to our master AND predicate
        NSCompoundPredicate *orMatchPredicates = [NSCompoundPredicate orPredicateWithSubpredicates:searchItemsPredicate];
        [andMatchPredicates addObject:orMatchPredicates];
    }
    
    // match up the fields of the Product object
    NSCompoundPredicate *finalCompoundPredicate =
    [NSCompoundPredicate andPredicateWithSubpredicates:andMatchPredicates];
    searchResults = [[searchResults filteredArrayUsingPredicate:finalCompoundPredicate] mutableCopy];
    
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
