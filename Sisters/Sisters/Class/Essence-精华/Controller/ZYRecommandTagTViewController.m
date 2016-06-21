//
//  ZYRecommandTagTViewController.m
//  Sisters
//
//  Created by ZhouYong on 16/6/18.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYRecommandTagTViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "ZYRecommendTagModel.h"
#import "ZYRecommendTagCell.h"


@interface ZYRecommandTagTViewController ()


/**存放数据的数组**/
@property(nonatomic, strong)NSMutableArray* dataArray;


@end

@implementation ZYRecommandTagTViewController


- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    }return _dataArray;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = ZYGlobalColor
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.tableView registerNib:[UINib nibWithNibName:@"ZYRecommendTagCell" bundle:nil] forCellReuseIdentifier:@"tagCell"];

    
    self.navigationItem.title = @"推荐标签";
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
//   创建一个字典传入参数进行网络数据请求
    NSMutableDictionary*  parameter= [[NSMutableDictionary alloc] initWithCapacity:0];
    parameter[@"a"] = @"tag_recommend";
    parameter[@"action"] = @"sub";
    parameter[@"c"] = @"topic";
    
    
    //    下面要开始进行网络数据请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        如果数据请求成功就会进来
        ZYLog(@"%@",responseObject);
        [SVProgressHUD dismiss];  //如果数据请求成功，就消失圈圈
        self.dataArray = [ZYRecommendTagModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tagCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


//Override to support conditional eniting of the table view s

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
