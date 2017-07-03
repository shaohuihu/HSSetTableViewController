//
//  HSShowBigImageCell.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/21.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSImageTableViewCell.h"
#import "HSImageCellModel.h"
#import "UIView+HSFrame.h"
#import "HSSetTableViewControllerConst.h"
#import "UIImageView+WebCache.h"
@interface HSImageTableViewCell()

@property (nonatomic, weak)UIImageView *bigImageView;  ///<右边图片显示
@property (nonatomic, weak) NSLayoutConstraint *bigImageRightConstraint;  ///<大图约束
@property (nonatomic, weak)NSLayoutConstraint *bigImageWidthConstraint;  ///<大图宽度
@property (nonatomic, weak)NSLayoutConstraint *bigImageHeightConstaint;  ///<
@end

@implementation HSImageTableViewCell

+ (HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    HSImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[HSImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void)setupUI
{
    [super setupUI];
    
    //添加默认图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectZero;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = YES;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:imageView];
    self.bigImageView = imageView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    [self.bigImageView addGestureRecognizer:tap];
    
    [self setupBigImageConstraint];
}

//设置大图约束
- (void)setupBigImageConstraint
{
    
    NSLayoutConstraint *bigImageRightConstraint = [NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-HS_KCellMargin];
    [self.contentView addConstraint:bigImageRightConstraint];
    self.bigImageRightConstraint = bigImageRightConstraint;
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    
    NSLayoutConstraint *bigImageWidthConstraint = [NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_KImageWidth];
    [self.contentView addConstraint:bigImageWidthConstraint];
    self.bigImageWidthConstraint = bigImageWidthConstraint;
    
    
    NSLayoutConstraint *bigImageHeightConstaint = [NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_KImageHeight];
    [self.contentView addConstraint:bigImageHeightConstaint];
    self.bigImageHeightConstaint = bigImageHeightConstaint;
    
}

- (void)setupDataModel:(HSBaseCellModel *)model
{
    [super setupDataModel:model];
    
    HSImageCellModel *bigModel = (HSImageCellModel *)model;
    if(!bigModel.imageIcon){
       [self.bigImageView sd_setImageWithURL: [NSURL URLWithString:bigModel.imageUrl] placeholderImage:bigModel.placeHoderImage];
    }else{
        self.bigImageView.image = bigModel.imageIcon;
    }
    
    self.bigImageView.layer.cornerRadius = bigModel.cornerRadius > 0 ? bigModel.cornerRadius : 0.f;
    self.bigImageWidthConstraint.constant = bigModel.imageSize.width;
    self.bigImageHeightConstaint.constant = bigModel.imageSize.height;
    if(bigModel.showArrow){
         self.bigImageRightConstraint.constant = - bigModel.controlRightOffset - bigModel.arrowControlRightOffset - bigModel.arrowWidth;
    }else{
        self.bigImageRightConstraint.constant = - bigModel.controlRightOffset;
    }
}

//点击图片
- (void)clickImage:(UITapGestureRecognizer *)tap
{
    HSImageCellModel *bigModel = (HSImageCellModel *)self.cellModel;
    if(bigModel.imageBlock){
        bigModel.imageBlock(self.cellModel);
    }
}




@end
