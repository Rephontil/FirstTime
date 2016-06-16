//
//  ZYUserTableViewCell.h
//  Sisters
//
//  Created by ZhouYong on 16/6/12.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYRecommandUser;

@interface ZYUserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *screen_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fans_countLabel;

/**用户模型类**/
@property(nonatomic, strong)ZYRecommandUser* user;

@end
