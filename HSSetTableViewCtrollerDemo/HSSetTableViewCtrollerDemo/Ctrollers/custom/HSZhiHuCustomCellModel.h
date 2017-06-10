//
//  HSZhiHuCellModel.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSCustomCellModel.h"

@class HSZhiHuCustomCellModel;
typedef void(^switchItemBlock)(HSZhiHuCustomCellModel *model,BOOL on);
@interface HSZhiHuCustomCellModel : HSCustomCellModel

@property (nonatomic, assign)BOOL hideSwitch;  ///<是否隐藏开关
@property (nonatomic, assign)BOOL on;  ///<
//还可以定义block按钮点击属性，以及开关初始化状态等等..由业务控制model作为中间层
@property (nonatomic, copy) switchItemBlock block;  ///<
@end
