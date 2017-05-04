//
//  HSBaseCellModel.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"
#import "HSSetTableViewControllerConst.h"
#import "NSBundle+HSImage.h"

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
        self.separateColor = HS_KSeparateColor;
        self.separateHeight = HS_KSeparateHeight;
        self.titleFont = HS_KTitleFont;
        self.titleColor = HS_KTitleColor;
        self.arrowImage = [NSBundle hs_imageNamed:@"ic_hs_tableView_arrow"];
        self.arrowWidth = HS_KArrowWidth;
        self.arrowHeight = HS_kArrowHeight;
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(ClickActionBlock)block
{
    if(self = [super init]){
        self.cellHeight = HS_KCellHeight;
        self.attributeTitle = attributeTitle;
        self.showArrow = YES;
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        self.identifier = [NSString stringWithFormat:@"%lf",now];
        self.actionBlock = block;
        self.cellClass = HSBaseCellModelCellClass;
        self.isCanClick = YES;
        self.separateColor = HS_KSeparateColor;
        self.separateHeight = HS_KSeparateHeight;
        self.titleFont = HS_KTitleFont;
        self.titleColor = HS_KTitleColor;
        self.arrowImage = [NSBundle hs_imageNamed:@"ic_hs_tableView_arrow"];
        self.arrowWidth = HS_KArrowWidth;
        self.arrowHeight = HS_kArrowHeight;
    }
    return self;
}


@end
