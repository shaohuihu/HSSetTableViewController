//
//  HSTextFieldCellModel.m
//  HSSetTableViewCtrollerDemo
//
//  Created by Daniel on 2017/5/26.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSTextFieldCellModel.h"
#import "HSSetTableViewControllerConst.h"

@implementation HSTextFieldCellModel

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder textFieldBlock:(textFieldBlock)block
{
    if(self = [super initWithTitle:title actionBlock:nil]){
        self.cellClass = HSTextFieldCellModelCellClass;
        self.textFieldBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.showArrow = NO;
        self.placeholder = placeholder;
        self.maxLength = NAME_MAX;
    }
    return self;
}

@end
