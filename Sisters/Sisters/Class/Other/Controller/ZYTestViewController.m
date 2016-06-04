//
//  ZYTestViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/4.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYTestViewController.h"

@interface ZYTestViewController ()

@end

@implementation ZYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Hello" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.view.backgroundColor = [UIColor redColor];
    ZYLogFun
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
