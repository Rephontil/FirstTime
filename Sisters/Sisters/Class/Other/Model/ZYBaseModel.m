//
//  ZYBaseModel.m
//  Sisters
//
//  Created by ZhouYong on 16/6/18.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYBaseModel.h"

@implementation ZYBaseModel

//可以通过工厂的方法，建立一个BaseModel的类，以后建立的模型的类都继承自这个BaseModel，这样setValue....forUndefinedKey方法只需要在父类中写一次
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //这里面不做任何处理
}


@end
