//
//  BHControl.h
//  BHControl
//
//  Created by miss on 15/9/11.
//  Copyright (c) 2015年 mac book. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 快速创建常用控件
@interface BHControl : NSObject

+(UIView *)createViewWithFrame:(CGRect)frame color:(UIColor*)color;

+(UILabel *)createLabelWithFrame:(CGRect)frame font:(float)font text:(NSString *)text;

+(UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName bgImageName:(NSString*)bgImageName target:(id)target method:(SEL)select;

+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName;

+(UITextField *)createTextFieldFrame:(CGRect)frame placeholder:(NSString*)placeholder bgImageName:(NSString *)imageName leftView:(UIView *)leftView rightView:(UIView *)rightView isPassWord:(BOOL)isPassWord;

@end
