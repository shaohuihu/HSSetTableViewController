//
//  NSBundle+HSImage.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/26.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSBundle (HSImage)


/**
 图片bundl

 @return bundle
 */
+ (NSBundle *)hs_Bundle;


/**
 获取bundle图片

 @param name 图片name
 @return image
 */
+ (UIImage *)hs_imageNamed:(NSString *)name;
@end
