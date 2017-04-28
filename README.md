# HSSetTableViewController

这是一个自定义类似设置界面的tableViewController，包含多种不同cell。代码自动布局，仅需要少量代码就完成界面搭建和功能实现
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
    
    [我的博客](http://blog.csdn.net/guodongxiaren "悬停显示")  
   
 



