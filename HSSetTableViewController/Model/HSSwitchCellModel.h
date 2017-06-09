//
//  HSSwitchCellModel.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/19.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"
#import "HSTitleCellModel.h"
@class HSBaseCellModel;
typedef void(^switchBlock)(HSBaseCellModel *model,BOOL on);
@interface HSSwitchCellModel : HSTitleCellModel
@property (nonatomic, assign)BOOL on;  ///<开关状态
@property (nonatomic, strong)UIColor *onTintColor;  ///<
@property (nonatomic, copy)switchBlock switchBlock;  ///< block调用



/**
 开关cell初始化方法

 @param title 开关cell标题
 @param on 开关状态
 @param block block
 @return HSSwitchCellModel
 */
- (instancetype)initWithTitle:(NSString *)title switchType:(BOOL)on switchBlock:(switchBlock)block;

@end
