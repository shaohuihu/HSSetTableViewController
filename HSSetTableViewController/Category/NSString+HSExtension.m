//
//  NSString+HSExtension.m
//  HSSetTableViewCtrollerDemo
//
//  Created by Daniel on 2017/5/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "NSString+HSExtension.h"

@implementation NSString (HSExtension)

- (BOOL)hs_matchTwoDecimalPlacesInRange:(NSRange)range withTextField:(UITextField *)textField
{
    BOOL isHaveDian = YES;
    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    }
    if ([self length] > 0) {
        
        unichar single = [self characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.') {//数据格式正确
            
            //首字母不能为0和小数点
            if([textField.text length] == 0){
                if(single == '.') {
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            // 第二个字母根据首字母判断
            if([textField.text length] == 1){
                if ([textField.text intValue] == 0) { // 第一个字母为0
                    if(single != '.') {
                        [textField.text stringByReplacingCharactersInRange:range withString:@""];
                        return NO;
                    }
                }
            }
            
            //输入的字符是否是小数点
            if (single == '.') {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian = YES;
                    return YES;
                    
                }else{
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }else{
                if (isHaveDian) {//存在小数点
                    
                    //判断小数点的位数
                    NSRange ran = [textField.text rangeOfString:@"."];
                    if (range.location - ran.location <= 2) {
                        return YES;
                    }else{
                        return NO;
                    }
                }else{
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else
    {
        return YES;
    }
}

@end
