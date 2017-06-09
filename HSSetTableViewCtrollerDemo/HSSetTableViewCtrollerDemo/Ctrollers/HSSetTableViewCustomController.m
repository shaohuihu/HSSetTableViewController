//
//  HSSetTableViewCustomController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/5/23.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableViewCustomController.h"
#import "HSSetTableViewController.h"
@interface HSSetTableViewCustomController ()

@end

@implementation HSSetTableViewCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    
    HSTitleCellModel *photo = [[HSTitleCellModel alloc] initWithTitle:@"相册" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    photo.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    [self configureCellModel:&photo];
    
    HSTitleCellModel *favorite = [[HSTitleCellModel alloc] initWithTitle:@"收藏" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击收藏")
    }];
    favorite.icon = [UIImage imageNamed:@"MoreMyFavorites"];
    [self configureCellModel:&favorite];
    
    
    HSTitleCellModel *wallet = [[HSTitleCellModel alloc] initWithTitle:@"钱包" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击钱包")
    }];
    wallet.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    [self configureCellModel:&wallet];
    
    
    HSTitleCellModel *expression = [[HSTitleCellModel alloc] initWithTitle:@"表情" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击表情")
    }];
    expression.icon = [UIImage imageNamed:@"MoreExpressionShops"];
    [self configureCellModel:&expression];
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:photo,favorite,wallet,expression, nil];
    [self.hs_dataArry addObject:section0];
    
}


//如果每个cell设置的属性都一样，不用每一个设置相同的属性封装一个方法就可以
- (void)configureCellModel:(HSTitleCellModel *__autoreleasing *)baseModel
{
    HSTitleCellModel *model = *baseModel;
    model.separateColor = [UIColor blueColor];
    model.titleColor = [UIColor redColor];
    model.controlRightOffset = 100;
}




@end
