//
//  UIBarButtonItem+ZYExtension.h
//  Sisters
//
//  Created by ZhouYong on 16/6/4.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZYExtension)

+ (instancetype)itemWithImage:(NSString*)image highImage:(NSString*)highImage target:(id)target action:(SEL)action;
@end
