//
//  HSTitleCellModel.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSTitleCellModel.h"
#import "HSSetTableViewControllerConst.h"
#import "NSBundle+HSImage.h"

@implementation HSTitleCellModel


- (instancetype)initWithTitle:(NSString *)title actionBlock:(ClickActionBlock)block;
{
    if(self = [super init]){
        self.cellHeight = HS_KCellHeight;
        self.title = title;
        self.showArrow = YES;
        self.actionBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.separateOffset = HS_KCellMargin;
        self.separateColor = HS_KSeparateColor;
        self.separateHeight = HS_KSeparateHeight;
        self.titleFont = HS_KTitleFont;
        self.titleColor = HS_KTitleColor;
        self.arrowImage = [NSBundle hs_imageNamed:@"ic_hs_tableView_arrow"];
        self.arrowWidth = HS_KArrowWidth;
        self.arrowHeight = HS_kArrowHeight;
        self.controlRightOffset = HS_KCellMargin;
        self.arrowControlRightOffset = HS_KCellMargin/2;
        self.titileTextAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(ClickActionBlock)block
{
    if(self = [super init]){
        self.cellHeight = HS_KCellHeight;
        self.attributeTitle = attributeTitle;
        self.showArrow = YES;
        self.actionBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.separateColor = HS_KSeparateColor;
        self.separateHeight = HS_KSeparateHeight;
        self.titleFont = HS_KTitleFont;
        self.titleColor = HS_KTitleColor;
        self.arrowImage = [NSBundle hs_imageNamed:@"ic_hs_tableView_arrow"];
        self.arrowWidth = HS_KArrowWidth;
        self.arrowHeight = HS_kArrowHeight;
        self.controlRightOffset = HS_KCellMargin;
        self.arrowControlRightOffset = HS_KCellMargin/2;
        self.titileTextAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (NSString *)cellClass
{
    return HSTitleCellModelCellClass;
}
@end
