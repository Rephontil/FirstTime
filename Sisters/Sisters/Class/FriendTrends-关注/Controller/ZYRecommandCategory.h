//
//  ZYRecommandCategory.h
//  Sisters
//
//  Created by ZhouYong on 16/6/7.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZYRecommandCategory : NSObject
/**<#注释#>**/
@property(nonatomic, assign)NSInteger id;
/**<#注释#>**/
@property(nonatomic, assign)NSInteger count;
/**<#注释#>**/
@property(nonatomic, strong)NSString* name;

/**用来保存用户的类别**/
@property(nonatomic, strong)NSMutableArray* users;

/** 当前页码 */
@property (nonatomic, assign) NSInteger currentPage;

/** 总数 */
@property (nonatomic, assign) NSInteger total;






@end
