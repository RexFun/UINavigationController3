//
//  SecondViewController.h
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"

//不用继承UICollectionViewController，否则报错：‘UICollectionView must be initialized with a non-nil layout parameter’
@interface SecondViewController : UIViewController<PassValueDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) NSString *strId;
@property(nonatomic,strong) NSString *strName;
@property(nonatomic,strong) NSString *strQty;
@property(nonatomic,strong) NSArray *cellList;
@property(nonatomic,strong) UICollectionView *collectionView;

@end
