//
//  SecondViewController.m
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondViewCell.h"

@implementation SecondViewController

@synthesize cellList;

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self getData];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置headerView的尺寸大小
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 100);
    //该方法也可以设置itemSize
    layout.itemSize =CGSizeMake(110, 150);
    
    //2.初始化collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [self.collectionView registerClass:[SecondViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
//    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    [self.view addSubview: self.collectionView];
    //4.设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 实现传值协议方法
- (void)passValues:(NSDictionary *)values {
    self.strId = [values objectForKey:@"ID"];
    self.strName = [values objectForKey:@"NAME"];
    self.strQty = [values objectForKey:@"QTY"];
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cellList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *sModelId = [NSString stringWithFormat:@"%@",[[self.cellList objectAtIndex:indexPath.row] objectForKey:@"ID"]];
    NSString *sModelName = [NSString stringWithFormat:@"%@",[[self.cellList objectAtIndex:indexPath.row] objectForKey:@"NAME"]];
    NSString *sModelImgUrl = [NSString stringWithFormat:@"http://192.168.19.123:8181/paper/client/paperimage/getPaperImageByPidAndMaxSort.action?pid=%@", sModelId];
    SecondViewCell *cell = (SecondViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.modelId = sModelId;
    cell.modelName.text = sModelName;
    cell.modelImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:sModelImgUrl]]];
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 130);
}

//footer的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//header的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
//    headerView.backgroundColor =[UIColor grayColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
//    label.text = @"这是collectionView的头部";
//    label.font = [UIFont systemFontOfSize:20];
//    [headerView addSubview:label];
//    return headerView;
//}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewCell *cell = (SecondViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *msg = cell.modelName.text;
    NSLog(@"%@",msg);
}

#pragma mark 获取服务器数据
- (void) getData {
    // 1.
    NSURL * url=[NSURL URLWithString:@"http://192.168.19.123:8181/paper/client/papermodel/getPageByPid.action"];
    // 2.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // ? POST
    [request setHTTPMethod:@"POST"];
    // ? 数据体
    NSString *params = [[NSString alloc] initWithFormat:@"pid=%@&rownum=%@&pagesize=%@", self.strId, @"0" ,@"5"];
    // 将字符串转换成数据
    NSData *postData = [params dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    [request setHTTPBody:postData];
    // 超时
    [request setTimeoutInterval:10.0];
    
    // 3. 发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            NSLog([@"%@", [NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            NSArray *aJson = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
            cellList = aJson;
//                    for(NSDictionary *item in aJson) {
//                        NSLog(@"Id: %@", [item objectForKey:@"ID"]);
//                        NSLog(@"Name: %@", [item objectForKey:@"NAME"]);
//                        NSLog(@"Qty: %@", [item objectForKey:@"NAV_NAME"]);
//                    }
            [self.collectionView reloadData];
        }

    }];
}
@end
