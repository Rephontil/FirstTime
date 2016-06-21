//
//  ZYUserTableViewCell.m
//  Sisters
//
//  Created by ZhouYong on 16/6/12.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYUserTableViewCell.h" 
#import "ZYRecommandUser.h"
#import <UIImageView+WebCache.h>

@implementation ZYUserTableViewCell

- (void)setUser:(ZYRecommandUser *)user{
    _user = user;
    
    
    self.screen_nameLabel.text = user.screen_name;
    self.fans_countLabel.text = [NSString stringWithFormat:@"%ld",(long)user.fans_count];
    
//    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"nil"]];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
