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
    
     __weak __typeof(&*self)weakSelf = self;
    
    HSBaseCellModel *cell0 = [[HSBaseCellModel alloc] initWithTitle:@"分割线从0开始" actionBlock:^(HSBaseCellModel *model) {
        NSLog(@"点击事件");
    }];
   
    cell0.noSeparateOffset = YES;
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
    
    //下载图片
    UIImage *placeHolder = [UIImage imageNamed:@"ic_icon_header"];
    HSImageCellModel *cell4 = [[HSImageCellModel alloc] initWithTitle:@"头像下载更新" placeHoldImage:placeHolder bigImage:nil actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:^{
        
    }];
    self.cell4 = cell4;
    
    
    HSTextCellModel *cell5 = [[HSTextCellModel alloc] initWithTitle:@"文本2" detailText:@"加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    cell5.leftPading = 250;
    cell5.detailColor = [UIColor redColor];
    
    
   
    
    NSString *balance =@"88";
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"账户: %@元",balance]];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor]range:NSMakeRange(0,1)];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor]range:NSMakeRange(1,1)];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor]range:NSMakeRange(2,1)];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor]range:NSMakeRange(3,1)];

    NSString *detailbalance =@"888888888888888888888888888888888888888888888888888";
    NSMutableAttributedString *detailaString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"账户余额: %@元",detailbalance]];
//    
//    [detailaString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor]range:NSMakeRange(0,1)];
//    
//    [detailaString addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor]range:NSMakeRange(1,1)];
//    
//    [detailaString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor]range:NSMakeRange(2,1)];
//    
//    [detailaString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor]range:NSMakeRange(3,1)];
    
//    [detailaString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15]range:NSMakeRange(6, 8)];
    
    //富文本标题
//    HSBaseCellModel *cell6 = [[HSBaseCellModel alloc] initWithAttributeTitle:aString actionBlock:nil];
    
    HSTextCellModel *cell6 = [[HSTextCellModel alloc] initWithAttributeTitle:aString detailAttributeText:detailaString actionBlock:nil];
    cell6.leftPading = 100;
    
    
    
//    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:cell0,cell1,cell2, cell3,cell4,cell5,cell6,nil];
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:cell6,nil];
    [self.hs_dataArry addObject:section0];
    [self.tableView reloadData];
    

    [self downloadImage];
}

- (void)downloadImage
{
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:@"http://scimg.jb51.net/170405/2-1F40522332a13.jpg"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        self.cell4.bigImage = image;
        [self updateCellModel:self.cell4];
    }];
}

- (void)dealloc
{
    NSLog(@"%@控制器销毁",self.class);
}



@end
