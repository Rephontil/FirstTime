//
//  UIView+ZYExternsion.h
//  Sisters
//
//  Created by ZhouYong on 16/6/3.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZYExternsion)

@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat height;
@property(nonatomic, assign)CGFloat x;
@property(nonatomic, assign)CGFloat y;

//在分类中声明@property属性，只会生成方法声明，不会生成方法的实现和带有_下划线的成员变量。
//


@end
