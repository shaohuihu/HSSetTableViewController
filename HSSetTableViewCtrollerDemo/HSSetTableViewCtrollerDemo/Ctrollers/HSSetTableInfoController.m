//
//  HSSetTableInfoController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableInfoController.h"
#import "HSSetTableViewController.h"
@interface HSSetTableInfoController ()
@property (nonatomic, strong)HSImageCellModel *header;  ///<

@end

@implementation HSSetTableInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    self.title = @" 个人信息";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 30)];
    UILabel *lable = [[UILabel alloc] initWithFrame:view.bounds];
    lable.text = @" 第一个section";
    [view addSubview:lable];
    [view setBackgroundColor:[UIColor clearColor]];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 30)];
    lable = [[UILabel alloc] initWithFrame:view.bounds];
    lable.text = @" 第二个section";
    lable.center = view1.center;
    lable.textColor = [UIColor blackColor];
    [view1 addSubview:lable];
    [view1 setBackgroundColor:[UIColor clearColor]];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 30)];
    lable = [[UILabel alloc] initWithFrame:view.bounds];
    lable.text = @" 第三个section";
    lable.center = view2.center;
    [view2 addSubview:lable];
    [view2 setBackgroundColor:[UIColor clearColor]];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 30)];
    lable = [[UILabel alloc] initWithFrame:view.bounds];
    lable.text = @" 第四个section";
    lable.center = view3.center;
    [view3 addSubview:lable];
    [view3 setBackgroundColor:[UIColor clearColor]];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 30)];
    lable = [[UILabel alloc] initWithFrame:view.bounds];
    lable.text = @" 第五个section";
    lable.center = view4.center;
    [view4 addSubview:lable];
    [view4 setBackgroundColor:[UIColor clearColor]];
    
    
    //[self initSetTableViewConfigure];
    
    [self initSetTableViewConfigureWithSectionFooter:@[[[UIView alloc] init],view,view2,view3,view4] footerHeight:@[@(-10),@(30),@(30),@(30),@(30)]];
        
    //头像
    UIImage *icon = [UIImage imageNamed:@"ic_icon_header"];
    HSImageCellModel *header = [[HSImageCellModel alloc] initWithTitle:@"头像" placeholderImage:icon imageUrl:nil actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:^(HSBaseCellModel *cellModel) {
        HSLog(@"点击头像--%@",cellModel)
    }];
    self.header = header;
    
    self.header.actionBlock = ^(HSBaseCellModel *model) {
//        NSLog(@"self class --%@",[self class]);
    };
    
    //名字
    HSTextCellModel *name = [[HSTextCellModel alloc] initWithTitle:@"名字" detailText:@"人名的名义" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    
    
    //微信号
    HSTextCellModel *number = [[HSTextCellModel alloc] initWithTitle:@"微信号" detailText:@"HSSetTableView" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    number.selectionStyle = UITableViewCellSelectionStyleNone;
    number.showArrow = NO;
    
    //我的二维码
    UIImage *image = [UIImage imageNamed:@"ic_icon_qrCode"];
    HSImageCellModel *qrCode = [[HSImageCellModel alloc] initWithTitle:@"我的二维码" placeholderImage:image imageUrl:nil actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:nil];
    qrCode.imageSize = CGSizeMake(15, 15);
    qrCode.cellHeight = HS_KCellHeight;
    
    //我的地址
    HSTitleCellModel *address = [[HSTitleCellModel alloc] initWithTitle:@"我的地址" actionBlock:^(HSBaseCellModel *model) {
        
    }];
    
    //性别
    HSTextCellModel *sex = [[HSTextCellModel alloc] initWithTitle:@"性别" detailText:@"男" actionBlock:nil];
    
    //地区
    HSTextCellModel *area = [[HSTextCellModel alloc] initWithTitle:@"地区" detailText:@"四川 成都" actionBlock:nil];
//
//    
    //个性签名
    HSTextCellModel *sign = [[HSTextCellModel alloc] initWithTitle:@"签名" detailText:@"气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹" actionBlock:nil];
//    sign.controlRightOffset = 30;
//    sign.arrowControlRightOffset = 50;
    
 
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:header,name,number,qrCode,address, nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:area,sex,sign,nil];
    
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
    


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"HSSetTableInfoController销毁");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
