//
//  ZYRecommandUser.h
//  Sisters
//
//  Created by ZhouYong on 16/6/16.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYRecommandUser : NSObject

//introduction : ,
//uid : 9017486,
//header : http://wimg.spriteapp.cn/profile/large/2015/09/30/560b557be210a_mini.jpg,
//gender : 2,
//is_vip : 0,
//fans_count : 5497,
//tiezi_count : 276,
//is_follow : 0,
//screen_name : 孙逊 等1227人

/**头像**/
@property(nonatomic, copy)NSString* header;
/**剧名**/
@property(nonatomic, copy)NSString* screen_name;
/**粉丝人数**/
@property(nonatomic, assign)NSInteger fans_count;





@end
