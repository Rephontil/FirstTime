//
//  ZYTopicTableVC.h
//  Sisters
//
//  Created by ZhouYong on 16/7/4.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ZYTopicTypeAll = 1, //全部
    ZYTopicTypePicture = 10,  //图片
    ZYTopicTypeWord = 29, // 段子
    ZYTopicTypeVoice = 31,  //声音
    ZYTopicTypeVideo = 41   //视频
}ZYTopicType;


@interface ZYTopicTableVC : UITableViewController

/**帖子类型标志**/
@property(nonatomic, assign)ZYTopicType type;


@end
