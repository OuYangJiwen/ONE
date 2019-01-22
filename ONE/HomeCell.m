//
//  HomeCell.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import "HomeCell.h"
#import "HomeModel.h"
#import "UIImageView+WebCache.h"

@interface HomeCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *YearLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *autherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *descImageView;
@property (weak, nonatomic) IBOutlet UIButton *likeNumberBtn;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation HomeCell

- (void)setModel:(HomeModel *)model
{
    _model = model;
    // 编号
    self.numberLabel.text = model.strHpTitle;
    
    // 配图
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:model.strOriginalImgUrl]];
    
    
    // 作品名称和作者
    NSArray * nameArray = [model.strAuthor componentsSeparatedByString:@"&"];
    self.imageNameLabel.text = nameArray[0];
    self.autherLabel.text = nameArray[1];
    
    // 时间 strMarketTime 2015-09-26
    
    NSArray * dateArray = [model.strMarketTime componentsSeparatedByString:@"-"];
    self.dayLabel.text = dateArray[2];
    self.YearLabel.text = [NSString stringWithFormat:@"%@,%@",dateArray[1],dateArray[0]];
    
    // 简介
    [self createDescriptionWith:model];
    
    // 点赞
    [self createLikeNumberBtnWith:model];
}

- (void)createDescriptionWith:(HomeModel *)model
{
    self.descLabel.text = model.strContent;
    self.descLabel.font = [UIFont systemFontOfSize:13];
    self.descLabel.numberOfLines = 0;
    
    // 设置label的frame
    CGFloat labelX = 10;
    CGFloat labelY = 3;
    CGFloat labelW = self.descImageView.frame.size.width-10;
    
    // 根据固定的宽度,以及文字内容 来动态计算出控件的高度
    CGSize size = CGSizeMake(labelW, CGFLOAT_MAX);
    
    // 要与UILabel的xib文件显示的字体号完全一致
     NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    // 通过内容确定高度
    size = [self.descLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    // 设置行间距
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:self.descLabel.text];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    // 行间距
    [paragraphStyle setLineSpacing:5];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.descLabel.text.length)];
    
    self.descLabel.attributedText = attributedString;
    CGSize labelSize = [self.descLabel sizeThatFits:size];
    
    // 得到label的高度
    CGFloat labelH = labelSize.height ;
    
    // 得到label的frame
    self.descLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    UIImage * image = [UIImage imageNamed:@"contBack"];
    self.descImageView.image = image;
    
    // 得到imageView的frame
    self.descImageView.frame = CGRectMake(self.descImageView.frame.origin.x, self.descImageView.frame.origin.y, self.descImageView.frame.size.width, labelH + labelY);
    
    // 将label添加到imageView上
    [self.descImageView addSubview:self.descLabel];
}

- (void)createLikeNumberBtnWith:(HomeModel *)model
{
    // 点赞
    [self.likeNumberBtn setTitle:model.strPn forState:UIControlStateNormal];
    [self.likeNumberBtn setImage:[UIImage imageNamed:@"home_like"] forState:UIControlStateNormal];
    // 拉伸图片(width表示水平方向从哪拉， height表示垂直方向从哪拉)
    UIImage * bgImage = [UIImage imageNamed:@"home_likeBg"];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:31 topCapHeight:28];
    [self.likeNumberBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
    // 移动文字的位置
    self.likeNumberBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    // 响应事件
    [self.likeNumberBtn addTarget:self action:@selector(likeNumberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)likeNumberBtnAction:(UIButton *)button
{
    static BOOL isLike;
    isLike = !isLike;
    NSString * count = button.currentTitle;
    if (isLike) {
        [button setImage:[UIImage imageNamed:@"home_like_hl"] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%d",[count intValue]+1] forState:UIControlStateNormal];
    }else{
        [button setImage:[UIImage imageNamed:@"home_like"] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%d",[count intValue]-1] forState:UIControlStateNormal];
    }
}




@end
