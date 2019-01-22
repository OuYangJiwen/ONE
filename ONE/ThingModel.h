//
//  ThingModel.h
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface ThingModel : NSObject

@property(nonatomic,copy)NSString * strLastUpdateDate;
@property(nonatomic,copy)NSString * strPn;
@property(nonatomic,copy)NSString * strBu;
@property(nonatomic,copy)NSString * strTm;
@property(nonatomic,copy)NSString * strWu;
@property(nonatomic,copy)NSString * strId;
@property(nonatomic,copy)NSString * strTt;
@property(nonatomic,copy)NSString * strTc;


+ (id)thingModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;


@end
