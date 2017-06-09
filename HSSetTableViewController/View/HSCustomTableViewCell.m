//
//  HSCustomTableViewCell.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSCustomTableViewCell.h"

@implementation HSCustomTableViewCell

+(HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView
{
    HSCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        Class cellClass = NSClassFromString(cellIdentifier);
        NSAssert([cellClass isSubclassOfClass:[HSCustomTableViewCell class]], @"此cellclass类必须存在,并且继承HSCustomTableViewCell");
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

@end
