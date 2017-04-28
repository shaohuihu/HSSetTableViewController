//
//  HSTextRightModel.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/19.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"

@interface HSTextCellModel : HSBaseCellModel

@property (nonatomic, assign)CGFloat heightOne;  ///<一行文本的高度
@property (nonatomic, assign)CGFloat heightMore;  ///<多行文本高度
@property (nonatomic, strong) UIColor *detailColor;  ///<cell详细文本color
@property (nonatomic, strong) UIFont *detailFont;  ///<cell详细文本Font

- (instancetype)initWithTitle:(NSString *)title detailText:(NSString *)detailText actionBlock:(ClickActionBlock)block;

@end
