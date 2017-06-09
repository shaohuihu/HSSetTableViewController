//
//  HSBaseTableViewCell.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSBaseCellModel;
@interface HSBaseTableViewCell : UITableViewCell

@property (nonatomic, strong)HSBaseCellModel *cellModel;  ///<cellModel
@property (nonatomic, weak)CALayer *topLine;  ///<顶部分割线
@property (nonatomic, weak)CALayer *bottomLine;  ///<底部分割线

//cell初始化方法
+ (HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
//初始化UI方法
- (void)setupUI;
//设置数据源方法
- (void)setupDataModel:(HSBaseCellModel *)model;
//获取cell高度方法
+ (CGFloat)getCellHeight:(HSBaseCellModel *)model;

@end
