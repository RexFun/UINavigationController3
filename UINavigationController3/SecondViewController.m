//
//  SecondViewController.m
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //白色背景
    self.view.backgroundColor = [UIColor whiteColor];
    //获取导航栏高度
    CGFloat navBarHeight = self.navigationController.navigationBar.frame.size.height;
    //显示来自RootViewController的传值
    UILabel *labelId = [[UILabel alloc] init];
    labelId.frame = CGRectMake(0, navBarHeight, 50, 50);
    labelId.backgroundColor = [UIColor redColor];
    labelId.text = self.strId;
    
    UILabel *labelName = [[UILabel alloc] init];
    labelName.frame = CGRectMake(0, navBarHeight+60, 50, 50);
    labelName.backgroundColor = [UIColor yellowColor];
    labelName.text = self.strName;
    
    UILabel *labelQty = [[UILabel alloc] init];
    labelQty.frame = CGRectMake(0, navBarHeight+120, 50, 50);
    labelQty.backgroundColor = [UIColor greenColor];
    labelQty.text = self.strQty;
    
    [self.view addSubview:labelId];
    [self.view addSubview:labelName];
    [self.view addSubview:labelQty];
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

@end
