//
//  ZYTabBar.m
//  Sisters
//
//  Created by ZhouYong on 16/6/1.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYTabBar.h"

@interface ZYTabBar ()
@property(nonatomic, retain)UIButton* publishButton;
@end

@implementation ZYTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton* publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    NSLog(@"initWithFrame--我被调用了%@",self);
    return self;
}


//布局子控件  重写自定义布局的方法
- (void)layoutSubviews
{
    [super layoutSubviews];
//    设置发布按钮的frame
    self.publishButton.frame = CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    self.publishButton.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);

    
//    设置其他UITabBarButton的fram
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width/5;
    CGFloat buttonY = 0;
    NSInteger index = 0;
    
    for (UIView* button in self.subviews)//self 指代当前的TabBar.其上的所有控件都属于UIView的子类。也可以用UITabBarButton来遍历，然后做其他判断处理
    {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat buttonX = buttonW * ((index>1)?(index+1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index++;
    }
//    三目运算符
//     （index > 1）？（index+1：index）
    NSLog(@"layoutSubviews--我被调用了%@",self);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
