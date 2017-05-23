# HSSetTableViewController

争取打造天朝最好用的设置界面和个人信息框架，上至分割线，下到箭头，标题，详细标题，富文本标题等等统统可配置，可更新，你无须判断indexPath.row。也无须纠结如何更新cell，HSSetTableViewController一行代码帮你搞定！100% App都能用到!!
- 本库优势：
   1. 支持标题，详细文本配置，分割线自定义，箭头自定义，适配不同App风格。
   3. 支持cell右边文本更新，高度内部计算。支持横竖屏自动适应文本高度。
   4. 支持cell右边图片下载，和图片大小以及圆角设置。
   5. 支持标题，详细富文本配置。
   6. 支持所有cell动态更新内容。
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

<img src="https://raw.githubusercontent.com/wiki/shaohuihu/HSSettableViewController/demo1.gif"> <img src="https://raw.githubusercontent.com/wiki/shaohuihu/HSSettableViewController/demo3.gif"> <img src="https://raw.githubusercontent.com/wiki/shaohuihu/HSSettableViewController/demo4.gif"> 

## <a id="How to use"></a>How to use
* 使用 CocoaPods:
请先安装cocoapods,如果版本太老无法找到,请升级cocopods到最新版本 命令：pod repo update
  - `pod 'HSSetTableViewController'
  - 导入头文件：`#import <HSSetTableViewController.h>`
* 直接导入：
  - 拖动 `HSSetTableViewController` 文件夹到你工程
  - 导入头文件：`#import "HSSetTableViewController.h"`
* 类使用: 
  - 你的UIViewController只需要继承基类HSSetTableViewMainController即可
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
   
   //6.更新每个cellModel属性后，只需要调用完成刷新
   [self updateCellModel:cell4];
    
```

## <a id="Warning"></a>Warning

- 因为涉及到更新问题，添加到数据源的形式请使用NSMutableArray，不要使用NSArray存放。
- 不是把cell模型直接放入基类数据源，是先放入NSMutableArray的形式。再用self.hs_dataArry添加NSMutableArray。

## <a id="Hope"></a>Hope

- 如果有任何问题，你可以 [issues me](https://github.com/shaohuihu/HSSetTableViewController/issues/new)! 
- 后续将会对cell扩展和配置，希望能支持更多的主流App.
- 希望能给更多童鞋带来开发的方便，可以一起讨论，如果你喜欢请给个star。

