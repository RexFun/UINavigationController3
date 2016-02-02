//
//  RootViewCell.h
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *sectionId;
@property (nonatomic, strong) UILabel *sectionName;
@property (nonatomic, strong) UILabel *sectionQty;

- (void)setWithId:(NSString *)_id andName:(NSString *)_name andQty:(NSString *)_qty;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
