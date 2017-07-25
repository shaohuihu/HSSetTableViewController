//
//  UIViewController+HSSetTableView.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSBaseCellModel;
@interface UIViewController (HSSetTableView)

@property (nonatomic, strong)UITableView *hs_tableView;  ///<表视图
@property (nonatomic, strong)NSMutableArray *hs_dataArry;  ///<数据源


/**
 初始化tableViewConfigure
 */
- (void)initSetTableViewConfigure;

/**
 更新cell模型方法
 
 @param cellModel model
 */
- (void)updateCellModel:(HSBaseCellModel *)cellModel;


/**
 更新cell模型方法
 
 @param cellModel model
 @param animation 动画效果
 */
- (void)updateCellModel:(HSBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation;


/**
 设置section header头部

 @param header header头部
 @param section section
 */
- (void)setTableViewHeader:(UIView *)header section:(NSInteger)section;


/**
 设置头部视图高度

 @param height 高度
 @param section section
 */
- (void)setTableViewHeaderHeight:(CGFloat)height section:(NSInteger)section;
@end
