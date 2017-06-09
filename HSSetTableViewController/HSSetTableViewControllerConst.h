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


//标题左边的默认cell间距
#define HS_KCellMargin 15.0
//cell分割线默认高度
#define HS_KSeparateHeight .5
//cell分割线默认颜色
#define HS_KSeparateColor [UIColor hs_colorWithHexString:@"#e6e6e6"]
//标题默认字体大小
#define HS_KTitleFont  [UIFont systemFontOfSize:15.0]
//标题默认字体颜色
#define HS_KTitleColor  [UIColor blackColor]
//详细文本默认字体大小
#define HS_KDetailFont [UIFont systemFontOfSize:13.0]
//标题默详细文本字体颜色
#define HS_KDetailColor  [UIColor grayColor]
//分组section之间的距离
#define HS_SectionHeight  10

//箭头默认宽度
#define HS_KArrowWidth 8
//箭头默认高度
#define HS_kArrowHeight 13
//右边文本离左边的边距
#define HS_KCellTextLeftPading  150
//距离cell上下默认边距pading
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

UIKIT_EXTERN NSString *const HSTitleCellModelCellClass;
UIKIT_EXTERN NSString *const HSBaseCellModelCellClass;
UIKIT_EXTERN NSString *const HSImageCellModelCellClass;
UIKIT_EXTERN NSString *const HSSwitchCellModelCellClass;
UIKIT_EXTERN NSString *const HSTextCellModelCellClass;


#endif /* HSSetTableViewConst_h */



