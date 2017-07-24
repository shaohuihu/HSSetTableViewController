//
//  UIViewController+HSSetTableView.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/7/24.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "UIViewController+HSSetTableView.h"
#import "HSSetTableViewManager.h"
#import <objc/runtime.h>
@interface UIViewController()
@property (nonatomic, strong)HSSetTableViewManager *manager;  ///<表视图代理类
@end

@implementation UIViewController (HSSetTableView)



+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    
    Method oneMethod = class_getInstanceMethod(self, oneSel);
    Method anotherMethod = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(oneMethod, anotherMethod);
}


- (void)initSetTableViewConfigure
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.class swizzleMethod:NSSelectorFromString(@"dealloc") anotherMethod:@selector(hs_dealloc)];
    });
    
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
        
        //设置约束
        [self setupTableViewConstrint];
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

- (void)hs_dealloc
{
    NSLog(@"分类调用");
    self.hs_tableView.delegate = nil;
    self.hs_tableView.dataSource = nil;
    [self.hs_tableView removeFromSuperview];
    [self.hs_dataArry removeAllObjects];
    self.hs_dataArry = nil;
    self.manager = nil;
    [self hs_dealloc];
}
@end
