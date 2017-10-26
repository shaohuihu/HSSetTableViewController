//
//  HSTitleTableViewCell.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSTitleTableViewCell.h"
#import "HSTitleCellModel.h"
#import "UIView+HSFrame.h"
#import "HSSetTableViewControllerConst.h"

@interface HSTitleTableViewCell()
@property (nonatomic, weak)NSLayoutConstraint *arrowWidthContraint;  ///<箭头宽度contraint
@property (nonatomic, weak)NSLayoutConstraint *arrowHeightContraint;  ///<箭头高度contraint
@property (nonatomic, weak)NSLayoutConstraint *arrowRightContraint;  ///<箭头距右边contraint

@end
@implementation HSTitleTableViewCell

+ (HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    HSTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[HSTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)setupUI
{
    [super setupUI];
    //添加右边剪头
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.frame = CGRectZero;
    arrow.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:arrow];
    self.arrow = arrow;
    [self setupArrowImageConstraints];//设置图片约束
}

- (void)setupArrowImageConstraints
{
    
    NSLayoutConstraint *arrowRightContraint = [NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-HS_KCellMargin];
    [self.contentView addConstraint:arrowRightContraint];
    self.arrowRightContraint = arrowRightContraint;
    
    
    NSLayoutConstraint *arrowWidthContraint = [NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_KArrowWidth];
    [self.contentView addConstraint:arrowWidthContraint];
    self.arrowWidthContraint = arrowWidthContraint;
    
    
    NSLayoutConstraint *arrowHeightContraint = [NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_kArrowHeight];
    
    [self.contentView addConstraint:arrowHeightContraint];
    self.arrowHeightContraint = arrowHeightContraint;
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
}

- (void)setupDataModel:(HSBaseCellModel *)model
{
    [super setupDataModel:model];
    
    HSTitleCellModel *cellMoldel = (HSTitleCellModel *)model;
    if(cellMoldel.attributeTitle){
        self.textLabel.attributedText = cellMoldel.attributeTitle;
    }else{
        self.textLabel.text = cellMoldel.title;
        self.textLabel.textColor = cellMoldel.titleColor;
             self.textLabel.font = cellMoldel.titleFont;
    }
    self.textLabel.textAlignment = cellMoldel.titileTextAlignment;
    self.imageView.image = cellMoldel.icon;
   
    self.backgroundColor = model.backgroundColor?:[UIColor whiteColor];
    self.arrow.hidden = !cellMoldel.showArrow;
    self.selectionStyle = cellMoldel.selectionStyle;
    self.arrow.image = cellMoldel.arrowImage;
    
    self.arrowWidthContraint.constant = cellMoldel.arrowWidth;
    self.arrowHeightContraint.constant = cellMoldel.arrowHeight;
    self.arrowRightContraint.constant = - cellMoldel.controlRightOffset;
    
}


@end
