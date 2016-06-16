//
//  ZYRecommendViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/5.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYRecommendViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "ZYRecommandCategoryTableViewCell.h"
#import "ZYRecommandCategory.h"
#import "ZYUserTableViewCell.h"
#import "ZYRecommandUser.h"


@interface ZYRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>

/**左边的类别节目数组**/
@property(nonatomic, strong)NSArray* categorys;
/**右边的用户数组**/
//@property(nonatomic, strong)NSArray* users;
/**左边的类别类别**/
@property (weak, nonatomic) IBOutlet UITableView *categoryTableview;

/**右边的类别类别**/
@property (weak, nonatomic) IBOutlet UITableView *userTableview;

@end

@implementation ZYRecommendViewController

static NSString* const ZYCategoryID = @"recommandcell";
static NSString* const ZYUserID = @"userCell";




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableview) {
        //     注册
        ZYRecommandCategoryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ZYCategoryID];
        //    模型传值
        cell.category = self.categorys[indexPath.row];
        return cell;
    }
    else{
        //     注册
        ZYUserTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ZYUserID];
        //    模型传值
//        [self.categoryTableview.indexPathForSelectedRow.row]//得到当前点击的tableview的行数
        ZYRecommandCategory* c = self.categorys[self.categoryTableview.indexPathForSelectedRow.row];
        cell.user = c.users[indexPath.row];
        return cell;
        
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    ZYLog(@"zhouyong%lu",(unsigned long)self.categorys.count);
    if (tableView == self.categoryTableview) {
        return self.categorys.count;
    }
    else
    {
        ZYRecommandCategory* c = self.categorys[self.categoryTableview.indexPathForSelectedRow.row];
        return c.users.count;
        

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYRecommandCategory* c = self.categorys[indexPath.row];
    NSLog(@"clicled%ld",indexPath.row);
//    点击以后要解析数据
    NSMutableDictionary* para = [NSMutableDictionary dictionary];
    para[@"a"] = @"list";
    para[@"c"] = @"subscribe";
    para[@"category_id"] = @(c.id);
    
    if (c.users.count > 0)
    {
        [self.userTableview reloadData];
    }
    else
    {
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:para progress:^(NSProgress * _Nonnull downloadProgress)
         {
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             ZYLog(@"%@",[responseObject class]);
             NSLog(@"------------------------------%@",responseObject);
             
#pragma mark - 字典数组 -> 模型数组
             NSArray* users = [ZYRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
             //         将用户的数据保存到ZYRecommandCategory的用户数组中去
             [c.users addObjectsFromArray:users];
             //         刷新用户的tableview
             [self.userTableview reloadData];
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             
         }];
    }
//    目前存在的三点问题：1网络慢带来用户视觉效果差  2重复发送网络请求，浪费流量资源 3只能请求到一页的数据资源
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.categoryTableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZYRecommandCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZYCategoryID];
    [self.userTableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZYUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZYUserID];
    

    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = ZYGlobalColor
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0  );
    self.userTableview.contentInset = self.categoryTableview.contentInset;
    self.userTableview.rowHeight = 80;
    
//    显示指示器
    [SVProgressHUD show]; //这样会一直转圈，不退出。
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    
    
    NSMutableDictionary* paras = [NSMutableDictionary dictionary];
    paras[@"a"] = @"category";     //
    paras[@"c"] = @"subscribe";    //
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ZYLog(@"%@",responseObject);
        ZYLog(@"%@",[responseObject class]); //查看responseObject的类型，呵呵字典
        [SVProgressHUD dismiss]; //一旦请求到数据就消失转圈圈！
        
        #pragma mark - 字典数组 -> 模型数组
        self.categorys = [ZYRecommandCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
//         ZYRecommandCategory* zy= [[ZYRecommandCategory alloc] init];
//        self.categorys = [responseObject valueForKey:@"list"];
//          // 这样为什么不行?
//        NSArray* array = [responseObject valueForKey:@"list"];
//        NSLog(@"array count is %lu/n%@",(unsigned long)array.count,array);
        
        
        [self.categoryTableview reloadData];
//        每次数据刷新后，默认为第一行选中
        [self.categoryTableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        ZYLog(@"zhouyong%lu",(unsigned long)self.categorys.count);
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYLog(@"Failure");
//        失败了也要消失
//        [SVProgressHUD dismiss]; //一旦请求到数据就消失转圈圈！
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败！请检查网络连接"];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
