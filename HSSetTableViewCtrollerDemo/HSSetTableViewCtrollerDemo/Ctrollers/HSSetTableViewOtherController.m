//
//  HSSetTableViewOtherController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableViewOtherController.h"
#import "HSSetTableViewControllerHeader.h"
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
        
    }];
    cell0.noSeparateOffset = YES;
    
    
    
    HSBaseCellModel *cell1 = [[HSBaseCellModel alloc] initWithTitle:@"标题颜色和字体" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    cell1.titleFont = [UIFont boldSystemFontOfSize:20];
    cell1.titleColor = [UIColor redColor];
    
    //详细文本
    __block BOOL update = YES;
    
    HSTextRightModel *cell2 = [[HSTextRightModel alloc] initWithTitle:@"文本更新" detailText:@"加班加到口吐二两鲜血" actionBlock:^(HSBaseCellModel *model) {
        HSTextRightModel *detailModel = (HSTextRightModel *)model;
        detailModel.detailText = (update == YES?@"加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血加班加到口吐二两鲜血":@"加班加到口吐二两鲜血");
        [weakSelf updateCellModel:detailModel];
        update = !update;
    }];
    
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
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:cell0,cell1,cell2, cell3,cell4,nil];
    [self.hs_dataArry addObject:section0];
    

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



@end
