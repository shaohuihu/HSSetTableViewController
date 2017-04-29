# HSSetTableViewController

- 🔍 一个比较简单实用类似tableView设置界面cell.每个App基本都能用到。
## Features
- [x] 支持最基本cell(左边标题，右边箭头)
- [x] 支持右边文本cell(左边标题，右边文本，文本属性可配置，高度内部自适应)
- [x] 支持开关cell(左边标题，右边switch)
- [x] 支持图片cell(左边标题，右边图片)
- [x] 支持cell点击以及其它控件事件回调
- [x] 代码手动布局，横屏竖屏均适配

## Requirements
* Xcode 7.0以上

## Architecture
### Main
- `HSBaseCellModel`
- `HSImageCellModel`
- `HSSwitchCellModel`
- `HSTextCellModel`
- `HSSetTableViewMainController`

### Category
- `NSArray+HSSafeAccess`
- `NSBundle+HSImage`
- `NSBundle+HSImage`
- `UIColor+HSExtension`
- `UIView+HSFrame`

## <a id="Renderings"></a>Renderings

<img src="https://raw.githubusercontent.com/wiki/shaohuihu/HSSettableViewController/demo.gif"> 

## <a id="How to use"></a>How to use
* 使用 CocoaPods:
  - `pod "HSSetTableViewController"`
  - 导入头文件：`#import <HSSetTableViewController.h>`
* 直接导入：
  - 拖动 `HSSetTableViewController` 文件夹到你工程
  - 导入头文件：`#import "HSSetTableViewController.h"`
  
  
## <a id="Details"></a>Details (See the example program HSSetTableViewControllerDemo for details)
```objc
    // 1.创建cell模型
     HSBaseCellModel *cell0 = [[HSBaseCellModel alloc] initWithTitle:@"分割线从0开始" actionBlock:^(HSBaseCellModel *model) {
        NSLog(@"基本cell点击事件");
    }];
    // 2. 创建右边文本显示cell（文本高度自适应）
    HSTextCellModel *cell2 = [[HSTextCellModel alloc] initWithTitle:@"文本更新" detailText:@"加班加到口吐二两鲜血" actionBlock:^(HSBaseCellModel *model) {
        NSLog(@"文本cell点击事件");
    }];
    // 3. 创建右边显示开关cell
    HSSwitchCellModel *cell3 = [[HSSwitchCellModel alloc] initWithTitle:@"开关控制" switchType:YES switchBlock:^(HSBaseCellModel *model, BOOL on) {
        NSLog(@"开关控制 --%d",on);
    }];
    //4.下载图片
    UIImage *placeHolder = [UIImage imageNamed:@"ic_icon_header"];
    HSImageCellModel *cell4 = [[HSImageCellModel alloc]      		initWithTitle:@"头像下载更新" placeHoldImage:placeHolder bigImage:nil actionBlock:^(HSBaseCellModel *model) {
        NSLog(@”cell点击事件”)
    } imageBlock:^{
        NSLog(@”头像点击事件”)
    }];
    //5.添加到数据源
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:cell0,cell1,cell2, cell3,cell4,nil];
    [self.hs_dataArry addObject:section0];
    [self.tableView reloadData];
    
   //6.更新每个cellModel属性，更改属性值后，只需要调用- (void)updateCellModel:(HSBaseCellModel *)cellModel; 就可以完成界面刷新。
```
## <a id="Hope"></a>Hope

- 如果有任何问题，你可以 [issues me](https://github.com/shaohuihu/HSSetTableViewController/issues/new)! 
- 后续将会对cell扩展和配置，希望能支持更多的主流App.
- 希望能给更多童鞋带来开发的方便，可以一起讨论，如果你喜欢请给个star。

