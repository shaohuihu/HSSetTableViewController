//
//  HSSetTableInfoController.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/4/27.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSSetTableInfoController.h"
@interface HSSetTableInfoController ()
@property (nonatomic, strong)HSImageCellModel *header;
@end      

@implementation HSSetTableInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    self.title = @" 个人信息";
    

    //初始化tableView
    [self initSetTableViewConfigureStyle:UITableViewStyleGrouped];
    //模拟演示tableView frame改变
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self setupTableViewConstrint:0 left:0 right:0 bottom:0];
    });
    [self setupTableViewConstrint:0 left:20 right:-20 bottom:0];
    
    
    //组装头部和尾部视图
    NSMutableArray *headerModels = [NSMutableArray array];
    NSMutableArray *footerModels = [NSMutableArray array];
    for(NSInteger index = 0;index <= 5;index++){
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 30)];
        UILabel *lable = [[UILabel alloc] initWithFrame:header.bounds];
        lable.text = [NSString stringWithFormat:@"  第%d个sectionheader",(int)index];
        [header addSubview:lable];
        [header setBackgroundColor:[UIColor clearColor]];
        
        HSHeaderModel *headerModel = [HSHeaderModel new];
        headerModel.headerView = header;
        headerModel.headerViewHeight = 30.0f;
        [headerModels addObject:headerModel];
        
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HS_SCREEN_WIDTH, 30)];
        lable = [[UILabel alloc] initWithFrame:footer.bounds];
        lable.text = [NSString stringWithFormat:@"  第%d个sectionfooter",(int)index];
        [footer addSubview:lable];
        [footer setBackgroundColor:[UIColor clearColor]];
        
        HSFooterModel *footerModel = [HSFooterModel new];
        footerModel.footerView = footer;
        footerModel.footerViewHeight = 30.0f;
        [footerModels addObject:footerModel];
    }
#if 0
    [self setTableViewHeaderArry:headerModels];
    [self setTableViewFooterArry:footerModels];
#endif
    
    
    //组装数据源
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
