//
//  ZYTabBarController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/1.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYTabBarController.h"
#import "ZYEssenceViewController.h"
#import "ZYmeViewController.h"
#import "ZYNewViewController.h"
#import "ZYfriendTrendsViewController.h"
#import "ZYTabBar.h"

@interface ZYTabBarController ()

@end

@implementation ZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    当标题栏本选中的时候更改其字体大小和颜色（笨拙的方法），传入的是字典类型的数据
    NSMutableDictionary* dicNormal = [NSMutableDictionary dictionary];
    dicNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    dicNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary* dicSelected = [NSMutableDictionary dictionary];
    dicSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    dicSelected[NSForegroundColorAttributeName] = [UIColor blueColor];
    
//    后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象统一设置
//    通过appearance设置所有UITabBarItem的文字属性
    UITabBarItem* item = [UITabBarItem appearance];
    [item setTitleTextAttributes:dicNormal forState:UIControlStateNormal];
    [item setTitleTextAttributes:dicSelected forState:UIControlStateSelected];
    
    
    
//    UIViewController* VC1 = [[UIViewController alloc] init];
//    VC1.tabBarItem.title = @"精华";
//    VC1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
//    VC1.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
//    VC1.view.backgroundColor = [UIColor purpleColor];
//    
//
//    
//    self.viewControllers = @[VC1,VC2,VC3,VC4];
    
    
    [self setupChildVCWithVC:[[ZYEssenceViewController alloc] init] Title:@"精华" Image:@"tabBar_essence_icon" SelectedImage:@"tabBar_essence_click_icon"];
    [self setupChildVCWithVC:[[ZYNewViewController alloc] init] Title:@"新帖" Image:@"tabBar_new_icon" SelectedImage:@"tabBar_new_click_icon"];
    [self setupChildVCWithVC:[[ZYfriendTrendsViewController alloc] init] Title:@"关注" Image:@"tabBar_friendTrends_icon" SelectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupChildVCWithVC:[[ZYmeViewController alloc] init] Title:@"我" Image:@"tabBar_me_icon" SelectedImage:@"tabBar_me_click_icon"];
    
//    UIButton* publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
//    [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
//    publishButton.frame = CGRectMake(0, 0, publishButton.currentBackgroundImage.size.width, publishButton.currentBackgroundImage.size.height);
//    publishButton.center = CGPointMake(self.tabBar.frame.size.width*0.5, self.tabBar.frame.size.height*0.5);
//    [self.tabBar addSubview:publishButton];
    
//    self.tabBar = [[ZYTabBar alloc] init];
    
    [self setValue:[[ZYTabBar alloc] init] forKey:@"tabBar"];
    
}


//系统子视图控制器的配置
- (void)setupChildVCWithTitle:(NSString*)title Image:(NSString*)image SelectedImage:(NSString*)selectedImage
{
    UIViewController* VC = [[UIViewController alloc] init];
    VC.tabBarItem.title = title;
    VC.tabBarItem.selectedImage = [UIImage imageNamed:image];
    VC.tabBarItem.image = [UIImage imageNamed:selectedImage];
    VC.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1];
    [self addChildViewController:VC];
}



//系统子视图控制器的配置
- (void)setupChildVCWithVC:(UIViewController*)VC Title:(NSString*)title Image:(NSString*)image SelectedImage:(NSString*)selectedImage
{
    VC.tabBarItem.title = title;
    VC.tabBarItem.selectedImage = [UIImage imageNamed:image];
    VC.tabBarItem.image = [UIImage imageNamed:selectedImage];
    VC.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1];
    [self addChildViewController:VC];
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
