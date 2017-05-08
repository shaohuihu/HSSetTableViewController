//
//  NSBundle+HSImage.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/26.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "NSBundle+HSImage.h"
#import "HSBaseTableViewCell.h"
@implementation NSBundle (HSImage)


+ (NSBundle *)hs_Bundle
{
    static NSBundle *hs_Bundle = nil;
    if (nil == hs_Bundle) {
        hs_Bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"HSSetTableViewController" ofType:@"bundle"]];
        
        if (nil == hs_Bundle) {
             hs_Bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[HSBaseTableViewCell class]] pathForResource:@"HSSetTableViewController" ofType:@"bundle"]];
        }
    }
    return hs_Bundle;
}

+ (UIImage *)hs_imageNamed:(NSString *)name
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    name = 3.0 == scale ? [NSString stringWithFormat:@"%@@3x.png", name] : [NSString stringWithFormat:@"%@@2x.png", name];
    UIImage *image = [UIImage imageWithContentsOfFile:[[[NSBundle hs_Bundle] resourcePath] stringByAppendingPathComponent:name]];
    return image;
}
@end
