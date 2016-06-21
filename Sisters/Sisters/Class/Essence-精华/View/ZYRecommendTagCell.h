//
//  ZYRecommendTagCell.h
//  Sisters
//
//  Created by ZhouYong on 16/6/18.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class ZYRecommendTagModel;
#import "ZYRecommendTagModel.h"
@interface ZYRecommendTagCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *image_listImageView;


@property (weak, nonatomic) IBOutlet UILabel *theme_nameLabel;


@property (weak, nonatomic) IBOutlet UILabel *sub_numberLabel;



/**model**/
@property(nonatomic, strong)ZYRecommendTagModel* model;




@end
