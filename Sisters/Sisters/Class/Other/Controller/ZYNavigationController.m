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


//当第一次使用这个类的时候回执行一次
+ (void)initialize{
    UINavigationBar* navigationBar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    ZYLogFun
//    MainTagSubIcon
//    navigationbarBackgroundWhite
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor blackColor];
    
//    通过下面的做法，以后不管是用ZYNavigationController创建的导航控制器还是用系统方法创建的导航视图控制器，它的UINavigationBar背景图都是一样的。因为直接使用了appearance.
//    UINavigationBar* navigationBar = [UINavigationBar appearance];
//    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    UINavigationBar* navigationBar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
//    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}



#pragma mark*******可以在这个方法里面拦截所有push进来的控制器***
/*****************************************************************
 ************CreateDate:Year:2016 Month:06 Date:04 ************
 ***************Creator:周勇**************************
 ****Function Describle:可以拦截所有push进来的控制器***
 ****************Remark:将自定义的button当作视图控制器的返回Item***
 ****************************************************************/
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{    //判断一旦进入视图控制器的子控制器，也就是点击进去后，自定义的视图控制器返回的Item才会显示，以免干扰其他的图层
    if (self.childViewControllers.count>0) {
        UIButton* backBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBarButton setTitle:@"返回" forState:UIControlStateNormal];
        [backBarButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted]; //这个地方不是setBackgroundImage
        [backBarButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];  //这个地方不是setBackgroundImage
        backBarButton.size = CGSizeMake(100, 30); //这样很low逼,但是可以增大点击范围
//        backBarButton.contentMode = UIViewContentModeBottomLeft; //作用于UIImageView,对button无效
//        backBarButton.backgroundColor = [UIColor redColor]; //用于测试的color，不用了。
        backBarButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; //让按钮内部所有内容左对齐
        backBarButton.contentEdgeInsets = UIEdgeInsetsMake(0,-10, 0, 0); //让文字和作用区域左偏移
        /*
        backBarButton.backgroundColor = [UIColor redColor];
        [backBarButton sizeToFit]; //让尺寸跟随里面的内容,这种做大很高大上的,以后一直会用到
        */
        [backBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBarButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBarButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBarButton];
        viewController.hidesBottomBarWhenPushed = YES;//当弹入一个新的视图控制器的时候，隐藏下面的标签栏tabbar
    }
//    我们这样做的目的是什么？
    [super pushViewController:viewController animated:animated];//进入下一级视图控制器
}



- (void)back{
    [self popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    关于UIButton，既可以采用setBackgroundImage 来设置底部图片，同时也可以采用  setImage方法；
//    两者还是有一定区别的；

//    首先setBackgroundImage，image会随着button的大小而改变，图片自动会拉伸来适应button的大小，这个时候任然可以设置button的title，image不会挡住title；
    
//    相反的的setImage，图片不会进行拉伸，原比例的显示在button上，此时再设置title，title将无法显示，因此可以根据需求选中方法；
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
