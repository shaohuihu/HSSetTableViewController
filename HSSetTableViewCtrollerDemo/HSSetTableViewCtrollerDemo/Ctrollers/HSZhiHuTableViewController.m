//
//  HSZhiHuTableViewController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSZhiHuTableViewController.h"
#import "HSSetTableViewController.h"
#import "HSZhiHuCustomCellModel.h"
@interface HSZhiHuTableViewController ()

@end

@implementation HSZhiHuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    self.title = @"知乎设置界面";
    
//    //内置音效
    HSZhiHuCustomCellModel *sound = [[HSZhiHuCustomCellModel alloc] initWithCellIdentifier:@"HSZhiHuCustomTableViewCell" actionBlock:nil];
    sound.cellHeight = 60;
    sound.text = @"内置音效";
    sound.detailText = @"应用内按钮点击音效";
    sound.hideSwitch = NO;
    sound.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    HSZhiHuCustomCellModel *noIcon = [[HSZhiHuCustomCellModel alloc] initWithCellIdentifier:@"HSZhiHuCustomTableViewCell" actionBlock:nil];
    noIcon.cellHeight = 60;
    noIcon.text = @"无图模式";
    noIcon.detailText = @"使用wifi网络时不可下载图片";
    noIcon.hideSwitch = NO;
    noIcon.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    HSZhiHuCustomCellModel *titleFont = [[HSZhiHuCustomCellModel alloc] initWithCellIdentifier:@"HSZhiHuCustomTableViewCell" actionBlock:nil];
    titleFont.cellHeight = 60;
    titleFont.text = @"字体大小";
    titleFont.detailText = @"除回答与专栏正文页面以外的字体调节";
    titleFont.hideSwitch = YES;
    
    
    
    //消息通知
    HSTitleCellModel *msg = [[HSTitleCellModel alloc] initWithTitle:@"消息与邮件设置" actionBlock:nil];
    //聊天记录
    HSTitleCellModel *record = [[HSTitleCellModel alloc] initWithTitle:@"推送消息设置" actionBlock:nil];
    //空间清理
    HSTitleCellModel *clean = [[HSTitleCellModel alloc] initWithTitle:@"账号与安全" actionBlock:nil];
    //消息通知
    HSTitleCellModel *security = [[HSTitleCellModel alloc] initWithTitle:@"管理黑名单" actionBlock:nil];
    //聊天记录
    HSTextCellModel *privacy = [[HSTextCellModel alloc] initWithTitle:@"清除缓存" detailText:@"0.85M" actionBlock:nil];
    privacy.showArrow = NO;
    
    //空间清理
    HSTitleCellModel *help = [[HSTitleCellModel alloc] initWithTitle:@"知乎实验室" actionBlock:nil];
    //关于QQ与帮助
    HSTitleCellModel *about = [[HSTitleCellModel alloc] initWithTitle:@"退出我的账号" actionBlock:nil];
    about.showArrow = NO;
    about.titleColor = [UIColor redColor];
    about.titileTextAlignment = NSTextAlignmentCenter;
    
    NSMutableArray *section = [NSMutableArray arrayWithObjects:sound,noIcon,titleFont,nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:msg, record,nil];
    NSMutableArray *section2 = [NSMutableArray arrayWithObjects:clean,nil];
    NSMutableArray *section3 = [NSMutableArray arrayWithObjects:security, privacy,help,nil];
    NSMutableArray *section4 = [NSMutableArray arrayWithObjects:about,nil];
    [self.hs_dataArry addObject:section];
    [self.hs_dataArry addObject:section1];
    [self.hs_dataArry addObject:section2];
    [self.hs_dataArry addObject:section3];
    [self.hs_dataArry addObject:section4];
    [self.hs_tableView reloadData];
}


@end
