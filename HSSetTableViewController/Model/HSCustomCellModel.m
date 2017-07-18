//
//  HSCustomCellModel.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSCustomCellModel.h"
#import "HSSetTableViewControllerConst.h"

@interface HSCustomCellModel()
{
    NSString *privateCellClass;///<私有变量
}

@end
@implementation HSCustomCellModel


- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier actionBlock:(ClickActionBlock)block
{
    if(self = [super init]){
        self.cellHeight = HS_KCellHeight;
        self.actionBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.separateOffset = HS_KCellMargin;
        self.separateColor = HS_KSeparateColor;
        self.separateHeight = HS_KSeparateHeight;
        //cellClass 为与cell类名绑定的自定义cell类名必须一致，类名作为identifier的重用标示符号,如果不一致将报错。
        privateCellClass = cellIdentifier;
    }
    return self;
}


- (NSString *)cellClass
{
    return privateCellClass;
}

@end
