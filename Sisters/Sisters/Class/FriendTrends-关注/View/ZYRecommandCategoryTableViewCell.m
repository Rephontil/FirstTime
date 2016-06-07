//
//  ZYRecommandCategoryTableViewCell.m
//  Sisters
//
//  Created by ZhouYong on 16/6/7.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYRecommandCategoryTableViewCell.h"

@interface ZYRecommandCategoryTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation ZYRecommandCategoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = ZYRGBColor(244, 244, 244)
    self.textLabel.textColor = ZYRGBColor(28, 28, 28)
    self.textLabel.highlightedTextColor = ZYRGBColor(219, 21, 26)
    
//    这个view用于选中cell的时候让其颜色不要改变
    self.selectedBackgroundView = [[UIView alloc] init];
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView.contentMode = UIViewContentModeTop;

}




//这里为什么有这么方法？这个写法太牛逼了，以后不用自己写初始化方法了！！！
/*˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚
 @property(nonatomic, strong)ZYRecommandCategory* category;
每个属性都有这样的系统的set方法，省略之前那种init方法的传值！！
 ˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚˚*/
- (void)setCategory:(ZYRecommandCategory *)category
{
    _category = category;
    self.textLabel.text = category.name;
}


//重写内部布局
- (void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2*self.textLabel.y;
}


//@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
//    选中的时候不隐藏这个view，不选中的时候就隐藏这个view
    self.selectedIndicator.hidden = !selected;
//    这个三目运算符有点厉害啊
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : ZYRGBColor(78, 78, 78);
    
//  我之前的那种写法一直不能实现是因为：本人的宏定义文件里面ZYGlobalColor语句后面有符号，读取的时候回中断代码执行
}



@end
