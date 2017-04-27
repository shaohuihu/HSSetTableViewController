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
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[NSBundle hs_imageNamed:@"ic_hs_tableView_arrow"]];
    arrow.frame = CGRectZero;
    arrow.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:arrow];
    self.arrow = arrow;
    [self setupArrowImageConstraints];//设置图片约束
}

- (void)setupArrowImageConstraints
{
   
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-HS_KCellMargin]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:8]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_kArrowHeight]];
    
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
    self.textLabel.font = self.cellModel.titleFont ? self.cellModel.titleFont:[UIFont systemFontOfSize:15.0];
    self.imageView.image = (model.icon != nil ? model.icon:nil);
    self.textLabel.textColor = self.cellModel.titleColor ? self.cellModel.titleColor:[UIColor blackColor];
    [self.bottomLine setHs_y:model.cellHeight - HS_KSeparateHeight];
    
    self.arrow.hidden = !self.cellModel.showArrow;
    self.selectionStyle = !model.isCanClick ? UITableViewCellSelectionStyleNone:UITableViewCellSelectionStyleDefault;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (CGFloat)getCellHeight:(HSBaseCellModel *)model
{
    return model.cellHeight;
}


@end
