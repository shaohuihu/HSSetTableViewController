//
//  HSSetTableViewManager.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableViewManager.h"
#import "HSBaseTableViewCell.h"
#import "HSBaseCellModel.h"
#import "NSArray+HSSafeAccess.h"
#import "UIView+HSFrame.h"
#import "HSSetTableViewControllerConst.h"
#import "HSTextCellModel.h"
#import "HSFooterModel.h"
#import "HSHeaderModel.h"

@interface HSSetTableViewManager()

@property (nonatomic, strong)NSMutableArray *dataSource;  ///<

@end
@implementation HSSetTableViewManager


- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource
{
    if(self = [super init]){
        self.dataSource = dataSource;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *rows = [self.dataSource hs_objectWithIndex:section];
    NSAssert([rows isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = [self.dataSource hs_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[sections hs_objectWithIndex:indexPath.row];
    Class class = NSClassFromString(cellModel.cellClass);
    NSAssert([class isSubclassOfClass:[HSBaseTableViewCell class]], @"此cellclass类别必须存在,并且继承HSBaseTableViewCell");
    HSBaseTableViewCell *cell = [class cellWithIdentifier:cellModel.cellClass tableView:tableView];
    [cell setupDataModel:cellModel];
    cell.topLine.hidden = indexPath.row != 0;
    [cell.bottomLine setHs_x:(indexPath.row == sections.count - 1 ? 0:cellModel.separateOffset)];
    //处理分割线
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = [self.dataSource hs_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[sections hs_objectWithIndex:indexPath.row];
    
    Class class =  NSClassFromString(cellModel.cellClass);
    return [class getCellHeight:cellModel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = [self.dataSource hs_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[sections hs_objectWithIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:cellModel.actionBlock == nil];
    if(cellModel.actionBlock){
        cellModel.actionBlock(cellModel);
    }
}

#pragma mark tableView代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    HSFooterModel *footer = (HSFooterModel*)[self.footerArry hs_objectWithIndex:section];
    return footer.footerViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    HSFooterModel *footer = (HSFooterModel*)[self.footerArry hs_objectWithIndex:section];
    return footer.footerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    //如果外部不设置header给一个默认的高度
    if(!self.headerArry || self.headerArry.count == 0){
        return HS_SectionHeight;
    }
    HSHeaderModel *header = (HSHeaderModel *)[self.headerArry hs_objectWithIndex:section];
    return header.headerViewHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //如果外部不设置header给一个默认的透明header
    if(!self.headerArry || self.headerArry.count == 0){
        UIView *header = [UIView new];
        header.frame = CGRectMake(0, 0, HS_SCREEN_WIDTH, HS_SectionHeight);
        [header setBackgroundColor:[UIColor clearColor]];
        return header;
    }
    HSHeaderModel *header = (HSHeaderModel *)[self.headerArry hs_objectWithIndex:section];
    return header.headerView;
}


@end
