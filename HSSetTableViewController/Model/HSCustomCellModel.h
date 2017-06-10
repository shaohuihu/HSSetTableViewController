//
//  HSCustomCellModel.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"

/**
 自定义cell model基类
 */
@interface HSCustomCellModel : HSBaseCellModel

@property (nonatomic, copy  ) NSString   *text;///<基类开放的属性(可用可不用，也可以自己定义熟悉)
@property (nonatomic, copy  ) NSString   *detailText;  ///<基类开放属性(可用可不用，也可以自己定义属性)

/**
 自定义模型初始化方法,请特别注意调用自定义模型方法后，cell必须自定义切存在

 @param cellIdentifier 自定义cell类名，作为唯一标示符
 @param block 回调block
 @return self
 */
- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier actionBlock:(ClickActionBlock)block;

@end
