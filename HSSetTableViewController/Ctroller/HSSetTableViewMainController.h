//
//  HSSetTableCtroller.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSBaseCellModel;

/**
 主控制器
 */
@interface HSSetTableViewMainController : UIViewController



@property (nonatomic, weak)UITableView *hs_tableView;  ///<tableView

@property (nonatomic, strong)NSMutableArray *hs_dataArry;  ///<数据源


/**
 设置约束方法，如果子类需要修改约束，请重新该方法
 */
- (void)setupTableViewConstrint;
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
 footer 高度 tableView代理方法

 @param tableView tableView
 @param section section
 @return footer高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;



/**
 footer View tableView代理方法

 @param tableView tableView
 @param section section
 @return footer View
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;


/**
 header view tableView代理方法

 @param tableView tableView
 @param section section
 @return header
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;


/**
 header 高度 tableView代理方法

 @param tableView tableView
 @param section section
 @return header 高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

@end
