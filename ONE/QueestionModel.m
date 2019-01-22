//
//  QueestionModel.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//

#import "QueestionModel.h"

@implementation QueestionModel

+ (id)questionModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end




