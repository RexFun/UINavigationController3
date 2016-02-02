//
//  ViewController.h
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewCell.h"
#import "SecondViewController.h"
#import "PassValueDelegate.h"

@interface RootViewController : UITableViewController

@property (nonatomic, strong) NSArray *navRowList;
@property (nonatomic, strong) SecondViewController *secondViewController;
@property (nonatomic, retain) id <PassValueDelegate> passValueDelegate;//定义向SecondView页面传值的委托变量

@end

