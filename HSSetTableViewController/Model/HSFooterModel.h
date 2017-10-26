//
//  HSFooterModel.h
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/10/25.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 尾部视图模型
 */
@interface HSFooterModel : NSObject

@property (nonatomic, strong)UIView *footerView;  ///<尾部视图
@property (nonatomic, assign)CGFloat footerViewHeight;  ///<尾部视图高度
@end
