//
//  ReadController.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//




#import "ReadController.h"

#import "ReadCell.h"
#import "ReadModel.h"


@interface ReadController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation ReadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 1; i <= 10; i++) {
        NSString * urlStr = [NSString stringWithFormat:@"%@%d%@",READPATH,i,@"&strMS=1"];
        
        [self GetUrlMessageFromUrlString:urlStr];
    }
    [self.collectionView registerNib:[UINib nibWithNibName:@"ReadCell" bundle:nil] forCellWithReuseIdentifier:@"ReadCell"];
    self.collectionView.delegate  = self;
    self.collectionView.dataSource = self;
    
}

- (void)GetUrlMessageFromUrlString:(NSString *)urlString
{
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
        
        NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary * dict = JSON[@"contentEntity"];
        
        ReadModel * model = [ReadModel readModelWithDict:dict];
        
        model.strContent =[dict[@"strContent"] stringByReplacingOccurrencesOfString:@"<br>" withString:@"\r\n"];
        
        [self.dataSource addObject:model];
        
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
        NSLog(@"%@",error);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ReadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReadCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-64-49);
}



@end
