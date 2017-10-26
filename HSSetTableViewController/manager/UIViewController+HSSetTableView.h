//
//  UIViewController+HSSetTableView.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSBaseCellModel,HSHeaderModel,HSFooterModel;
@interface UIViewController (HSSetTableView)

@property (nonatomic, strong)UITableView *hs_tableView;  ///<表视图
@property (nonatomic, strong)NSMutableArray *hs_dataArry;  ///<数据源


/**
 设置当前tableView 约束

 @param top 上边距    默认0
 @param left 左边距   默认0
 @param right 右边距  默认0(正数是向右边)
 @param bottom 下边距 默认0（正数是向上边）
 */
- (void)setupTableViewConstrint:(CGFloat)top left:(CGFloat)left right:(CGFloat)right bottom:(CGFloat)bottom;
/**
 初始化tableView 类型

 @param style   UITableViewStylePlain,          // regular table view
                UITableViewStyleGrouped         // preferences style table vie
 */
- (void)initSetTableViewConfigureStyle:(UITableViewStyle)style;

/**
 设置footerArry HSFooterModel 数组

 @param footerArry footerArry
 */
- (void)setTableViewFooterArry:(NSMutableArray <HSFooterModel *>*)footerArry;


/**
 设置headerArry HSHeaderModel数组

 @param headerArry headerArry
 */
- (void)setTableViewHeaderArry:(NSMutableArray <HSHeaderModel *> *)headerArry;

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

@end
