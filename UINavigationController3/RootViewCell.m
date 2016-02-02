//
//  RootViewCell.m
//  UINavigationController3
//
//  Created by mac373 on 16/1/26.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "RootViewCell.h"

@implementation RootViewCell

@synthesize sectionId;
@synthesize sectionName;
@synthesize sectionQty;

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"Cell";
    // 1.缓存中取
    RootViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[RootViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //id
        self.sectionId = [[UILabel alloc] init];
        [self.contentView addSubview:self.sectionId];
        //name
        self.sectionName = [[UILabel alloc] init];
        [self.contentView addSubview:self.sectionName];
        //qty
        self.sectionQty = [[UILabel alloc] init];
        [self.contentView addSubview:self.sectionQty];
    }
    return self;
}

/**
 设置Cell
 */
- (void)setWithId:(NSString *)_id andName:(NSString *)_name andQty:(NSString *)_qty {
    self.sectionId.frame = CGRectMake(10, 25, 80, 30);
    self.sectionId.text = _id;
    //    [self addSubview:sectionId];
    
    self.sectionName.frame = CGRectMake(80, 25, 200, 30);
    self.sectionName.text = _name;
    //    [self addSubview:sectionName];
    
    self.sectionQty.frame = CGRectMake(280, 25, 30, 30);
    self.sectionQty.text = _qty;
    //    [self addSubview:sectionQty];
}

@end
