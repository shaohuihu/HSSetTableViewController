//
//  HSBaseTableViewCell.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSBaseTableViewCell.h"
#import "HSBaseCellModel.h"
#import "UIColor+HSExtension.h"
#import "UIView+HSFrame.h"
#import "HSSetTableViewControllerConst.h"
#import "NSBundle+HSImage.h"


@interface HSBaseTableViewCell()

@property (nonatomic, weak)NSLayoutConstraint *arrowWidthContraint;  ///<箭头宽度contraint
@property (nonatomic, weak)NSLayoutConstraint *arrowHeightContraint;  ///<箭头高度contraint
@end


@implementation HSBaseTableViewCell

+ (HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;

{
    HSBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
         cell = [[HSBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    //添加顶部分割线
    CALayer *topLine = [CALayer layer];
    [topLine setFrame:CGRectMake(0, 0, self.frame.size.width, HS_KSeparateHeight)];
    [topLine setBackgroundColor:HS_KSeparateColor.CGColor];
    [self.contentView.layer addSublayer:topLine];
    self.topLine = topLine;
    
    //添加底部分割线
    CALayer *bottomLine = [CALayer layer];
    [bottomLine setFrame:CGRectMake(0, 0, self.frame.size.width, HS_KSeparateHeight)];
    [bottomLine setBackgroundColor:HS_KSeparateColor.CGColor];
    [self.contentView.layer addSublayer:bottomLine];
    self.bottomLine = bottomLine;
    
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
   
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-HS_KCellMargin]];
    
    
    NSLayoutConstraint *arrowWidthContraint = [NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_KArrowWidth];
    [self.contentView addConstraint:arrowWidthContraint];
    self.arrowWidthContraint = arrowWidthContraint;
    
    
    NSLayoutConstraint *arrowHeightContraint = [NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_kArrowHeight];
    
    [self.contentView addConstraint:arrowHeightContraint];
    self.arrowHeightContraint = arrowHeightContraint;
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bottomLine setHs_width:self.frame.size.width];
    [self.topLine setHs_width:self.frame.size.width];
}

- (void)setupDataModel:(HSBaseCellModel *)model
{
    self.cellModel = model;
    self.textLabel.text = self.cellModel.title;
    self.textLabel.font = self.cellModel.titleFont;
    self.imageView.image = model.icon;
    self.textLabel.textColor = self.cellModel.titleColor;
    [self.bottomLine setHs_y:model.cellHeight - model.separateHeight];
    [self.bottomLine setHs_height:model.separateHeight];
    [self.topLine setHs_height:model.separateHeight];
    [self.bottomLine setBackgroundColor:model.separateColor.CGColor];
    [self.topLine setBackgroundColor:model.separateColor.CGColor];
    
    self.arrow.hidden = !self.cellModel.showArrow;
    self.selectionStyle = !model.isCanClick ? UITableViewCellSelectionStyleNone:UITableViewCellSelectionStyleDefault;
    self.arrow.image = model.arrowImage;
    self.arrowWidthContraint.constant = model.arrowWidth;
    self.arrowHeightContraint.constant = model.arrowHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (CGFloat)getCellHeight:(HSBaseCellModel *)model
{
    return model.cellHeight;
}


@end
