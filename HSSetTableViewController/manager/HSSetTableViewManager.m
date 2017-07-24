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
    //如果是最后一个section
    if(section == self.dataSource.count - 1){
        return 0;
    }
    return HS_SectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    //如果是最后一个section
    if(section == self.dataSource.count - 1){
        return nil;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_HEIGHT, HS_SectionHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

- (void)dealloc
{
    NSLog(@"销毁--manager");
}
@end
