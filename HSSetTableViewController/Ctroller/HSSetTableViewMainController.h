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
@interface HSSetTableViewMainController : UITableViewController

@property (nonatomic, strong)NSMutableArray *hs_dataArry;  ///<数据源


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

@end
