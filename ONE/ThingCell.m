//
//  ThingCell.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import "ThingCell.h"
#import "ThingModel.h"
#import "UIImageView+WebCache.h"

@interface ThingCell ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *descImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation ThingCell

-(void)setModel:(ThingModel *)model
{
    _model = model;
    
    self.dateLabel.text = model.strTm;
    [self.descImageView sd_setImageWithURL:[NSURL URLWithString:model.strBu]];
    self.nameLabel.text = model.strTt;
    self.descLabel.text = model.strTc;
}
@end
