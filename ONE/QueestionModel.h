//
//  QueestionModel.h
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface QueestionModel : NSObject

@property(nonatomic,copy)NSDictionary * entQNCmt;
@property(nonatomic,copy)NSString * strLastUpdateDate;
@property(nonatomic,copy)NSString * strDayDiffer;
@property(nonatomic,copy)NSString * sWebLk;
@property(nonatomic,copy)NSString * strPraiseNumber;
@property(nonatomic,copy)NSString * strQuestionId;
@property(nonatomic,copy)NSString * strQuestionTitle;
@property(nonatomic,copy)NSString * strQuestionContent;
@property(nonatomic,copy)NSString * strAnswerTitle;
@property(nonatomic,copy)NSString * strAnswerContent;
@property(nonatomic,copy)NSString * strQuestionMarketTime;
@property(nonatomic,copy)NSString * sEditor;

+ (id)questionModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end
