//
//  NSArray+HSSafeAccess.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HSSafeAccess)


/**
 按照索引安全返回数组元素

 @param index 索引index
 @return self
 */
- (instancetype)hs_objectWithIndex:(NSUInteger)index;

@end


