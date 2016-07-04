//
//  ZYTopicTableVC.m
//  Sisters
//
//  Created by ZhouYong on 16/6/22.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYTopicTableVC.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "ZYWordModel.h"
#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import "ZYWordCell.h"

static NSString*  ZYWordCellIdentifier = @"topicCell";


@interface ZYTopicTableVC ()

@property (nonatomic, strong)NSMutableArray* wordArray;

/**加载下一页关键参数**/
@property(nonatomic, strong)NSString* maxtime;

/**当前显示的页码数**/
@property(nonatomic, assign)NSInteger page;

/**网络请求参数**/
@property(nonatomic, strong)NSMutableDictionary* para;

@end



@implementation ZYTopicTableVC

- (NSMutableArray *)wordArray{
    if (_wordArray == nil) {
        _wordArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _wordArray;
}

- (NSMutableDictionary *)para{
    if (_para == nil) {
        _para = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    return _para;
}



- (void)viewDidLoad {

    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYWordCell class]) bundle:nil] forCellReuseIdentifier:ZYWordCellIdentifier];


    //
    [self setUpRefresh];

    //    加载新的数据
    [self loadNewTopics];
}


- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    //    一进来就刷新数据
    [self.tableView.mj_header beginRefreshing];

    self.tableView.mj_header.automaticallyChangeAlpha = YES;

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];

    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}

//    下拉加载新的数据
- (void)loadNewTopics
{
    //    进入下拉的时候结束上拉，防止两个动作同时被用户请求
    [self.tableView.mj_footer  endRefreshing];
    //    para
    NSMutableDictionary* paras = [NSMutableDictionary dictionary];
    paras[@"a"] = @"list";
    paras[@"c"] = @"data";
    paras[@"type"] = @(self.type);
    self.para = paras;


    //    AFHttp
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:paras progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.para != paras) return ;

        self.maxtime = responseObject[@"info"][@"maxtime"];

        //        取出话题模型
        self.wordArray = [ZYWordModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];

        //        刷新tableview
        [self.tableView reloadData];
        //        tableView刷新之后停止刷新
        [self.tableView.mj_header endRefreshing];
        self.page = 0; //由于下拉刷新的时候每次要拿到最新的数据，所以每次加载第一页的新数据，将page置为0

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYLog(@"%@",error.userInfo);
        //        数据请求失败之后也要停止刷新
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"数据加载失败，请检查网络设置"];
    }];



}


//    下拉加载更多的数据
- (void)loadMoreTopics
{
    //    进行下拉的时候结束上拉，防止两个请求同时被用户申请
    [self.tableView.mj_header endRefreshing];
    self.page++;  //每次进来的时候页码数自增，加载下一页数据
    //    para
    NSMutableDictionary* paras = [NSMutableDictionary dictionary];
    paras[@"a"] = @"newlist";
    paras[@"c"] = @"data";
    paras[@"type"] = @(self.type);
    paras[@"maxtime"] = self.maxtime;
    paras[@"page"] = @(self.page);
    self.para = paras;

    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:paras progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.para != paras) return ;

        ZYLog(@"%@",responseObject)
        self.maxtime = responseObject[@"info"][@"maxtime"];

        //        取出话题模型
        NSArray* newArray = [ZYWordModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //        将刷新得到的数据也保存到当前的数据源数组中, 注意是将数组newArray中的内容添加进去，不是将数组newArray添加进去
        [self.wordArray addObjectsFromArray:newArray];
        ZYLog(@"%ld",self.wordArray.count)

        //        刷新tableview
        [self.tableView reloadData];
        //        tableView刷新之后停止刷新
        [self.tableView.mj_footer endRefreshing];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZYLog(@"%@",error.userInfo);
        //        数据请求失败之后也要停止刷新
        self.page--; //如果网络因素导致当前页面数据刷新失败，page也会增加，下次就会直接忽略当前没有加载完的页面数据,所以自减保证下次能刷新本次失败的页面数据
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"数据加载失败，请检查网络设置"];
        //
        [SVProgressHUD showImage:[UIImage imageNamed:@"泪奔.png"] status:@"亲，网络不给力哦😢"];
    }];

}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wordArray.count;

}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ZYWordCell* cell = [tableView dequeueReusableCellWithIdentifier:ZYWordCellIdentifier];
    cell.wordModel = self.wordArray[indexPath.row];


    return cell;
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
