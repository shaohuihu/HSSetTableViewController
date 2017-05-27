//
//  HSBaseCellModel.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HSBaseCellModel;
typedef void(^ClickActionBlock)(HSBaseCellModel *model);
@interface HSBaseCellModel : NSObject


/**
 基础属性
 */
@property (nonatomic,  copy)   NSString   *cellClass;  ///<该模型绑定的cell类名
@property (nonatomic,  copy)   NSString   *identifier;  ///<唯一标识符(更新会用到)
@property (nonatomic,assign)   UITableViewCellSelectionStyle   selectionStyle;//选中cell效果
@property (nonatomic,  copy) ClickActionBlock actionBlock;///<cell点击事件


/**
 显示相关
 */
@property (nonatomic, copy  )NSAttributedString *attributeTitle;  ///<cell富文本标题(如果设置了这个，title属性将失效)
@property (nonatomic, copy  ) NSString   *title;///<cell标题(左边)
@property (nonatomic, strong) UIImage    *icon;///<cell图片(左边)
@property (nonatomic, assign) CGFloat    cellHeight;  ///<cell高度(默认有高度)
@property (nonatomic, assign) BOOL showArrow;///<是否显示右导航箭头(默认为YES)
@property (nonatomic, assign) CGFloat separateOffset;  ///<分割线左边间距(默认为0)
@property (nonatomic, strong) UIColor *titleColor;  ///<cell标题color
@property (nonatomic, strong) UIFont *titleFont;  ///<cell标题font
@property (nonatomic, assign) BOOL adjustsFontSizeToFitWidth;  ///<是否根据标题宽度自动缩小字体
@property (nonatomic, assign) CGFloat separateHeight;  ///<分割线高度
@property (nonatomic, strong) UIColor *separateColor;  ///<分割线颜色

@property (nonatomic, strong)UIImage *arrowImage;  ///<箭头image
@property (nonatomic, assign)CGFloat arrowWidth;  ///<箭头宽度
@property (nonatomic, assign)CGFloat arrowHeight;  ///<箭头高度



/**
 其它偏移属性
 */
@property (nonatomic, assign)CGFloat controlRightOffset;  ///<子类控件(比如，文本，开关，图片)cellModel距右边屏幕的间距默认15,如果有箭头，则就是箭头到右屏幕的间距，配合arrowControlRightOffset 使用

@property (nonatomic, assign)CGFloat arrowControlRightOffset;  ///<子类控件(比如，文本，开关，图片)距右边箭头间距默认15/2 = 7.5，(如果箭头隐藏，此属性则无效)

/**
 model初始化方法
 
 @param title 模型标题
 @param block block类型
 @return HSBaseCellModel
 */
- (instancetype)initWithTitle:(NSString *)title actionBlock:(ClickActionBlock)block;


/**
 model初始化方法
 
 @param attributeTitle 模型富文本标题
 @param block block回调
 @return HSBaseCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(ClickActionBlock)block;



@end
