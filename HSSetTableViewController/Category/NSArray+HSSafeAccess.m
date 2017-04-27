//
//  NSArray+HSSafeAccess.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "NSArray+HSSafeAccess.h"

@implementation NSArray (HSSafeAccess)

- (instancetype)hs_objectWithIndex:(NSUInteger)index
{
    if (index < self.count) {
        return self[index];
    }else{
        return nil;
    }
}
@end

