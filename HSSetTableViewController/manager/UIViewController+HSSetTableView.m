//
//  UIViewController+HSSetTableView.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "UIViewController+HSSetTableView.h"
#import "HSSetTableViewManager.h"
#import "HSTextCellModel.h"
#import <objc/runtime.h>
#import "NSArray+HSSafeAccess.h"
#import "HSSetTableViewFooterManager.h"
@interface UIViewController()<HSSetTableViewManagerDelegate>
@property (nonatomic, strong)HSSetTableViewManager *manager;  ///<表视图代理类
@property (nonatomic, strong)HSSetTableViewFooterManager *footerManager;  ///<表视图尾部管理类
@property (nonatomic, strong)NSMutableDictionary *headerDic;  ///<头部字典
@property (nonatomic, strong)NSMutableDictionary *headHeightDic;  ///<头部视图高度
@end

@implementation UIViewController (HSSetTableView)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.class swizzleMethod:NSSelectorFromString(@"dealloc") anotherMethod:@selector(hs_dealloc)];
        [self.class swizzleMethod:NSSelectorFromString(@"willRotateToInterfaceOrientation:duration:") anotherMethod:@selector(hs_willRotateToInterfaceOrientation:duration:)];
    });
}

+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    
    Method oneMethod = class_getInstanceMethod(self, oneSel);
    Method anotherMethod = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(oneMethod, anotherMethod);
}


- (void)initSetTableViewConfigure
{
    
    if(self.hs_dataArry == nil){
      self.hs_dataArry = [NSMutableArray array];
    }
    if(self.manager == nil){
       self.manager = [[HSSetTableViewManager alloc] initSetTableViewManager:self.hs_dataArry];
    }
    if(self.hs_tableView == nil){
        self.hs_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.hs_tableView.translatesAutoresizingMaskIntoConstraints = NO;
        self.hs_tableView.backgroundColor = [UIColor clearColor];
        self.hs_tableView.delegate = self.manager;
        self.hs_tableView.dataSource = self.manager;
        self.hs_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.hs_tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.hs_tableView.showsVerticalScrollIndicator = NO;
        
        if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_x_Max){
            self.hs_tableView.cellLayoutMarginsFollowReadableWidth = NO;
        }
        [self.view addSubview:self.hs_tableView];
       
        //设置tableView约束
        [self setupTableViewConstrint];
    }
    //初始化footer视图
    if(self.footerManager == nil){
        self.footerManager = [[HSSetTableViewFooterManager alloc] init];
        self.manager.delegate = self.footerManager;
    }
    
    
}

//设置tableView约束
- (void)setupTableViewConstrint
{
    
    NSLayoutConstraint *tableViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:tableViewTopConstraint];
    
    
    NSLayoutConstraint *tableViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [self.view addConstraint:tableViewLeftConstraint];
    
    
    NSLayoutConstraint *tableViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:tableViewWidthConstraint];
    
    NSLayoutConstraint *tableViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.hs_tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:tableViewHeightConstraint];
    
}


#pragma mark property
- (void)setHs_tableView:(UITableView *)hs_tableView
{
    objc_setAssociatedObject(self, @selector(hs_tableView), hs_tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITableView *)hs_tableView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHs_dataArry:(NSMutableArray *)hs_dataArry
{
    objc_setAssociatedObject(self, @selector(hs_dataArry), hs_dataArry, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)hs_dataArry
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setManager:(HSSetTableViewManager *)manager
{
    objc_setAssociatedObject(self, @selector(manager), manager,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HSSetTableViewManager *)manager
{
    return objc_getAssociatedObject(self, _cmd);
}

- (NSMutableDictionary *)headerDic
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeaderDic:(NSMutableDictionary *)headerDic
{
    objc_setAssociatedObject(self, @selector(headerDic), headerDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)headHeightDic {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeadHeightDic:(NSMutableDictionary *)headHeightDic{
    objc_setAssociatedObject(self, @selector(headHeightDic), headHeightDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//更新model
- (void)updateCellModel:(HSBaseCellModel *)cellModel
{
    [self updateCellModel:cellModel animation:UITableViewRowAnimationFade];
}
//更新cellModel
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


#pragma mark manager 代理方法
- (UIView *)hs_tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self.headerDic objectForKey:@(section)];
}

- (CGFloat)hs_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [[self.headHeightDic objectForKey:@(section)] floatValue];
}
- (void)setTableViewHeader:(UIView *)header section:(NSInteger)section
{
    if(self.headerDic == nil){
        self.headerDic = [NSMutableDictionary dictionary];
        
    }
    if(header && section >=0){
         [self.headerDic setObject:header forKey:@(section)];
        NSLog(@"打印字典个数--%lld",self.headerDic.count);
    }
   
}

- (void)setTableViewHeaderHeight:(CGFloat)height section:(NSInteger)section
{
    if(self.headHeightDic == nil){
        self.headHeightDic = [NSMutableDictionary dictionary];
        
        //设置manager代理
        self.manager.delegate = nil;
        self.manager.delegate = self;
    }
    if(height >=0 && section >= 0){
        [self.headHeightDic setObject:@(height) forKey:@(section)];
    }
    
}

#pragma mark 屏幕旋转方法
-(void)hs_willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(self.hs_dataArry){
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
    [self hs_willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
}

- (void)hs_dealloc
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
    if(self.manager){
       self.manager = nil;
    }
    [self hs_dealloc];
}
@end
