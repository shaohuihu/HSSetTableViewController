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
    
   
}

- (void)setupDataModel:(HSBaseCellModel *)model
{
    self.cellModel = model;
    self.selectionStyle = model.selectionStyle;
    [self.bottomLine setHs_y:model.cellHeight - model.separateHeight];
    [self.bottomLine setHs_height:model.separateHeight];
    [self.topLine setHs_height:model.separateHeight];
    [self.bottomLine setBackgroundColor:model.separateColor.CGColor];
    [self.topLine setBackgroundColor:model.separateColor.CGColor];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bottomLine setHs_width:self.frame.size.width];
    [self.topLine setHs_width:self.frame.size.width];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (CGFloat)getCellHeight:(HSBaseCellModel *)model
{
    return model.cellHeight;
}


@end
