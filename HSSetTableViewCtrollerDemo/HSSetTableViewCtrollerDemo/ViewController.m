//
//  ViewController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/22.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "ViewController.h"
#import "HSSetTableViewMeController.h"
#import "HSSetTableInfoController.h"
#import "HSSetTableViewOtherController.h"
#import "HSSetTableViewQQController.h"
#import "HSSetTableViewCustomController.h"
#import "HSZhiHuTableViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak)UITableView *tableView;  ///<
@property (nonatomic, strong)NSArray *dataSource;  ///<
@property (nonatomic, strong)NSArray *classSource;  ///<

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HSSetTableViewControllerDemo";
    
    CGRect frame = self.view.bounds;
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource =self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_x_Max){
        tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    
//    tableView.cellLayoutMarginsFollowReadableWidth  = NO;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    self.dataSource = @[@"我(仿微信)",@"个人信息(仿微信)",@"复杂界面(更新)",@"个人资料(QQ)",@"统一风格(自定义)",@"知乎(包含自定义cell)"];
    self.classSource = @[@"HSSetTableViewMeController",@"HSSetTableInfoController",@"HSSetTableViewOtherController",@"HSSetTableViewQQController",@"HSSetTableViewCustomController",@"HSZhiHuTableViewController"];
}

- (NSArray *)dataSource
{
    if(_dataSource == nil){
        _dataSource = [NSArray array];
    }
    return _dataSource;
}

- (NSArray *)classSource
{
    if(_classSource == nil){
        _classSource = [NSArray new];
    }
    return _classSource;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *ctroller = [self.classSource objectAtIndex:indexPath.row];
    Class class = NSClassFromString(ctroller);
    UIViewController *view = [[class alloc] init];
    view.title = [self.dataSource objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:view animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
