//
//  ZYTabBarController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/1.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYTabBarController.h"

@interface ZYTabBarController ()

@end

@implementation ZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController* VC1 = [[UIViewController alloc] init];
    VC1.tabBarItem.title = @"精华";
    VC1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    VC1.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    VC1.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController* VC2 = [[UIViewController alloc] init];
    VC2.tabBarItem.title = @"新帖";
    VC2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    VC2.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    VC2.view.backgroundColor = [UIColor yellowColor];
    
    
    UIViewController* VC3 = [[UIViewController alloc] init];
    VC3.tabBarItem.title = @"关注";
    VC3.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    VC3.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    VC3.view.backgroundColor = [UIColor magentaColor];
    
    
    UIViewController* VC4 = [[UIViewController alloc] init];
    VC4.tabBarItem.title = @"我";
    VC4.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    VC4.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    
    //    当标题栏本选中的时候更改其字体大小和颜色（笨拙的方法），传入的是字典类型的数据
    NSMutableDictionary* dicNormal = [NSMutableDictionary dictionary];
    dicNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    dicNormal[NSForegroundColorAttributeName] = [UIColor redColor];
    [VC4.tabBarItem setTitleTextAttributes:dicNormal forState:UIControlStateNormal];
    
    NSMutableDictionary* dicSelected = [NSMutableDictionary dictionary];
    dicSelected[NSFontAttributeName] = [UIFont systemFontOfSize:5];
    dicSelected[NSForegroundColorAttributeName] = [UIColor blueColor];
    [VC4.tabBarItem setTitleTextAttributes:dicSelected forState:UIControlStateSelected];
    
    VC4.view.backgroundColor = [UIColor cyanColor];
    
    
    self.viewControllers = @[VC1,VC2,VC3,VC4];
    
    

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
