//
//  RootViewController.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//

#import "RootViewController.h"
#import "BHControl.h"

@interface RootViewController ()

@end

@implementation RootViewController
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self createNavigationBar];
    
    // 搭建基本界面
    [self createUIView];
}

- (void)createNavigationBar
{
    self.view.backgroundColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:0.985 green:0.980 blue:0.995 alpha:0.720]];
    
    // 设置titleView
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 67.5, 17.5)];
    CGPoint center = imageView.center;
    center = self.navigationController.navigationBar.center;
    imageView.center = center;
    imageView.image = [UIImage imageNamed:@"navLogo"];
    self.navigationItem.titleView = imageView;
    
    // 右按钮
    UIButton * rightButton = [BHControl createButtonWithFrame:CGRectMake(0, 0, 20, 6) title:nil imageName:nil bgImageName:@"shareBtn" target:self method:@selector(buttonAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];

}

- (void)createUIView
{
    UICollectionViewFlowLayout * laout = [[UICollectionViewFlowLayout alloc]init];
    laout.scrollDirection = UICollectionViewScrollDirectionHorizontal;// 滑动方向是横向
    laout.minimumInteritemSpacing = 0;// 最小左右间距
    laout.minimumLineSpacing = 0;// 最小上下间距
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-113) collectionViewLayout:laout];
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.pagingEnabled = YES;
    [self.view addSubview:self.collectionView];
}

- (void)buttonAction
{
    
}

@end
