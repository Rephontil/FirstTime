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
#import <MJRefresh.h>

//宏定义  获得当前选中的对象模型
#define ZYRecommandCategoryType self.categorys[self.categoryTableview.indexPathForSelectedRow.row]


@interface ZYRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>

/**左边的类别节目数组**/
@property(nonatomic, strong)NSArray* categorys;
/**左边的类别类别**/
@property (weak, nonatomic) IBOutlet UITableView *categoryTableview;

/**右边的类别类别**/
@property (weak, nonatomic) IBOutlet UITableView *userTableview;

/** 请求参数 */
@property (nonatomic, strong) NSMutableDictionary *params;

/** AFN请求管理者 */
@property (nonatomic, strong) AFHTTPSessionManager *manager;


@end

@implementation ZYRecommendViewController

//cell的重用标志
static NSString* const ZYCategoryID = @"recommandcell";
static NSString* const ZYUserID = @"userCell";


- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
//    控件初始化
    [self setUpRefresh];
    
    [self loadCatelogy];
}


//视图控制器的基本配置
- (void)setUpTableView{
    [self.categoryTableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZYRecommandCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZYCategoryID];
    [self.userTableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZYUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZYUserID];
    
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = ZYGlobalColor
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    设置tableview的的起始位置紧随导航栏的底部
    self.categoryTableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0  );
    self.userTableview.contentInset = self.categoryTableview.contentInset;
    self.userTableview.rowHeight = 80;
}


- (void)loadCatelogy{
    //    显示指示器
    //    [SVProgressHUD show]; //这样会一直转圈，不退出。
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    
    NSMutableDictionary* paras = [NSMutableDictionary dictionary];
    paras[@"a"] = @"category";     //
    paras[@"c"] = @"subscribe";    //
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        ZYLog(@"%@",responseObject);
//        ZYLog(@"%@",[responseObject class]); //查看responseObject的类型，呵呵字典
        [SVProgressHUD dismiss]; //一旦请求到数据就消失转圈圈！
        
#pragma mark - 字典数组 -> 模型数组
        self.categorys = [ZYRecommandCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.categoryTableview reloadData];
        //        每次数据刷新后，默认选中第一行选中
        [self.categoryTableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
//        默认进入用户界面的时候显示第一栏目的相关的内容界面
        [self.userTableview.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYLog(@"Failure");
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败！请检查网络连接"];
    }];
}



//上拉刷新数据
- (void)setUpRefresh{
    self.userTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    self.userTableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
//    self.userTableview.mj_header = 
//     在没有数据的时候隐藏底部刷新的状态图
    self.userTableview.mj_footer.hidden = YES;
}

#pragma mark - 加载用户数据
- (void)loadNewUsers{
    ZYRecommandCategory* c = self.categorys[self.categoryTableview.indexPathForSelectedRow.row];
    c.currentPage = 1;  //设置当前的页码为1
    //        一旦用户点击，立刻刷新数据（针对网络慢的时候卡顿现象）
    //    点击以后要解析数据
    NSMutableDictionary* para = [NSMutableDictionary dictionary];
    para[@"a"] = @"list";
    para[@"c"] = @"subscribe";
    para[@"category_id"] = @(c.id);
    para[@"page"] = @(c.currentPage);
    self.params = para;
    

    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:para progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
#pragma mark - 字典数组 -> 模型数组
         NSArray* users = [ZYRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
//        清除所有的旧数据
         [c.users removeAllObjects];
         
//         添加到当前类别对应的数组中
         [c.users addObjectsFromArray:users];
         
//         保存总数  类型转换
         c.total = [responseObject[@"total"] integerValue];
         if (self.params!= para) { //不是最后一次请求
             return ;
         }
         
//         刷新右边的表格
         [self.userTableview reloadData];
//         结束刷新
         [self.userTableview.mj_header endRefreshing];
//         让底部控件结束刷新
         [self checkFooterState];


     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         if (self.params!= para) {
             return ;
         }
         // 提醒
         [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
         
         // 结束刷新
         [self.userTableview.mj_header endRefreshing];
     }];
}




//上拉加载更多数据
- (void)loadMoreUsers
{
    ZYRecommandCategory *category = ZYRecommandCategoryType;
    
    // 发送请求给服务器, 加载右侧的数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(++category.currentPage);
    
//    self.params永远存储最后一次的请求参数
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 字典数组 -> 模型数组
        NSArray *users = [ZYRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 添加到当前类别对应的用户数组中
        [category.users addObjectsFromArray:users];
        
        // 每次数据请求回来的时候，在block回调里面进行判断，如果不是最后一次请求，就不执行下面的代码。
        if (self.params != params) return;
        
        // 刷新右边的表格
        [self.userTableview reloadData];
        
        // 让底部控件结束刷新
        [self checkFooterState];
        
        ZYLog(@"%@",responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        
        // 只在最后一次请求失败的时候提醒用户，不会发生视觉错误干扰
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        // 让底部控件结束刷新
        [self.userTableview.mj_footer endRefreshing];
    }];
}



/**
 * 时刻监测footer的状态
 */
- (void)checkFooterState
{
    ZYRecommandCategory *rc = ZYRecommandCategoryType;
    
    // 每次刷新右边数据时, 都控制footer显示或者隐藏
    self.userTableview.mj_footer.hidden = (rc.users.count == 0);
    
    // 让底部控件结束刷新
    if (rc.users.count == rc.total) { // 全部数据已经加载完毕
        [self.userTableview.mj_footer endRefreshingWithNoMoreData];
    } else { // 还没有加载完毕
        [self.userTableview.mj_footer endRefreshing];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableview) {
        return self.categorys.count;
    }
    
    // 监测footer的状态
    [self checkFooterState];

    ZYRecommandCategory* c = self.categorys[self.categoryTableview.indexPathForSelectedRow.row];
    return c.users.count;
}



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
        self.userTableview.mj_footer.hidden = (c.users.count == 0);
        return cell;
        
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//   当我们点击别的类别的时候立即停止刷新之前的类别数据
    // 结束刷新
    [self.userTableview.mj_header endRefreshing];
    [self.userTableview.mj_footer endRefreshing];

    ZYRecommandCategory* c = self.categorys[indexPath.row];
    NSLog(@"clicled%ld",indexPath.row);
    
    if (c.users.count)
    {
//        如果曾经有数据，直接刷新数据
        [self.userTableview reloadData];
    }
    else
    {
//        如果没有数据 先刷新表格，再下拉加载数据
        [self.userTableview reloadData];
        [self.userTableview.mj_header beginRefreshing];
    }
}

#pragma mark - 控制器的销毁。
//一旦控制器被销毁了，就阻止该控制器内部的一切操作
- (void)dealloc
{
    // 停止所有操作，还有一种做法就是拿到我们的网络请求的返回对象task，我们对task就行销毁操作也能达到同样的效果。
    [self.manager.operationQueue cancelAllOperations];
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
