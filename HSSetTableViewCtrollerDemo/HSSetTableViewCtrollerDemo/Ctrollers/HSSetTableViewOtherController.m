//
//  HSSetTableViewOtherController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableViewOtherController.h"
#import "HSSetTableViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
@interface HSSetTableViewOtherController ()

@property (nonatomic, strong)HSImageCellModel *cell4;  ///<

@end

@implementation HSSetTableViewOtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    
    __weak __typeof(&*self)weakSelf = self;
    
    HSBaseCellModel *cell0 = [[HSBaseCellModel alloc] initWithTitle:@"分割线从0开始" actionBlock:^(HSBaseCellModel *model) {
        NSLog(@"点击事件");
    }];
    
    cell0.separateOffset = 0;
    cell0.separateHeight = 2;
    cell0.separateColor = [UIColor redColor];
    
    
    HSBaseCellModel *cell1 = [[HSBaseCellModel alloc] initWithTitle:@"标题颜色和字体" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    cell1.titleFont = [UIFont boldSystemFontOfSize:20];
    cell1.titleColor = [UIColor redColor];
    
    //详细文本
    __block BOOL update = YES;
    
    HSTextCellModel *cell2 = [[HSTextCellModel alloc] initWithTitle:@"文本更新" detailText:@"加班加到口吐二两鲜血" actionBlock:^(HSBaseCellModel *model) {
        HSTextCellModel *detailModel = (HSTextCellModel *)model;
        detailModel.detailText = (update == YES?@"加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血":@"加班加到口吐二两鲜血");
        [weakSelf updateCellModel:detailModel];
        update = !update;
    }];
    cell2.arrowWidth = 30;
    cell2.arrowHeight = 20;
    cell2.arrowImage = [UIImage imageNamed:@"MoreMyBankCard"];
    cell2.leftPading = 100;
    cell2.detailFont = [UIFont boldSystemFontOfSize:20];
    cell2.detailColor = [UIColor blueColor];
    
    
    
    
    
    HSSwitchCellModel *cell3 = [[HSSwitchCellModel alloc] initWithTitle:@"开关控制" switchType:YES switchBlock:^(HSBaseCellModel *model, BOOL on) {
        HSLog(@"开关控制")
    }];
    cell3.switchScale = 0.5;
    
    //下载图片
    UIImage *placeHolder = [UIImage imageNamed:@"ic_icon_header"];
    HSImageCellModel *cell4 = [[HSImageCellModel alloc] initWithTitle:@"图片" placeholderImage:placeHolder imageUrl:@"http://scimg.jb51.net/170405/2-1F40522332a13.jpg" actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:^{
        
    }];
    cell4.controlRightOffset = 40;
    cell4.showArrow = YES;
    // cell4.arrowControlRightOffset = 15;
    self.cell4 = cell4;
    
    
    
    
    NSString *balance =@"88";
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"账户: %@元",balance]];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor]range:NSMakeRange(0,1)];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor]range:NSMakeRange(1,1)];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor]range:NSMakeRange(2,1)];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor]range:NSMakeRange(3,1)];
    
    NSString *detailbalance =@"详细内容";
    NSMutableAttributedString *detailaString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"账: %@元",detailbalance]];
    
    [detailaString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor]range:NSMakeRange(0, 1)];
    
    HSTextCellModel *cell6 = [[HSTextCellModel alloc] initWithAttributeTitle:aString detailAttributeText:detailaString actionBlock:nil];
    cell6.leftPading = 100;
    
    HSTextFieldCellModel *cell7 = [[HSTextFieldCellModel alloc] initWithTitle:@"文本框文本框文本框" placeholder:@"请输入" textFieldBlock:^(HSBaseCellModel *model, NSString *contentText) {
        HSLog(@"%@", contentText);
    }];
    cell7.adjustsFontSizeToFitWidth = YES;
    //    cell7.matchTwoDecimal = YES;
    cell7.maxLength = 10;
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:cell0,cell1,cell2, cell3,cell4,cell6,cell7,nil];
    //    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:cell6,nil];
    [self.hs_dataArry addObject:section0];
    [self.tableView reloadData];
}



- (void)dealloc
{
    NSLog(@"%@控制器销毁",self.class);
}



@end
