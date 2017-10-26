//
//  HSCategoryViewController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSCategoryViewController.h"
#import "HSSetTableInfoController.h"
#import "UIViewController+HSSetTableView.h"
@interface HSCategoryViewController ()

@end

@implementation HSCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    self.title = @"个人信息";
    
    [self initSetTableViewConfigureStyle:UITableViewStylePlain];
    
    
    //头像
    UIImage *icon = [UIImage imageNamed:@"ic_icon_header"];
    HSImageCellModel *header = [[HSImageCellModel alloc] initWithTitle:@"头像" placeholderImage:icon imageUrl:nil actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:^(HSBaseCellModel *cellModel) {
        HSLog(@"点击头像--%@",cellModel)
    }];
    
    //名字
    HSTextCellModel *name = [[HSTextCellModel alloc] initWithTitle:@"名字" detailText:@"人名的名义" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    
    
    //微信号
    HSTextCellModel *number = [[HSTextCellModel alloc] initWithTitle:@"微信号" detailText:@"HSSetTableView" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    number.selectionStyle = UITableViewCellSelectionStyleNone;
    number.showArrow = NO;
    
    //我的二维码
    UIImage *image = [UIImage imageNamed:@"ic_icon_qrCode"];
    HSImageCellModel *qrCode = [[HSImageCellModel alloc] initWithTitle:@"我的二维码" placeholderImage:image imageUrl:nil actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:nil];
    qrCode.imageSize = CGSizeMake(15, 15);
    qrCode.cellHeight = HS_KCellHeight;
    
    //我的地址
    HSTitleCellModel *address = [[HSTitleCellModel alloc] initWithTitle:@"我的地址" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    //性别
    HSTextCellModel *sex = [[HSTextCellModel alloc] initWithTitle:@"性别" detailText:@"男" actionBlock:nil];
    
    //地区
    HSTextCellModel *area = [[HSTextCellModel alloc] initWithTitle:@"地区" detailText:@"四川 成都" actionBlock:nil];
    //
    //
    //个性签名
    HSTextCellModel *sign = [[HSTextCellModel alloc] initWithTitle:@"签名" detailText:@"气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹" actionBlock:nil];
    //    sign.controlRightOffset = 30;
    //    sign.arrowControlRightOffset = 50;
    
    
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:header,name,number,qrCode,address, nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:area,sex,sign,nil];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
    [self.hs_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%@销毁",self.class);
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
