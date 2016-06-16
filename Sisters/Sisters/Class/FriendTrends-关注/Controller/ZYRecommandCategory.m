//
//  ZYRecommandCategory.m
//  Sisters
//
//  Created by ZhouYong on 16/6/7.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYRecommandCategory.h"

@implementation ZYRecommandCategory

- (NSMutableArray *)users{
    if (_users == nil) {
        _users = [[NSMutableArray alloc] initWithCapacity:0];
    }return _users;
}

@end
