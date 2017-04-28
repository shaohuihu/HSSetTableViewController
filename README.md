# HSSetTableViewController

这是一个自定义类似设置界面的tableViewController，包含多种不同cell。cell模型由HSBaseCellModel
代码自动布局，仅需要少量代码就完成界面搭建和功能实现
使用：继承HSSetTableViewMainController  
包含头文件
#import "HSSetTableViewController"

    HSBaseCellModel *photo = [[HSBaseCellModel alloc] initWithTitle:@"相册" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    photo.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    
    HSBaseCellModel *favorite = [[HSBaseCellModel alloc] initWithTitle:@"收藏" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击收藏")
    }];
    favorite.icon = [UIImage imageNamed:@"MoreMyFavorites"];
    
    
    HSBaseCellModel *wallet = [[HSBaseCellModel alloc] initWithTitle:@"钱包" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击钱包")
    }];
    wallet.icon = [UIImage imageNamed:@"MoreMyAlbum"];
    
    
    HSBaseCellModel *expression = [[HSBaseCellModel alloc] initWithTitle:@"表情" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击表情")
    }];
    expression.icon = [UIImage imageNamed:@"MoreExpressionShops"];
    
    HSBaseCellModel *setting = [[HSBaseCellModel alloc] initWithTitle:@"设置" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击设置")
    }];
    setting.icon = [UIImage imageNamed:@"MoreExpressionShops"];
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:photo,favorite,wallet, nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:expression,nil];
    NSMutableArray *section2 = [NSMutableArray arrayWithObjects:setting,nil];

    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
    [self.hs_dataArry addObject:section2];
    
    [self.tableView reloadData];
    
    需要更新的时候调用：
    - (void)updateCellModel:(HSBaseCellModel *)cellModel;
    
    
    //其它类型
      //头像
    UIImage *icon = [UIImage imageNamed:@"ic_icon_header"];
    HSImageCellModel *header = [[HSImageCellModel alloc] initWithTitle:@"头像" placeHoldImage:nil bigImage:icon actionBlock:^(HSBaseCellModel *model) {
        
    } imageBlock:^{
        
    }];
    
    //多行文本
    HSTextRightModel *sign = [[HSTextRightModel alloc] initWithTitle:@"签名" detailText:@"气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹气质如虹" actionBlock:nil];
   
 



