//
//  HSTextFieldCellModel.h
//  HSSetTableViewCtrollerDemo
//
//  Created by Daniel on 2017/5/26.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"

typedef void(^textFieldBlock)(HSBaseCellModel *model,NSString *contentText);

@interface HSTextFieldCellModel : HSBaseCellModel

/** 占位文字*/
@property (nonatomic, copy)NSString *placeholder;
/** 小数点后两位*/
@property (nonatomic, assign) BOOL matchTwoDecimal;
/** 最大字数*/
@property (nonatomic, assign) NSUInteger maxLength;

@property (nonatomic, copy)textFieldBlock textFieldBlock;


- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder textFieldBlock:(textFieldBlock)block;

@end
