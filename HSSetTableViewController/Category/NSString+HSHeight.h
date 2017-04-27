//
//  NSString+HSHeight.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/19.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (HSHeight)



/**
 计算文本高度方法

 @param font 字体大小
 @param width 宽度
 @return 文字高度
 */
- (CGFloat)hs_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

@end
