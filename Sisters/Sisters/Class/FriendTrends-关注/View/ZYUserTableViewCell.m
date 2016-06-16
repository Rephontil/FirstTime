//
//  ZYUserTableViewCell.m
//  Sisters
//
//  Created by ZhouYong on 16/6/12.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYUserTableViewCell.h"
#import "ZYRecommandUser.h"

@implementation ZYUserTableViewCell

- (void)setUser:(ZYRecommandUser *)user{
    self.headImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.header]]];
    
    self.screen_nameLabel.text = user.screen_name;
    self.fans_countLabel.text = [NSString stringWithFormat:@"%ld",(long)user.fans_count];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
