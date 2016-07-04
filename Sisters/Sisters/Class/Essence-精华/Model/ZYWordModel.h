//
//  ZYWordModel.h
//  Sisters
//
//  Created by ZhouYong on 16/6/22.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYBaseModel.h"

@interface ZYWordModel : ZYBaseModel

/**<#注释#>**/
@property(nonatomic, strong)NSString* cache_version;

/**<#注释#>**/
@property(nonatomic, strong)NSString* created_at;

/**<#注释#>**/
@property(nonatomic, assign)NSInteger repost;

/**<#注释#>**/
@property(nonatomic, strong)NSString* text;

/**<#注释#>**/
@property(nonatomic, strong)NSString* hate;

/**<#注释#>**/
@property(nonatomic, assign)NSInteger ding;

/**<#注释#>**/
@property(nonatomic, assign)NSInteger comment;

/**<#注释#>**/
@property(nonatomic, strong)NSString* passtime;

/**<#注释#>**/
@property(nonatomic, strong)NSString* create_time;

/**<#注释#>**/
@property(nonatomic, strong)NSString* name;

/**<#注释#>**/
@property(nonatomic, strong)NSString* bookmark;

/**<#注释#>**/
@property(nonatomic, assign)NSInteger cai;

/**<#注释#>**/
@property(nonatomic, strong)NSString* screen_name;

/**<#注释#>**/
@property(nonatomic, strong)NSString* profile_image;



@end
