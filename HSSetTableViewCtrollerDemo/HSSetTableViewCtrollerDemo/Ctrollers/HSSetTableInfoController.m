//
//  HSSetTableInfoController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableInfoController.h"
#import "HSSetTableViewController.h"
@interface HSSetTableInfoController ()

@end

@implementation HSSetTableInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    self.title = @"个人信息";
    
    //头像
    UIImage *icon = [UIImage imageNamed:@"ic_icon_header"];
    HSImageCellModel *header = [[HSImageCellModel alloc] initWithTitle:@"头像" placeHoldImage:nil bigImage:icon actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:^{
        
    }];
    //名字
    HSTextCellModel *name = [[HSTextCellModel alloc] initWithTitle:@"名字" detailText:@"人名的名义" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    
    
    //微信号
    HSTextCellModel *number = [[HSTextCellModel alloc] initWithTitle:@"微信号" detailText:@"HSSetTableView" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    number.isCanClick = NO;
    number.showArrow = NO;
    
    //我的二维码
    UIImage *image = [UIImage imageNamed:@"ic_icon_qrCode"];
    HSImageCellModel *qrCode = [[HSImageCellModel alloc] initWithTitle:@"我的二维码" placeHoldImage:nil bigImage:image actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:^{
        
    }];
    qrCode.imageWidth = 15;
    qrCode.imageHieght = 15;
    qrCode.cellHeight = HS_KCellHeight;
    
    //我的地址
    HSBaseCellModel *address = [[HSBaseCellModel alloc] initWithTitle:@"我的地址" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    //性别
    HSTextCellModel *sex = [[HSTextCellModel alloc] initWithTitle:@"性别" detailText:@"男" actionBlock:nil];
    
    //地区
    HSTextCellModel *area = [[HSTextCellModel alloc] initWithTitle:@"地区" detailText:@"四川 成都" actionBlock:nil];
    
    
    //个性签名
    HSTextCellModel *sign = [[HSTextCellModel alloc] initWithTitle:@"签名" detailText:@"气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹" actionBlock:nil];
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:header,name,number,qrCode,address, nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:sex,area,sign,nil];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];

}

#pragma mark tableView代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    [view setBackgroundColor:[UIColor hs_colorWithHexString:@"#EBEDEF"]];
    return view;
}

- (void)dealloc
{
    HSLog(@"控制器销毁")
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
