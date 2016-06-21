//
//  ZYRecommendTagModel.h
//  Sisters
//
//  Created by ZhouYong on 16/6/18.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYBaseModel.h"

@interface ZYRecommendTagModel : ZYBaseModel

/**图片**/
@property(nonatomic, copy)NSString* image_list;

/**名称**/
@property(nonatomic, copy)NSString* theme_name;

/**关注数量**/
@property(nonatomic, assign)NSInteger sub_number;

/**theme_id**/
@property(nonatomic, copy)NSString* theme_id;



@end
