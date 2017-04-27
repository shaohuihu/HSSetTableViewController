//
//  HSSetTableViewConst.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#ifndef __HSSetTableViewControllerConst__H__
#define __HSSetTableViewControllerConst__H__



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+HSExtension.h"

//标题左边的cell间距
#define HS_KCellMargin 15.0
//cell分割线高度
#define HS_KSeparateHeight .5
#define HS_KSeparateColor [UIColor hs_colorWithHexString:@"#e6e6e6"]
//箭头宽度
#define HS_KArrowWidth 8

#define HS_kArrowHeight 13
//右边文本离左边的边距
#define HS_KCellTextLeftPading  150
//文本行间距
#define HS_KCellWordSpace 0
//距离cell上下边距pading
#define HS_KCellPading  5
//cell默认高度
#define HS_KCellHeight 44
//开关默认宽度
#define HS_KSwitchWidth 50
//开关默认高度
#define HS_KSwitchHeight 30
//大图默认cell高度
#define HS_KImageCellHeight 90
//右边大图默认宽度
#define HS_KImageWidth  60
//右边大图默认高度
#define HS_KImageHeight 60
//屏幕宏定义
#define HS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//Log打印
#ifdef DEBUG
# define HSLog(fmt, ...) NSLog((@"行: %d >  " fmt), __LINE__, ##__VA_ARGS__);
#else
# define HSLog(...);
#endif

UIKIT_EXTERN NSString *const HSBaseCellModelCellClass;
UIKIT_EXTERN NSString *const HSImageCellModelCellClass;
UIKIT_EXTERN NSString *const HSSwitchCellModelCellClass;
UIKIT_EXTERN NSString *const HSTextCellModelCellClass;


#endif /* HSSetTableViewConst_h */



