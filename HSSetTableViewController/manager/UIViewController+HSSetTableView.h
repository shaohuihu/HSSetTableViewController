//
//  UIViewController+HSSetTableView.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HSSetTableView)

@property (nonatomic, strong)UITableView *hs_tableView;  ///<表视图
@property (nonatomic, strong)NSMutableArray *hs_dataArry;  ///<数据源


/**
 初始化tableViewConfigure
 */
- (void)initSetTableViewConfigure;
@end
