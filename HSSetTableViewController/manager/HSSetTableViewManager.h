//
//  HSSetTableViewManager.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface HSSetTableViewManager : NSObject <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)UIView *sectionViewFooter;  ///<section的footer
@property (nonatomic, assign)CGFloat sectionViewFooterHieght;  ///<section的footer高度


/**
 初始化manager

 @param dataSource 数据源
 @return self
 */
- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource;
@end
