//
//  HSBigImageCellModel.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/21.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSImageCellModel.h"
#import "HSSetTableViewControllerConst.h"

@implementation HSImageCellModel
- (instancetype)initWithTitle:(NSString *)title placeholderImage:(UIImage *)placeholderImage imageUrl:(NSString *)imageUrl actionBlock:(ClickActionBlock)actionblock imageBlock:(ClickImageBlock)imageBlock;
{
    if(self = [super initWithTitle:title actionBlock:actionblock]){
        self.placeHoderImage = placeholderImage;
        self.imageUrl = imageUrl;
        self.imageBlock = imageBlock;
        self.imageSize = CGSizeMake(HS_KImageWidth, HS_KImageHeight);
        self.cornerRadius = .0f;
        self.cellHeight  = HS_KImageCellHeight;
    }
    return self;
}

- (NSString *)cellClass
{
    return HSImageCellModelCellClass;
}

@end
