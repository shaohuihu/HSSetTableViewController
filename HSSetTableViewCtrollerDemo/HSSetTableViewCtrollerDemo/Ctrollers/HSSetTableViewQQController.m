//
//  HSSetTableViewQQController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/5/8.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableViewQQController.h"
#import "HSSetTableViewController.h"
@interface HSSetTableViewQQController ()

@end

@implementation HSSetTableViewQQController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    
    //头像
    UIImage *image = [UIImage imageNamed:@"ic_icon_photo"];
    HSImageCellModel *head = [[HSImageCellModel alloc] initWithTitle:@"账号管理" placeholderImage:image imageUrl:nil actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:nil];
    head.imageSize = CGSizeMake(30.0f, 30.0f);
    head.cornerRadius = 15;
    head.cellHeight = HS_KCellHeight;
    
   
    
    //手机号码
    NSMutableAttributedString *allString = [[NSMutableAttributedString alloc] init];
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:@"ic_icon_red"];
    attch.bounds = CGRectMake(0, 0, 9, 9);
    // 创建带有图片的富文本
    NSAttributedString *phoneString = [NSAttributedString attributedStringWithAttachment:attch];
    [allString appendAttributedString:phoneString];
    
    NSMutableAttributedString *numberString = [[NSMutableAttributedString alloc] initWithString:@" 186******38"];
    [numberString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(0, numberString.string.length)];
    [allString appendAttributedString:numberString];
    
    HSTextCellModel *phone = [[HSTextCellModel alloc] initWithTitle:@"手机号码" attributrDetailText:allString actionBlock:^(HSBaseCellModel *model) {
        
    }];
    //QQ达人
    allString = [[NSMutableAttributedString alloc] init];
    attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:@"ic_icon_super"];
    attch.bounds = CGRectMake(0, -2, 45, 16);
    // 创建带有图片的富文本
    phoneString = [NSAttributedString attributedStringWithAttachment:attch];
    [allString appendAttributedString:phoneString];
    
    NSMutableAttributedString *dayString = [[NSMutableAttributedString alloc] initWithString:@" 892天"];
    [dayString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:221/255.0f green:187/255.0 blue:107/255.0 alpha:1.0]} range:NSMakeRange(0, dayString.string.length)];
    [allString appendAttributedString:dayString];
    
    HSTextCellModel *superMan = [[HSTextCellModel alloc] initWithTitle:@"QQ达人" attributrDetailText:allString actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    //消息通知
    HSTitleCellModel *msg = [[HSTitleCellModel alloc] initWithTitle:@"消息通知" actionBlock:nil];
    //聊天记录
    HSTitleCellModel *record = [[HSTitleCellModel alloc] initWithTitle:@"聊天记录" actionBlock:nil];
    //空间清理
    HSTitleCellModel *clean = [[HSTitleCellModel alloc] initWithTitle:@"空间清理" actionBlock:nil];
    //消息通知
    HSTitleCellModel *security = [[HSTitleCellModel alloc] initWithTitle:@"账号、设备安全" actionBlock:nil];
    //聊天记录
    HSTitleCellModel *privacy = [[HSTitleCellModel alloc] initWithTitle:@"联系人、隐私" actionBlock:nil];
    //空间清理
    HSTitleCellModel *help = [[HSTitleCellModel alloc] initWithTitle:@"辅助功能" actionBlock:nil];
    //关于QQ与帮助
    HSTitleCellModel *about = [[HSTitleCellModel alloc] initWithTitle:@"关于QQ与帮助" actionBlock:nil];
    about.showArrow = NO;
    about.titleColor = [UIColor redColor];
    about.titileTextAlignment = NSTextAlignmentCenter;
    
    
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:head, phone,superMan,nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:msg, record,clean,nil];
    NSMutableArray *section2 = [NSMutableArray arrayWithObjects:security, privacy,help,nil];
    NSMutableArray *section3 = [NSMutableArray arrayWithObjects:about,nil];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
    [self.hs_dataArry addObject:section2];
    [self.hs_dataArry addObject:section3];
    [self.hs_tableView reloadData];
    
}

- (void)dealloc
{
    NSLog(@"%@控制器销毁",self.class);
}






@end
