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


@interface ZYRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>

/**左边的类别节目数组**/
@property(nonatomic, strong)NSArray* categorys;
/**左边的类别类别**/
@property (weak, nonatomic) IBOutlet UITableView *categoryTableview;

@end

@implementation ZYRecommendViewController

static NSString* const ZYCategoryID = @"recommandcell";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//     注册
    ZYRecommandCategoryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ZYCategoryID];
//    模型传值
    cell.category = self.categorys[indexPath.row];
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZYLog(@"zhouyong%lu",(unsigned long)self.categorys.count);
    return self.categorys.count;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.categoryTableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZYRecommandCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZYCategoryID];
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = ZYGlobalColor
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
        self.categorys = [ZYRecommandCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
//        self.categorys = responseObject[@"list"];
        
         /* // 这样为什么不行?
        NSArray* array = [responseObject valueForKey:@"list"];
        NSLog(@"array count is %lu/n%@",(unsigned long)array.count,array);
        */
        
        
        
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
