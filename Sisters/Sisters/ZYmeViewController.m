//
//  ZYmeViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/1.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYmeViewController.h"

@interface ZYmeViewController ()

@end

@implementation ZYmeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    UIButton* settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    setting按钮点击时候的背景图
    [settingButton setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
//    setting按钮自然状态下的背景图
    [settingButton setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    settingButton.size = settingButton.currentBackgroundImage.size;
//    给UIBarButtonItem设置样式（选用我们自定义的settingButton）
    
//    mine-sun-icon-click
    UIButton* nightingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    setting按钮点击时候的背景图
    [nightingButton setBackgroundImage:[UIImage imageNamed:@"mine-sun-icon-click"] forState:UIControlStateHighlighted];
    //    setting按钮自然状态下的背景图
    [nightingButton setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    nightingButton.size = nightingButton.currentBackgroundImage.size;

    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:nightingButton],[[UIBarButtonItem alloc] initWithCustomView:settingButton]];
    
    
    
    
    
    
    
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
