//
//  NSString+HSExtension.h
//  HSSetTableViewCtrollerDemo
//
//  Created by Daniel on 2017/5/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (HSExtension)

/** 判断输入框只能输入小数点后两位*/
- (BOOL)hs_matchTwoDecimalPlacesInRange:(NSRange)range withTextField:(UITextField *)textField;

@end
