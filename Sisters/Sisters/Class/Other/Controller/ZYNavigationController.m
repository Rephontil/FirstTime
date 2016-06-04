//
//  ZYNavigationController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/4.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYNavigationController.h"

@interface ZYNavigationController ()

@end

@implementation ZYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
    
    
}



#pragma mark*******可以在这个方法里面拦截所有push进来的控制器***
/*****************************************************************
 ************CreateDate:Year:2016 Month:06 Date:04 ************
 ***************Creator:周勇**************************
 ****Function Describle:可以拦截所有push进来的控制器***
 ****************Remark:<#**************************************#>***
 ****************************************************************/

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count>0) {
        UIButton* backBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBarButton setTitle:@"返回" forState:UIControlStateNormal];
        [backBarButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBarButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        backBarButton.size = CGSizeMake(100, 30); //这样很low逼
//        backBarButton.contentMode = UIViewContentModeBottomLeft;
//        backBarButton.backgroundColor = [UIColor redColor]; //用于测试的color，不用了。
        backBarButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backBarButton.contentEdgeInsets = UIEdgeInsetsMake(0,-10, 0, 0);
        
        
        /*
        backBarButton.backgroundColor = [UIColor redColor];
        [backBarButton sizeToFit]; //让尺寸跟随里面的内容,这种做大很高大上的
        */
        [backBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBarButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBarButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBarButton];
        viewController.hidesBottomBarWhenPushed = YES;//当弹入一个新的视图控制器的时候，隐藏下面的标签栏tabbar
        
    }
//    我们这样做的目的是什么？
    [super pushViewController:viewController animated:animated];

}

- (void)back{
    [self popViewControllerAnimated:YES];
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
