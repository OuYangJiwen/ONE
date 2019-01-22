//
//  QuestionController.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import "QuestionController.h"
#import "QueestionModel.h"
#import "QuestionCell.h"

@interface QuestionController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout>



@end

@implementation QuestionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 1; i < 11; i++) {
        NSString *urlStr = [NSString stringWithFormat:@"%@%d",QUESTIONPATH,i];
        [self questUrlWithUrlString:urlStr];
    }
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"QuestionCell" bundle:nil] forCellWithReuseIdentifier:@"QuestionCell"];
    self.collectionView.delegate  = self;
    self.collectionView.dataSource = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QuestionCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-64-49);
}

- (void)questUrlWithUrlString:(NSString *)urlString
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
   
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        
        NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        QueestionModel * model = [QueestionModel questionModelWithDict:JSON[@"questionAdEntity"]];
        
        model.strAnswerContent =[[JSON[@"questionAdEntity"] objectForKey:@"strAnswerContent"] stringByReplacingOccurrencesOfString:@"<br>" withString:@"\r\n"];

        [self.dataSource addObject:model];

        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
