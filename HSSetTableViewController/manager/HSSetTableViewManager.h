//
//  HSSetTableViewManager.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol HSSetTableViewManagerDelegate <NSObject>

- (UIView *)hs_tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
- (CGFloat)hs_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

@end


@interface HSSetTableViewManager : NSObject <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) id<HSSetTableViewManagerDelegate> delegate;  ///<代理


/**
 初始化manager

 @param dataSource 数据源
 @return self
 */
- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource;
@end
