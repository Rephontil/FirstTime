//
//  ZYPushRecommendView.m
//  Sisters
//
//  Created by ZhouYong on 16/6/21.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYPushRecommendView.h"
#import "AppDelegate.h"

@implementation ZYPushRecommendView

- (IBAction)iKnownBtn:(UIButton *)sender {
    [self removeFromSuperview];
}

+ (instancetype)guideView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

+ (void)showPushRecommend{
    
    NSString* versionKey = @"CFBundleShortVersionString";
//    拿到当前工程的版本号
    NSString* currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
//    查看之前存过的版本号
    NSString* previousVersion = [[NSUserDefaults standardUserDefaults] valueForKey:versionKey];
    
    if (![currentVersion isEqualToString:previousVersion]) {
        //   拿到项目的window
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        ZYPushRecommendView* pushRecommendView = [ZYPushRecommendView guideView];
        pushRecommendView.frame = window.bounds;
        [window addSubview:pushRecommendView];
        
        //    存储当前的版本
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:versionKey];
//        立即同步到本地存储
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
