//
//  HSTextRightModel.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/19.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSTextCellModel.h"
#import "NSString+HSHeight.h"
#import "HSSetTableViewControllerConst.h"
@implementation HSTextCellModel

- (instancetype)initWithTitle:(NSString *)title detailText:(NSString *)detailText actionBlock:(ClickActionBlock)block
{
    if(self = [super initWithTitle:title actionBlock:block]){
        
        self.leftPading = HS_KCellTextLeftPading;
        self.detailFont = HS_KDetailFont;
        self.detailColor = HS_KDetailColor;
        self.detailText = detailText;
        self.cellClass = HSTextCellModelCellClass;
        
    }
    return self;
}

- (void)setShowArrow:(BOOL)showArrow
{
    [super setShowArrow:showArrow];
    [self setDetailText:self.detailText];
}

- (void)setDetailFont:(UIFont *)detailFont
{
    _detailFont = detailFont;
    [self setDetailText:self.detailText];
}

- (void)setLeftPading:(CGFloat)leftPading
{
    _leftPading = leftPading;
    [self setDetailText:self.detailText];
}

- (void)setDetailText:(NSString *)detailText
{
    //如果detailText为nil 直接返回，为空不能返回
    if(detailText == nil){
        return;
    }
    
    _detailText = detailText;
    //初始化文本高度  外部不可任意改变不然界面看起来很奇怪
    self.cellHeight = 0.0f;
    UIDeviceOrientation duration = [[UIDevice currentDevice]orientation];
    CGFloat screenWidth = 0;
    if(duration == UIDeviceOrientationLandscapeLeft || duration == UIDeviceOrientationLandscapeRight){
        screenWidth = HS_SCREEN_HEIGHT > HS_SCREEN_WIDTH ? HS_SCREEN_HEIGHT:HS_SCREEN_WIDTH;
    }else{
        screenWidth = HS_SCREEN_HEIGHT < HS_SCREEN_WIDTH ? HS_SCREEN_HEIGHT:HS_SCREEN_WIDTH;
    }
    CGFloat height = [detailText hs_heightWithFont:self.detailFont constrainedToWidth:screenWidth - self.leftPading - (self.showArrow ?  HS_KCellMargin + HS_KCellMargin/2 + self.arrowWidth : HS_KCellMargin)];
    if(height < self.detailFont.pointSize + 5){
        //说明只有一行
        self.heightOne = height;
        self.heightMore = .0f;
        self.cellHeight = HS_KCellHeight;
    }else{
        self.heightMore = height;
        self.heightOne = .0f;
        //cell足够大
        self.cellHeight = height + 2 * HS_KCellPading;
    }
}


@end
