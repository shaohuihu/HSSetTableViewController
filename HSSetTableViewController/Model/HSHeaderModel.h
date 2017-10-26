//
//  HSHeaderModel.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/10/25.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 头部视图模型
 */
@interface HSHeaderModel : NSObject

@property (nonatomic, strong)UIView *headerView;  ///<头部视图
@property (nonatomic, assign)CGFloat headerViewHeight;  ///<头部视图高度
@end
