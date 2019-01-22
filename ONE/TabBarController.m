//
//  TabBarController.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//

#import "TabBarController.h"

#import "HomeController.h"
#import "ReadController.h"
#import "ThingController.h"
#import "PersonController.h"
#import "QuestionController.h"



@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
}

// 设置所有的子控制器
- (void)setUpAllChildViewController
{
    
    HomeController * home = [[HomeController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"homeSelected"] title:@"首页"];
    
    ReadController * read = [[ReadController alloc] init];
    [self setUpOneChildViewController:read image:[UIImage imageNamed:@"reading"] selectedImage:[UIImage imageNamed:@"readingSelected"] title:@"文章"];
    
    QuestionController * question = [[QuestionController alloc] init];
    [self setUpOneChildViewController:question image:[UIImage imageNamed:@"question"] selectedImage:[UIImage imageNamed:@"questionSelected"] title:@"问题"];
    
    ThingController * thing = [[ThingController alloc] init];
    [self setUpOneChildViewController:thing image:[UIImage imageNamed:@"thing"] selectedImage:[UIImage imageNamed:@"thingSelected"] title:@"东西"];
    
    PersonController * person = [[PersonController alloc] init];
    [self setUpOneChildViewController:person image:[UIImage imageNamed:@"person"] selectedImage:[UIImage imageNamed:@"personSelected"] title:@"个人"];
}

// 设置一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)ChildView image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    ChildView.tabBarItem.title = title;
    ChildView.tabBarItem.image = image;
    ChildView.tabBarItem.selectedImage = selectedImage;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ChildView];
    [self addChildViewController:nav];
}




@end
