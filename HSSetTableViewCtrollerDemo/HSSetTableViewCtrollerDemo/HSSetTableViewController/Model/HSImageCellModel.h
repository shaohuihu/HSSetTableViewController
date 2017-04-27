//
//  HSBigImageCellModel.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/21.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"

typedef void(^ClickImageBlock)();
//右边大图model
@interface HSImageCellModel : HSBaseCellModel


@property (nonatomic, strong)UIImage *placeHodlerImage;  ///<初始化图片
@property (nonatomic, strong)UIImage *bigImage;  ///<显示大图图片
@property (nonatomic, assign)CGFloat imageWidth;  ///<图片宽度
@property (nonatomic, assign)CGFloat imageHieght;  ///<图片高度
@property (nonatomic, assign)CGFloat cornerRadius;  ///<图片圆角

@property (nonatomic, copy)ClickImageBlock imageBlock;  ///<点击图片block


/**
 图片模型初始化方法

 @param title cell标题
 @param placeHoldImage 初始化image
 @param bigImage 右边大图image
 @param actionblock cell点击block
 @param imageBlock 右边大图点击block
 @return HSImageCellModel
 */
- (instancetype)initWithTitle:(NSString *)title placeHoldImage:(UIImage *)placeHoldImage bigImage:(UIImage *)bigImage actionBlock:(ClickActionBlock)actionblock imageBlock:(ClickImageBlock)imageBlock;

@end
