//
//  ZYWordCell.h
//  Sisters
//
//  Created by ZhouYong on 16/6/23.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYWordModel.h"
@interface ZYWordCell : UITableViewCell

/**段子模型**/
@property(nonatomic, strong)ZYWordModel* wordModel;

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIButton *dingBtn;

@property (weak, nonatomic) IBOutlet UIButton *caiBtn;

@property (weak, nonatomic) IBOutlet UIButton *sharedBtn;

@property (weak, nonatomic) IBOutlet UIButton *commentBtn;





@end
