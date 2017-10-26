//
//  HSSetTableViewManager.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class HSFooterModel,HSHeaderModel;
@interface HSSetTableViewManager : NSObject <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)NSArray<HSFooterModel *> *footerArry;   ///footer 数组
@property (nonatomic, strong)NSArray<HSHeaderModel *> *headerArry;  ///<header 数组


/**
 初始化manager

 @param dataSource 数据源
 @return self
 */
- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource;
@end
