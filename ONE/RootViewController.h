//
//  RootViewController.h
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#define HOMEPATH @"http://bea.wufazhuce.com/OneForWeb/one/getHp_N?strDate=2015-09-27&strRow="

#define READPATH @"http://bea.wufazhuce.com/OneForWeb/one/getC_N?strDate=2015-09-27&strRow="

#define QUESTIONPATH @"http://bea.wufazhuce.com/OneForWeb/one/getQ_N?strDate=2015-09-27&strUi=&strRow="

#define THINGPATH @"http://bea.wufazhuce.com/OneForWeb/one/o_f?strDate=2015-09-27&strRow="

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface RootViewController : UIViewController

@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) NSMutableArray * dataSource;

@end
