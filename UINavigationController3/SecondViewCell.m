//
//  SecondViewCell.m
//  UINavigationController3
//
//  Created by mac373 on 16/2/2.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "SecondViewCell.h"

@implementation SecondViewCell

@synthesize modelId;
@synthesize modelName;
@synthesize modelImg;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        modelImg  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 70, 70)];
        modelImg.backgroundColor = [UIColor redColor];
        [self addSubview:modelImg];
        
        modelName = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
        modelName.textAlignment = NSTextAlignmentCenter;
        modelName.textColor = [UIColor blueColor];
        modelName.font = [UIFont systemFontOfSize:15];
        modelName.backgroundColor = [UIColor purpleColor];
        [self addSubview:modelName];
    }
    return self;
}

@end
