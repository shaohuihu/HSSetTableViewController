//
//  HSSwitchCellModel.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/19.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSwitchCellModel.h"
#import "HSSetTableViewControllerConst.h"
@implementation HSSwitchCellModel

- (instancetype)initWithTitle:(NSString *)title switchType:(BOOL)on switchBlock:(switchBlock)block
{
    if(self = [super initWithTitle:title actionBlock:nil]){
        self.cellClass = HSSwitchCellModelCellClass;
        self.switchBlock = block;
        self.isCanClick = NO;
        self.showArrow = NO;
        self.on = on;
    }
    return self;
}
@end
