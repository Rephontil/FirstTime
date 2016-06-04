//
//  UIBarButtonItem+ZYExtension.m
//  Sisters
//
//  Created by ZhouYong on 16/6/4.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "UIBarButtonItem+ZYExtension.h"

@implementation UIBarButtonItem (ZYExtension)
+ (instancetype)itemWithImage:(NSString*)image highImage:(NSString*)highImage target:(id)target action:(SEL)action
{
    /*  如果UIBarButtonItem还有头视图，那么在便利构造器方法里面实现下面的代码
    //   通过 initWithImage这个方法image的尺寸和图片的尺寸大小一样，不需要自己处理
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
     */
    //    系统的方法创建UIBarButtonItem对象，没有采用
    /*
     UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MainTagSubIconClick"] style:(UIBarButtonItemStylePlain) target:self action:@selector(UIBarButtonItem:)];
     */
    //    通过一个自定义的UIButton作为UIBarButtonItem的对象，设置不同状态下的背景和事件响应方法
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    /* 第一种设置按钮大小方法
     //    tagButton.width = 20;
     //    tagButton.height = 20;
     */
    //    第二种设置方法
    button.size = button.currentBackgroundImage.size;
    UIBarButtonItem* barbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barbuttonItem;
}
@end
