//
//  ViewController.m
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize navRowList;

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self getData];
    //标题
    self.title = @"首页";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setExtraCellLineHidden:self.tableView];
    //初始化并显示进度圈
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getData) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 去除多余分割线
-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.navRowList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RootViewCell *cell = [RootViewCell cellWithTableView:tableView];
    [cell setWithId:[NSString stringWithFormat:@"%@",[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"ID"]]
            andName:[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"NAME"]
             andQty:[NSString stringWithFormat:@"%@",[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"QTY"]]
     ];
    return cell;
}

#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - 选中跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //传值-委托方式
    self.secondViewController = [[SecondViewController alloc]init];
    self.passValueDelegate = self.secondViewController; //设置代理
    NSDictionary *values = [NSDictionary dictionaryWithObjectsAndKeys:
                           [NSString stringWithFormat:@"%@",[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"ID"]] , @"ID",
                           [[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"NAME"], @"NAME",
                           [NSString stringWithFormat:@"%@",[[self.navRowList objectAtIndex:indexPath.row] objectForKey:@"QTY"]], @"QTY", nil];
    [self.passValueDelegate passValues:values];
    //跳转
    [self.navigationController pushViewController:self.secondViewController animated:YES];
}

- (void) getData {
    NSString *sUrl = @"http://192.168.19.123:8181/paper/client/nav/getNavDataJson.action";
    sUrl=[sUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url=[NSURL URLWithString:sUrl];
    
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:0 timeoutInterval:15.0f];
    
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"%@",connectionError.localizedDescription);
        } else {
            NSArray *aJson = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
            navRowList = aJson;
            //            for(NSDictionary *item in aJson) {
            //                NSLog(@"Id: %@", [item objectForKey:@"ID"]);
            //                NSLog(@"Name: %@", [item objectForKey:@"NAME"]);
            //                NSLog(@"Qty: %@", [item objectForKey:@"QTY"]);
            //            }
            [self.tableView reloadData];
        }
        [self.refreshControl endRefreshing];
    }];
}

@end
