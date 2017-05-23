//
//  HSSetTableViewMeController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableViewMeController.h"
#import "HSSetTableViewController.h"
@interface HSSetTableViewMeController ()

@end

@implementation HSSetTableViewMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    
    HSBaseCellModel *photo = [[HSBaseCellModel alloc] initWithTitle:@"相册" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    photo.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    
    HSBaseCellModel *favorite = [[HSBaseCellModel alloc] initWithTitle:@"收藏" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击收藏")
    }];
    favorite.icon = [UIImage imageNamed:@"MoreMyFavorites"];
    
    
    HSBaseCellModel *wallet = [[HSBaseCellModel alloc] initWithTitle:@"钱包" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击钱包")
    }];
    wallet.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    
    
    HSBaseCellModel *expression = [[HSBaseCellModel alloc] initWithTitle:@"表情" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击表情")
    }];
    expression.icon = [UIImage imageNamed:@"MoreExpressionShops"];
    
    HSBaseCellModel *setting = [[HSBaseCellModel alloc] initWithTitle:@"设置" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击设置")
    }];
    setting.icon = [UIImage imageNamed:@"MoreExpressionShops"];
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:photo,favorite,wallet, nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:expression,nil];
    NSMutableArray *section2 = [NSMutableArray arrayWithObjects:setting,nil];

   // [self.hs_dataArry addObject:photo];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
    [self.hs_dataArry addObject:section2];
    [self.tableView reloadData];
    
    self.tableView.tableHeaderView = [self viewTableHeader];

}

- (UIView *)viewTableHeader
{
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 100)];
    [viewHeader setBackgroundColor:[UIColor redColor]];
    return viewHeader;
}

#pragma mark tableView代理方法,重写基类footer方法
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [view setBackgroundColor:[UIColor hs_colorWithHexString:@"#EBEDEF"]];
    return view;
}

- (void)dealloc
{
    NSLog(@"%@控制器销毁",self.class);
}


@end
