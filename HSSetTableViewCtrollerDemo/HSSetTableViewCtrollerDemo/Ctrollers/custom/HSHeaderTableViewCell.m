//
//  HSHeaderTableViewCell.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSHeaderTableViewCell.h"
#import "UIView+HSFrame.h"
#import "NSBundle+HSImage.h"
#import "HSSetTableViewController.h"
#define KImageWidth  80


@interface HSHeaderTableViewCell()

@property (nonatomic, weak)UILabel *labelTitle;  ///<标题

@end
@implementation HSHeaderTableViewCell


- (void)setupUI
{
    [super setupUI];
    
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(10, (100 - KImageWidth)/2, KImageWidth, KImageWidth)];
    header.clipsToBounds = YES;
    header.image = [UIImage imageNamed:@"ic_icon_photo"];
    header.layer.cornerRadius = 5.0f;
    [self.contentView addSubview:header];
    
    
    //标题
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(header.frame)+10, 30, 100, 20)];
    lable.text = @"我的微信名字";
    lable.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:lable];
    self.labelTitle = lable;
    
    
    //标题
    lable = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(header.frame)+10, CGRectGetMaxY(lable.frame)+10, 200, 20)];
    lable.text = @"微信号:hushaohui";
    lable.font = [UIFont systemFontOfSize:15.0f];
    [self.contentView addSubview:lable];
    
    
    //添加右边剪头
    UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake(HS_SCREEN_WIDTH-HS_KCellMargin - HS_KArrowWidth, (100 - HS_kArrowHeight)/2, HS_KArrowWidth, HS_kArrowHeight)];
    arrow.image = [NSBundle hs_imageNamed:@"ic_hs_tableView_arrow"];
    [self.contentView addSubview:arrow];
    
    //二维码
    UIImageView *qrCode = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_icon_qrCode"]];
    qrCode.frame = CGRectMake(HS_SCREEN_WIDTH - HS_KArrowWidth - 2 * HS_KCellMargin - 15 , (100 - 15)/2, 15, 15);
    [self.contentView addSubview:qrCode];
    
}


//外部model与本界面数据交互
- (void)setupDataModel:(HSBaseCellModel *)model;
{
    HSCustomCellModel *custom = (HSCustomCellModel *)model;
    self.labelTitle.text = custom.text;
}

@end
