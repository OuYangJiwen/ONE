//
//  ThingController.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//




#import "ThingController.h"
#import "ThingCell.h"
#import "ThingModel.h"

@interface ThingController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation ThingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 1; i < 10; i++) {
        NSString *urlStr = [NSString stringWithFormat:@"%@%d",THINGPATH,i];
        [self GetUrlMessageFromUrlString:urlStr];
    }
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ThingCell" bundle:nil] forCellWithReuseIdentifier:@"ThingCell"];
    self.collectionView.delegate  = self;
    self.collectionView.dataSource = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThingCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThingCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-64-49);
}

- (void)GetUrlMessageFromUrlString:(NSString *)urlString
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        ThingModel * model = [ThingModel thingModelWithDict:JSON[@"entTg"]];
        [self.dataSource addObject:model];
        // 刷新
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
@end
