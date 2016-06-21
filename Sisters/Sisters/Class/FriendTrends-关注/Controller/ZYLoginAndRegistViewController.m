//
//  ZYLoginAndRegistViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/19.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYLoginAndRegistViewController.h"

#import "ZYTextField.h"

@interface ZYLoginAndRegistViewController ()

@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginLoginLeftMargin;

@property (weak, nonatomic) IBOutlet ZYTextField *registUserNameTF;

@property (weak, nonatomic) IBOutlet ZYTextField *registPasswordTF;

@end

@implementation ZYLoginAndRegistViewController

- (IBAction)backBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
//        [UIView animateWithDuration:1 animations:^{
//            [self.view layoutIfNeeded];
//        }];
    }];
}


//用来登录的按钮
- (IBAction)registAndLoginBtn:(UIButton*)button
{
    [self.view endEditing:YES];
    //    进来之前先做个判断
    if (self.loginLoginLeftMargin.constant == 0) {
        //    让登录框向左移动一个视图控制器的距离，显示注册界面
        self.loginLoginLeftMargin.constant = -self.view.width;
        
        //        设置一个button的状态，这样可以在XIB里面填写button的显示文字，不需要通过代码写
        button.selected = YES;
        
        //        [button setTitle:@"注册账号" forState:UIControlStateNormal];
    }
    else
    {
        //    让登录框呈现
        self.loginLoginLeftMargin.constant = 0;
        button.selected = NO;
        //        [button setTitle:@"已有账号？" forState:UIControlStateNormal];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

//用来注册的完成按钮
- (IBAction)RegistPageBtn:(UIButton *)sender {
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    给button控件设置圆角
    self.registBtn.layer.cornerRadius = 10;
//    让button控件内部的背景也遵循这个圆角规则
    self.registBtn.layer.masksToBounds = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}


//设置状态栏（电源和信号格式栏目）的高亮状态，也就是白色的,直接重写这个方法就可以完成！
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
