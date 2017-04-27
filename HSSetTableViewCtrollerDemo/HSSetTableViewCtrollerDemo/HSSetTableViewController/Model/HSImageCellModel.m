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
- (instancetype)initWithTitle:(NSString *)title placeHoldImage:(UIImage *)placeHoldImage bigImage:(UIImage *)bigImage actionBlock:(ClickActionBlock)actionblock imageBlock:(ClickImageBlock)imageBlock;
{
    if(self = [super initWithTitle:title actionBlock:actionblock]){
        self.placeHodlerImage = placeHoldImage;
        self.bigImage = bigImage;
        self.imageBlock = imageBlock;
        self.imageWidth = HS_KImageWidth;
        self.imageHieght = HS_KImageHeight;
        self.cornerRadius = .0f;
        self.cellHeight  = HS_KImageCellHeight;
        self.cellClass = HSImageCellModelCellClass;
    }
    return self;
}

@end
