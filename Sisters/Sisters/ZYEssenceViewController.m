//
//  ZYEssenceViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/1.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYEssenceViewController.h"

@interface ZYEssenceViewController ()

@end

@implementation ZYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//   通过 initWithImage这个方法image的尺寸和图片的尺寸大小一样，不需要自己处理
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
//    系统的方法创建UIBarButtonItem对象，没有采用
    /*
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MainTagSubIconClick"] style:(UIBarButtonItemStylePlain) target:self action:@selector(UIBarButtonItem:)];
     */
//    通过一个自定义的UIButton作为UIBarButtonItem的对象，设置不同状态下的背景和事件响应方法
    UIButton* tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [tagButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [tagButton addTarget:self action:@selector(tagButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    /* 第一种设置按钮大小方法
//    tagButton.width = 20;
//    tagButton.height = 20;
    */
//    第二种设置方法
    tagButton.size = tagButton.currentBackgroundImage.size;
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:tagButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    
    // Do any additional setup after loading the view.
}

- (void)tagButtonClick{
    self.view.backgroundColor = [UIColor blackColor];
//    NSLog(@"哇哈哈");
    ZYLog(@"%s",__func__);
    
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
