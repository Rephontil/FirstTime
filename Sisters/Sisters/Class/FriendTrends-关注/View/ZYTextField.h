//
//  ZYTextField.h
//  Sisters
//
//  Created by ZhouYong on 16/6/20.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYTextField : UITextField

/**占位文字的颜色属性，为外界提供一个接口，这样以后利用当前的类（ZYTextField），通过alloc init 的方式创建UITextfield控件的时候，就容易更改占位文字的颜色！**/
@property(nonatomic, strong)UIColor* placeholderLabelTextColor;



@end
