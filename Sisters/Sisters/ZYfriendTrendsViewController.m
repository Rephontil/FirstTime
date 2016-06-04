//
//  ZYfriendTrendsViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/1.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYfriendTrendsViewController.h"

@interface ZYfriendTrendsViewController ()

@end

@implementation ZYfriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的关注";
//     self.title = @"我的关注"; // 这种写法会同时修改 self.navagationItem.title和self.barbuttonItem.title
    
    /*  这段代码已经用自定义的UIBarButtonItem方法抽取
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    leftButton.size = leftButton.currentBackgroundImage.size;
    */
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(leftButtonClick)];
    
    
    // Do any additional setup after loading the view.
}


- (void)leftButtonClick{
//    ZYLog(@"%s",__func__);
    ZYLogFun
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
