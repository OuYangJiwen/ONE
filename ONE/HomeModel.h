//
//  HomeModel.h
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic, copy) NSString *strContent; // 内容
@property (nonatomic, copy) NSString *strThumbnailUrl; // 图片
@property (nonatomic, copy) NSString *strLastUpdateDate; // 最后更新
@property (nonatomic, copy) NSString *strAuthor; // 作者
@property (nonatomic, copy) NSString *strHpId;
@property (nonatomic, copy) NSString *sWebLk; // 超大图片
@property (nonatomic, copy) NSString *strDayDiffer;
@property (nonatomic, copy) NSString *strHpTitle; // 标题
@property (nonatomic, copy) NSString *strOriginalImgUrl; // 保留原色图片
@property (nonatomic, copy) NSString *strPn; // 点赞
@property (nonatomic, copy) NSString *wImgUrl; // 全局网图
@property (nonatomic, copy) NSString *strMarketTime; // 发布时间

+ (id)homeModelWithDict:(NSDictionary *)dict;

- (id)initWithDict:(NSDictionary *)dict;

@end

