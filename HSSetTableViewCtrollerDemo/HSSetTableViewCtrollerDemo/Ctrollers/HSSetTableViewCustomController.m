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
    
    HSBaseCellModel *photo = [[HSBaseCellModel alloc] initWithTitle:@"相册" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    photo.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    [self configureCellModel:&photo];
    
    HSBaseCellModel *favorite = [[HSBaseCellModel alloc] initWithTitle:@"收藏" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击收藏")
    }];
    favorite.icon = [UIImage imageNamed:@"MoreMyFavorites"];
    [self configureCellModel:&favorite];
    
    
    HSBaseCellModel *wallet = [[HSBaseCellModel alloc] initWithTitle:@"钱包" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击钱包")
    }];
    wallet.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    [self configureCellModel:&wallet];
    
    
    HSBaseCellModel *expression = [[HSBaseCellModel alloc] initWithTitle:@"表情" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击表情")
    }];
    expression.icon = [UIImage imageNamed:@"MoreExpressionShops"];
    [self configureCellModel:&expression];
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:photo,favorite,wallet,expression, nil];
    [self.hs_dataArry addObject:section0];
    
}


//如果每个cell设置的属性都一样，不用每一个设置相同的属性封装一个方法就可以
- (void)configureCellModel:(HSBaseCellModel *__autoreleasing *)baseModel
{
    HSBaseCellModel *model = *baseModel;
    model.separateColor = [UIColor blueColor];
    model.titleColor = [UIColor redColor];
    model.controlRightOffset = 60;
}




@end
