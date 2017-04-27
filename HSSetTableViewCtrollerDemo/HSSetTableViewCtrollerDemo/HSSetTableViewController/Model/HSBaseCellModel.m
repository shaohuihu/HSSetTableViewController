//
//  HSBaseCellModel.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"
#import "HSSetTableViewControllerConst.h"
@implementation HSBaseCellModel

- (instancetype)initWithTitle:(NSString *)title actionBlock:(ClickActionBlock)block;
{
    if(self = [super init]){
        self.cellHeight = HS_KCellHeight;
        self.title = title;
        self.showArrow = YES;
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        self.identifier = [NSString stringWithFormat:@"%lf",now];
        self.actionBlock = block;
        self.cellClass = HSBaseCellModelCellClass;
        self.isCanClick = YES;
    }
    return self;
}


@end
