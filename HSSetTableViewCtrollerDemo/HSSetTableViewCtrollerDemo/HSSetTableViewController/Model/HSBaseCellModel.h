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


@property (nonatomic, copy)   NSString   *cellClass;  ///<该模型绑定的cell类名
@property (nonatomic, copy)   NSString   *identifier;  ///<唯一标识符(更新会用到)
@property (nonatomic, copy  ) NSString   *title;///<cell标题(左边)
@property (nonatomic, strong) UIImage    *icon;///<cell图片(左边)
@property (nonatomic, copy  ) NSString   *detailText;///<cell详细内容
@property (nonatomic, assign) CGFloat    cellHeight;  ///<cell高度(默认有高度)
@property (nonatomic, assign) UITableViewCellStyle cellStyle;  ///<
@property (nonatomic, assign) BOOL isCanClick;  ///<是否有点击效果(默认有)
@property (nonatomic, copy  ) ClickActionBlock actionBlock;///<cell点击事件

@property (nonatomic, assign) BOOL showArrow;///<是否显示右导航箭头(默认为YES)
@property (nonatomic, assign)BOOL noSeparateOffset;  ///<没有分割线偏移(默认为NO)
@property (nonatomic, strong) UIColor *titleColor;  ///<cell标题color
@property (nonatomic, strong) UIFont *titleFont;  ///<cell标题font


//初始化方法(普通cell和右边有文本的cell)

/**
 model初始化方法

 @param title 模型标题
 @param block block类型
 @return HSBaseCellModel
 */
- (instancetype)initWithTitle:(NSString *)title actionBlock:(ClickActionBlock)block;



@end
