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
@interface HSSetTableViewMainController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HSSetTableViewMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    
    if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_x_Max){
         tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    [self.view addSubview:tableView];
    self.hs_tableView = tableView;
    
    [self setupTableViewConstrint];
   
}

//设置tableView约束
- (void)setupTableViewConstrint
{
    
   if (@available(iOS 11.0, *)) {
       NSLayoutConstraint *tableViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewTopConstraint];
       
       
       NSLayoutConstraint *tableViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewLeftConstraint];
       
       
       NSLayoutConstraint *tableViewRightConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewRightConstraint];
       
       NSLayoutConstraint *tableViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewBottomConstraint];
   }else{
       NSLayoutConstraint *tableViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewTopConstraint];
       
       
       NSLayoutConstraint *tableViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewLeftConstraint];
       
       
       NSLayoutConstraint *tableViewRightConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewRightConstraint];
       
       NSLayoutConstraint *tableViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
       [self.view addConstraint:tableViewBottomConstraint];
   }
    
    
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
    NSAssert([rows isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = [self.hs_dataArry hs_objectWithIndex:indexPath.section];
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
    NSMutableArray *sections = [self.hs_dataArry hs_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[sections hs_objectWithIndex:indexPath.row];

    Class class =  NSClassFromString(cellModel.cellClass);
    return [class getCellHeight:cellModel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = [self.hs_dataArry hs_objectWithIndex:indexPath.section];
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
    return  0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //如果是第一个section
    if (section == 0) return nil;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HS_SectionHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //默认
    if(section == 0) return 0.01;
    return HS_SectionHeight;
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
        NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx2, BOOL * _Nonnull stop) {
            HSBaseCellModel *model  = (HSBaseCellModel *)obj;
            if([model.identifier isEqualToString:cellModel.identifier]){
                //找到section中的数组
                NSMutableArray *rows = [self.hs_dataArry hs_objectWithIndex:idx1];
                //找到某个具体哪一行，进行数据替换
                [rows replaceObjectAtIndex:idx2 withObject:cellModel];
                //更新cell
                NSIndexPath *path = [NSIndexPath indexPathForRow:idx2 inSection:idx1];
                [self.hs_tableView beginUpdates];
                [self.hs_tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:animation];
                [self.hs_tableView endUpdates];
                *stop = YES;
                return;
            }
        }];
    }];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"控制器方法");
     __weak __typeof(&*self)weakSelf = self;
    [self.hs_dataArry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *sections = (NSMutableArray *)obj;
        NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:[HSTextCellModel class]]){
                HSTextCellModel *model = (HSTextCellModel *)obj;
                [model setDetailText:model.detailText];
                [weakSelf updateCellModel:model];
            }
        }];
        
    }];
}


- (void)dealloc
{
    if(self.hs_tableView){
        self.hs_tableView.delegate = nil;
        self.hs_tableView.dataSource = nil;
        [self.hs_tableView removeFromSuperview];
        self.hs_tableView = nil;
    }
    if(self.hs_dataArry){
        [self.hs_dataArry removeAllObjects];
        self.hs_dataArry = nil;
    }
    
}


@end
