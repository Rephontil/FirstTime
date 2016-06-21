//
//  ZYRecommendTagCell.m
//  Sisters
//
//  Created by ZhouYong on 16/6/18.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYRecommendTagCell.h"
#import <UIImageView+WebCache.h>

@implementation ZYRecommendTagCell

//这个模型是一个属性
- (void)setModel:(ZYRecommendTagModel *)model{
    _model = model;
    [self.image_listImageView sd_setImageWithURL:[NSURL URLWithString:model.image_list] placeholderImage:[UIImage imageNamed:@"author.jpg"]];
    self.theme_nameLabel.text = model.theme_name;
    
    if (model.sub_number >= 10000)
    {
        NSInteger integer = model.sub_number/10000;
        NSInteger floatNub = model.sub_number%10000/1000;
        self.sub_numberLabel.text = [NSString stringWithFormat:@"%ld.%ld万",integer,floatNub];
    }else{
        self.sub_numberLabel.text = [NSString stringWithFormat:@"%ld",model.sub_number];
    }
}



//如果我们自己创建的控件不希望外界修改我们的尺寸，我们需要在内部重写setFrame 或者setBounds方法，这样外界就无法修改我们的控件大小
- (void)setFrame:(CGRect)frame{
    frame.origin.x = 5;
    frame.size.width -= 2*frame.origin.x;
    frame.size.height -= 3;
    [super setFrame:frame];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
