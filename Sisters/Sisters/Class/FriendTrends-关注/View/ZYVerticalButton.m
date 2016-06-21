//
//  ZYVerticalButton.m
//  Sisters
//
//  Created by ZhouYong on 16/6/20.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYVerticalButton.h"

@implementation ZYVerticalButton


//一旦调用这个类，我们就会立即执行这个方法
- (void)awakeFromNib
{
    [self setUp];
}

- (void)setUp
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


//如果外界用这个类的initWIthFrame的方法自己创建button，就走下面的方法，创建出来的button的内部布局还是我们自定义的布局。
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


- (void)layoutSubviews
{
//    MD,第一次把父类的初始化方法给忘掉了，真坑爹啊！！
    [super layoutSubviews];
//    对button内部图片和图片尺寸的配置
    self.imageView.x = 0 ;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;

    
//    对button内部文字一起文字尺寸和位置的配置
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
//    self.titleLabel.height = self.height - self.imageView.height;
    
}










@end
