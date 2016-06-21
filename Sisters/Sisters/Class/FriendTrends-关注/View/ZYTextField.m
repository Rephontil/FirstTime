//
//  ZYTextField.m
//  Sisters
//
//  Created by ZhouYong on 16/6/20.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYTextField.h"
#import <objc/runtime.h>

@implementation ZYTextField


//查看某一个类中有哪些隐藏的属性，测试的时候写在- (void)awakeFromNib方法中
- (void) checkHiddenAttributesFromClass
{
    unsigned int count = 0;
//    传入你想要查看的类名，例如下面是要查看UITextField这个类中隐藏的属性有哪些
    Ivar* ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0 ; i < count; i ++)
    {
        Ivar ivar = *(ivars + i);
        NSLog(@"%s",ivar_getName(ivar));
    }
    free(ivars); //销毁copy出来的内存空间 C语言的做法
}


//利用runTime的方法查看一个类里面隐藏的成员变量（属性）
- (void)awakeFromNib
{
//    self.tintColor = self.textColor;
//    该开始进入页面的时候不响应Textfield控件，默认就是这样的。
    [self resignFirstResponder];
}


- (BOOL)becomeFirstResponder
{
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.TextColor"];
    return [super resignFirstResponder];
}


/**占位文字的颜色属性，为外界提供一个接口，这样以后利用当前的类（ZYTextField），通过alloc init 的方式创建UITextfield控件的时候，就容易更改占位文字的颜色！**/
- (void)setPlaceholderLabelTextColor:(UIColor *)placeholderLabelTextColor
{
    _placeholderLabelTextColor = placeholderLabelTextColor;
    [self setValue:placeholderLabelTextColor forKeyPath:@"_placeholderLabel.TextColor"];
}


@end
