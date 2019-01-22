//
//  HomeController.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import "HomeController.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "AllAroundPullView.h"

@interface HomeController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UIActivityIndicatorView * activityView;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 1; i<11; i++) {
        NSString * urlStr = [NSString stringWithFormat:@"%@%d",HOMEPATH,i];
        [self GetUrlMessageFromUrlString:urlStr];
    }

    [self initView];
}

- (void)initView
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellWithReuseIdentifier:@"HomeCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    // self.collectionView.bounces = YES;
    
    // 左拉刷新
    AllAroundPullView * leftPullView = [[AllAroundPullView alloc] initWithScrollView:self.collectionView position:AllAroundPullViewPositionLeft action:^(AllAroundPullView *view){
         NSLog(@"--");
        self.activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(-120, -50, 100, 100)];
        [self.activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        self.activityView.hidesWhenStopped = YES;
        [self.activityView startAnimating];
        [self.view addSubview:self.activityView];
        [view performSelector:@selector(finishedLoading) withObject:nil afterDelay:1.0f];
    }];
    [self.collectionView addSubview:leftPullView];
    
}



- (void)GetUrlMessageFromUrlString:(NSString *)urlString
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
        
        NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        HomeModel * model = [HomeModel homeModelWithDict:JSON[@"hpEntity"]];
        [self.dataSource addObject:model];
        // 刷新
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
     NSLog(@"%zd",indexPath.row);
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-49-64);
}

@end
