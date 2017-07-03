//
//  HSBigImageCellModel.h
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/21.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseCellModel.h"
#import "HSTitleCellModel.h"
typedef void(^ClickImageBlock)(HSBaseCellModel *cellModel);
//右边大图model
@interface HSImageCellModel : HSTitleCellModel


@property (nonatomic, strong)UIImage *placeHoderImage;  ///<初始化图片
@property (nonatomic, copy)NSString *imageUrl;  ///<显示图片url
@property (nonatomic, strong)UIImage *imageIcon;  ///<图片icon
@property (nonatomic, assign)CGSize imageSize;  ///<图片大小
@property (nonatomic, assign)CGFloat cornerRadius;  ///<图片圆角

@property (nonatomic, copy)ClickImageBlock imageBlock;  ///<点击图片block


/**
 图片模型初始化方法

 @param title cell标题
 @param placeholderImage 初始化image
 @param imageUrl 右边大图image
 @param actionblock cell点击block
 @param imageBlock 右边大图点击block
 @return HSImageCellModel
 */
- (instancetype)initWithTitle:(NSString *)title placeholderImage:(UIImage *)placeholderImage imageUrl:(NSString *)imageUrl actionBlock:(ClickActionBlock)actionblock imageBlock:(ClickImageBlock)imageBlock;

@end
