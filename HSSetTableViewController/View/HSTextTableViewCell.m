//
//  HSShowTextRightCell.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/19.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSTextTableViewCell.h"
#import "HSTextCellModel.h"
#import "HSSetTableViewControllerConst.h"
#import "UIView+HSFrame.h"
@interface HSTextTableViewCell()

@property (nonatomic, weak)UILabel *detailLabel;  ///<详细文本内容
@property (nonatomic, weak)NSLayoutConstraint *detailRightConstraint;  ///<
@end
@implementation HSTextTableViewCell

+ (HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    HSTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[HSTextTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (void)setupUI
{
    //先实现super调用
    [super setupUI];
    //添加右边label
    UILabel *detailTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    detailTextLabel.numberOfLines = 0;
    detailTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    detailTextLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:detailTextLabel];
    self.detailLabel = detailTextLabel;
    
    [self setupdetailLabelConstraints];
}

- (void)setupdetailLabelConstraints
{

    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-HS_KCellMargin-HS_KCellMargin/2 - HS_KArrowWidth];
    [self.contentView addConstraint:constraintRight];
    self.detailRightConstraint = constraintRight;
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:HS_KCellTextLeftPading]];
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
}



- (void)setupDataModel:(HSBaseCellModel *)model
{
    [super setupDataModel:model];
    
    HSTextCellModel *rightModel = (HSTextCellModel *)model;
    self.detailLabel.text = model.detailText;
    self.detailLabel.textColor = rightModel.detailColor ? rightModel.detailColor:[UIColor grayColor];
    self.detailLabel.font = rightModel.detailFont ? rightModel.detailFont:[UIFont systemFontOfSize:13.0];
    //根据箭头显示设置约束
    if(self.cellModel.showArrow){
        self.detailRightConstraint.constant = - HS_KCellMargin -HS_KCellMargin/2- HS_KArrowWidth;
    }else{
        self.detailRightConstraint.constant = - HS_KCellMargin;
    }
}


@end
