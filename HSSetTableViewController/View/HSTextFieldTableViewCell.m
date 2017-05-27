//
//  HSTextFieldTableViewCell.m
//  HSSetTableViewCtrollerDemo
//
//  Created by Daniel on 2017/5/26.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSTextFieldTableViewCell.h"
#import "HSTextFieldCellModel.h"
#import "HSSetTableViewControllerConst.h"
#import "UIView+HSFrame.h"
#import "NSString+HSExtension.h"

@interface HSTextFieldTableViewCell () <UITextFieldDelegate>

@property (nonatomic, weak)UITextField *textField;

@end

@implementation HSTextFieldTableViewCell

+ (HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    HSTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[HSTextFieldTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}


- (void)setupUI
{
    //先实现super调用
    [super setupUI];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.delegate = self;
    [self.contentView addSubview:textField];
    self.textField = textField;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChangeText:) name:UITextFieldTextDidChangeNotification object:textField];
    [self setupdetailLabelConstraints];
}

- (void)setupdetailLabelConstraints
{
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant: -HS_KCellMargin]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:[self valueForKey:@"titleLab"] attribute:NSLayoutAttributeRight multiplier:1.0 constant:HS_KCellMargin]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:HS_KTextFieldHeight]];
    
}


- (void)setupDataModel:(HSBaseCellModel *)model
{
    [super setupDataModel:model];
    
    HSTextFieldCellModel *textFieldModel = (HSTextFieldCellModel *)model;
    self.textField.placeholder = textFieldModel.placeholder;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (((HSTextFieldCellModel *)self.cellModel).matchTwoDecimal) {
        // 强制输入小数点后两位
        return [string hs_matchTwoDecimalPlacesInRange:range withTextField:textField];
    }
    return YES;
}

- (void)textFieldDidChangeText:(NSNotification *)notification
{
    UITextField *textField = (UITextField *)notification.object;
    NSString *toBeString = textField.text;
    
    // 获取键盘输入模式
    //        NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage];
    NSString *lang = [UIApplication sharedApplication].delegate.window.textInputMode.primaryLanguage;
    // 中文输入的时候,可能有markedText(高亮选择的文字),需要判断这种状态
    // zh-Hans表示简体中文输入, 包括简体拼音，健体五笔，简体手写
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮选择部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，表明输入结束,则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > ((HSTextFieldCellModel *)self.cellModel).maxLength) {
                // 截取子串
                textField.text = [toBeString substringToIndex:((HSTextFieldCellModel *)self.cellModel).maxLength];
            }
            
            HSTextFieldCellModel *model = (HSTextFieldCellModel *)self.cellModel;
            if(model.textFieldBlock){
                model.textFieldBlock(self.cellModel,textField.text);
            }

        } else { // 有高亮选择的字符串，则暂不对文字进行统计和限制
            //                NSLog(@"11111111111111========      %@",position);
        }
    } else {
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > ((HSTextFieldCellModel *)self.cellModel).maxLength) {
            // 截取子串
            textField.text = [toBeString substringToIndex:((HSTextFieldCellModel *)self.cellModel).maxLength];
        }
        HSTextFieldCellModel *model = (HSTextFieldCellModel *)self.cellModel;
        if(model.textFieldBlock){
            model.textFieldBlock(self.cellModel,textField.text);
        }
    }
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    HSLog(@"释放输入框");
}

@end
