//
//  UIView+HSFrame.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HSFrame)

@property (nonatomic, assign) CGFloat hs_x;
@property (nonatomic, assign) CGFloat hs_y;
@property (nonatomic, assign) CGFloat hs_centerX;
@property (nonatomic, assign) CGFloat hs_centerY;
@property (nonatomic, assign) CGFloat hs_width;
@property (nonatomic, assign) CGFloat hs_height;
@property (nonatomic, assign) CGSize  hs_size;

@end


@interface CALayer (HSFrame)

@property (nonatomic, assign) CGFloat hs_x;
@property (nonatomic, assign) CGFloat hs_y;
@property (nonatomic, assign) CGFloat hs_width;
@property (nonatomic, assign) CGFloat hs_height;
@property (nonatomic, assign) CGSize  hs_size;

@end
