//
//  ReadCell.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import "ReadCell.h"
#import "ReadModel.h"
#import "UIImageView+WebCache.h"

@interface ReadCell ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *autherLabel;
@property (weak, nonatomic) IBOutlet UILabel *articleLabel;
@property (weak, nonatomic) IBOutlet UILabel *editLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeNumberBtn;
@property (weak, nonatomic) IBOutlet UILabel *bigNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end


@implementation ReadCell

-(void)setModel:(ReadModel *)model
{
    _model = model;
    self.dateLabel.text = model.strContMarketTime;
    self.TitleLabel.text = model.strContTitle;
    self.autherLabel.text = model.strContAuthor;
    
    self.articleLabel.text = model.strContent;
    self.articleLabel.font = [UIFont systemFontOfSize:14];
    self.articleLabel.numberOfLines = 0;
    // 设置label的frame
    CGFloat labelX = 15;
    CGFloat labelY = 100;
    CGFloat labelW = 345;
    // 根据固定的宽度,以及文字内容 来动态计算出控件的高度
    CGSize size = CGSizeMake(labelW, CGFLOAT_MAX);
    // 设置行间距
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:self.articleLabel.text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:3];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.articleLabel.text.length)];
    self.articleLabel.attributedText = attributedString;
    CGSize labelSize = [self.articleLabel sizeThatFits:size];
    // 得到label的高度
    CGFloat labelH = labelSize.height ;
    // 得到label的frame
    self.articleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    
    self.editLabel.text = model.strContAuthorIntroduce;
    CGFloat editY = CGRectGetMaxY(self.articleLabel.frame) + 10;
    self.editLabel.frame = CGRectMake(20, editY, 200, 21);
    
    
    CGFloat btnY = CGRectGetMaxY(self.editLabel.frame) + 10;
    CGFloat btnW = 73;
    self.likeNumberBtn.frame = CGRectMake(375-btnW, btnY, btnW, 28);
    [self createLikeNumberBtnWith:model];
    
    
    self.lineImageView.image = [UIImage imageNamed:@"colLine"];
    CGFloat lineY = CGRectGetMaxY(self.likeNumberBtn.frame)+15;
    self.lineImageView.frame = CGRectMake(labelX, lineY, labelW, 0.5);
    
    
    self.bigNameLabel.text = model.strContAuthor;
    CGFloat bigY = CGRectGetMaxY(self.lineImageView.frame)+5;
    CGFloat bigW = 46;
    CGFloat bigH = 27;
    self.bigNameLabel.frame = CGRectMake(labelX, bigY, bigW, bigH);
    
    self.addressLabel.text = model.sWbN;
    CGFloat addX = labelX + bigW;
    self.addressLabel.frame = CGRectMake(addX, bigY + 5, 100, 21);
    
    
    self.descLabel.text = model.sAuth;
    CGFloat descX = labelX;
    CGFloat descY = CGRectGetMaxY(self.addressLabel.frame) + 10;
    CGFloat descW = labelW;
    // 根据固定的宽度,以及文字内容 来动态计算出控件的高度
    CGSize size2 = CGSizeMake(descW, CGFLOAT_MAX);
    // 要与UILabel的xib文件显示的字体号完全一致
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    // 通过内容确定高度
    size2 = [self.descLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    CGFloat descH = size2.height;
    self.descLabel.frame = CGRectMake(descX, descY, descW, descH);
    
    
    CGFloat maxY = CGRectGetMaxY(self.descLabel.frame) + 20;
    self.scrollView.frame = CGRectMake(0, 0, 375, self.frame.size.height);
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width, maxY);
    
    
    
    
    
    
    
}

- (void)createLikeNumberBtnWith:(ReadModel *)model
{
    // 点赞
    [self.likeNumberBtn setTitle:model.strPraiseNumber forState:UIControlStateNormal];
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
