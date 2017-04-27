//
//  HSSetTableCtroller.m
//  HSSetTableView
//
//  Created by hushaohui on 2017/4/18.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableViewMainController.h"
#import "HSBaseTableViewCell.h"
#import "HSBaseCellModel.h"
#import "NSArray+HSSafeAccess.h"
#import "UIView+HSFrame.h"
#import "HSSetTableViewControllerConst.h"
#import "HSTextCellModel.h"
@interface HSSetTableViewMainController ()

@end

@implementation HSSetTableViewMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
}
- (NSMutableArray *)hs_dataArry
{
    if(_hs_dataArry == nil){
        _hs_dataArry = [NSMutableArray array];
    }
    return _hs_dataArry;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.hs_dataArry.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *rows = [self.hs_dataArry hs_objectWithIndex:section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = [self.hs_dataArry hs_objectWithIndex:indexPath.section];
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[sections hs_objectWithIndex:indexPath.row];
    Class class = NSClassFromString(cellModel.cellClass);
    HSBaseTableViewCell *cell = [class cellWithIdentifier:cellModel.cellClass tableView:tableView];
    cell.tableView = tableView;
    [cell setupDataModel:cellModel];
    cell.topLine.hidden = indexPath.row != 0;
    [cell.bottomLine setHs_x:(indexPath.row == sections.count - 1 ? 0:(cellModel.noSeparateOffset ? 0 : HS_KCellMargin))];
    //处理分割线
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSMutableArray *sections = [self.hs_dataArry hs_objectWithIndex:indexPath.section];
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[sections hs_objectWithIndex:indexPath.row];

    Class class =  NSClassFromString(cellModel.cellClass);
    return [class getCellHeight:cellModel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = [self.hs_dataArry hs_objectWithIndex:indexPath.section];
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[sections hs_objectWithIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:cellModel.actionBlock == nil];
    if(cellModel.actionBlock){
        cellModel.actionBlock(cellModel);
    }
}

- (void)updateCellModel:(HSBaseCellModel *)cellModel
{
    [self updateCellModel:cellModel animation:UITableViewRowAnimationFade];
}
- (void)updateCellModel:(HSBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation
{
    //这里根据模型标题是否一样，是更新的哪个model
    NSMutableArray *tempData = [NSMutableArray arrayWithArray:self.hs_dataArry];
    [tempData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx1, BOOL * _Nonnull stop) {
        NSMutableArray *sections = (NSMutableArray *)obj;
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx2, BOOL * _Nonnull stop) {
            HSBaseCellModel *model  = (HSBaseCellModel *)obj;
            if([model.identifier isEqualToString:cellModel.identifier]){
                //找到section中的数组
                NSMutableArray *rows = [self.hs_dataArry hs_objectWithIndex:idx1];
                //找到某个具体哪一行，进行数据替换
                [rows replaceObjectAtIndex:idx2 withObject:cellModel];
                //更新cell
                NSIndexPath *path = [NSIndexPath indexPathForRow:idx2 inSection:idx1];
                [self.tableView beginUpdates];
                [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:animation];
                [self.tableView endUpdates];
                *stop = YES;
                return;
            }
        }];
    }];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.hs_dataArry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *sections = (NSMutableArray *)obj;
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:[HSTextRightModel class]]){
                HSTextRightModel *model = (HSTextRightModel *)obj;
                model.detailText = model.detailText;
            }
        }];
        
    }];
    
    [self.tableView reloadData];
}


@end
