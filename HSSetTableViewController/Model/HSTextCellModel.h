//
//  HSTextRightModel.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/19.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"
#import "HSTitleCellModel.h"
@interface HSTextCellModel : HSTitleCellModel


@property (nonatomic, copy)   NSString *detailText;  ///<详细文本
@property (nonatomic, copy)   NSAttributedString *attributeDetailText;  ///<设置富文本内容后detailText将失效

@property (nonatomic, strong) UIColor *detailColor;  ///<cell详细文本color
@property (nonatomic, strong) UIFont *detailFont;  ///<cell详细文本Font
@property (nonatomic, assign) CGFloat leftPading;  ///<距离左边的间距


/**
 文本初始model化方法

 @param title 标题
 @param detailText 详细文本
 @param block 回调
 @return HSTextCellModel
 */
- (instancetype)initWithTitle:(NSString *)title detailText:(NSString *)detailText actionBlock:(ClickActionBlock)block;


/**
 文本Model初始化方法

 @param title 标题文本
 @param attributrDetailText 详细富文本
 @param block 回调
 @return HSTextCellModel
 */
- (instancetype)initWithTitle:(NSString *)title attributrDetailText:(NSAttributedString *)attributrDetailText actionBlock:(ClickActionBlock)block;


/**
 文本model初始化方法

 @param attributeTitle 标题
 @param attributeDetailText 详细富文本
 @param block block
 @return HSTextCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailAttributeText:(NSAttributedString *)attributeDetailText actionBlock:(ClickActionBlock)block;




/**
 文本model初始化方法

 @param attributeTitle 富文本标题
 @param detailText 详细文本
 @param block 回调
 @return HSTextCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailText:(NSString *)detailText actionBlock:(ClickActionBlock)block;

@end
