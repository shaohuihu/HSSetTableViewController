//
//  UIColor+HSExtension.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "UIColor+HSExtension.h"

@implementation UIColor (HSExtension)

+ (instancetype)hs_colorWithHexString:(NSString *)hexString
{
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [colorString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0];
}

+ (instancetype)hs_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    return [[self hs_colorWithHexString:hexString] colorWithAlphaComponent:alpha];
}

@end
