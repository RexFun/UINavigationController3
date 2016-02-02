//
//  SecondViewController.h
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"

@interface SecondViewController : UIViewController<PassValueDelegate>

@property(nonatomic,strong) NSString *strId;
@property(nonatomic,strong) NSString *strName;
@property(nonatomic,strong) NSString *strQty;

@end
