//
//  mainTableViewController.m
//  KVO
//
//  Created by 小飞 on 16/8/6.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "mainTableViewController.h"
#import "student.h"
#import "resultTableViewController.h"
#import "AnimatayipnTableViewController.h"
#import "jianpantongzhi.h"
@interface mainTableViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic,strong)student *s;
@property (nonatomic,strong)NSMutableArray *arr;
@property (nonatomic,strong)UISearchController *search;
@property (nonatomic,strong)resultTableViewController *vc;
@end

@implementation mainTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr = (NSMutableArray *)[student studentMOdel];
    self.title = @"练习搜索";
    [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.vc = [[resultTableViewController alloc]init];
    self.search = [[UISearchController alloc]initWithSearchResultsController:self.vc];
//    设置所搜条的大小为自动适应
    [self.search.searchBar sizeToFit];
    self.tableView.tableHeaderView  = self.search.searchBar;
//  设置搜索类别
    self.search.searchBar.scopeButtonTitles = @[@"男",@"女"];
    self.search.searchBar.tintColor = [UIColor redColor];
//  设置搜索控制器代理对象
    self.search.searchResultsUpdater = self;
//  从当前表示图切换到搜索结果的表示图
    self.definesPresentationContext = YES;
    self.search.searchBar.delegate = self;
}



-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    [self updateSearchResultsForSearchController:self.search];
}

#pragma -mark UISearchResultsUpdating协议

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{

//    获取搜索框输入的搜索输入内容
    NSString *searchText = searchController.searchBar.text;
//    从委托方中获取获取用户线则的类别按钮
    NSInteger index = searchController.searchBar.selectedScopeButtonIndex;
    NSMutableArray *resultArr = [NSMutableArray array];
    for (student *p in self.arr)
    {
        NSRange range = [[NSString stringWithFormat:@"%ld",p.scro] rangeOfString:searchText];
        if (range.length && index == p.name)
        {
            [resultArr addObject:p];
        }
    }
    self.vc.resultArr = resultArr;
    [self.vc.tableView reloadData];
}








#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    student *s = self.arr[indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",s.scro];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    student *p = self.arr[indexPath.row];
    p.scro +=indexPath.row;
    [self.tableView reloadData];
    
    
    if (indexPath.row == 0)
    {
        AnimatayipnTableViewController *v = [AnimatayipnTableViewController new];
        [self.navigationController pushViewController:v animated:YES];
    }else if (indexPath.row == 1){
        jianpantongzhi *v = [jianpantongzhi new];
        [self.navigationController pushViewController:v animated:YES];
    }
}




@end
