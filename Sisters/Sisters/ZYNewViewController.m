//
//  ZYNewViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/1.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYNewViewController.h"

@interface ZYNewViewController ()

@end

@implementation ZYNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateHighlighted];
    [newButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:newButton];
    [newButton addTarget:self action:@selector(newButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    newButton.size = newButton.currentBackgroundImage.size;

//    MainTagSubIconClick
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)newButtonClick{
    
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
