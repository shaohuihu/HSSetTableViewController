//
//  HSBaseCellModel.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"

@interface HSBaseCellModel()
{
    NSString *privateCellModelIdentifier;///<私有变量
}

@end

@implementation HSBaseCellModel


- (instancetype)init
{
    if(self = [super init]){
        //获取当前时间
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        //获取当前线程id
        NSString *threadNumber = [[[NSString stringWithFormat:@"%@",[NSThread currentThread]] componentsSeparatedByString:@"number = "].lastObject componentsSeparatedByString:@","].firstObject;
        privateCellModelIdentifier = [NSString stringWithFormat:@"%lf%@",now,threadNumber];
    }
    
    return self;
}

- (NSString *)identifier
{
    return privateCellModelIdentifier;
}

+ (BOOL)accessInstanceVariablesDirectly
{
    return NO;
}
@end
