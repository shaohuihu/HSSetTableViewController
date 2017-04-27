//
//  UIColor+HSExtension.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HSExtension)

//color颜色分类方法
+ (instancetype)hs_colorWithHexString:(NSString *)hexString;
//hs_color颜色分类方法
+ (instancetype)hs_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
