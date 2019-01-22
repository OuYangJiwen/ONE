//
//  QuestionCell.m
//  ONE
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 OuYang. All rights reserved.
//


#import "QuestionCell.h"
#import "QueestionModel.h"
#import "UIImageView+WebCache.h"

@interface QuestionCell ()

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UIImageView *questionImageView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *answerImageView;
@property (weak, nonatomic) IBOutlet UILabel *answerName;
@property (weak, nonatomic) IBOutlet UILabel *answerContentLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeNumberBtn;
@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation QuestionCell

-(void)setModel:(QueestionModel *)model
{
    
    _model = model;
    
    self.dataLabel.text = model.strQuestionMarketTime;
    self.questionImageView.image = [UIImage imageNamed:@"que_img"];
    self.questionLabel.text = model.strQuestionTitle;
    
    self.contentLabel.text = model.strQuestionContent;
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.numberOfLines = 0;
    
    // 设置label的frame
    CGFloat labelX = 15;
    CGFloat labelY = 80;
    CGFloat labelW = 345;
    
    // 根据固定的宽度,以及文字内容 来动态计算出控件的高度
    CGSize size = CGSizeMake(labelW, CGFLOAT_MAX);
    // 设置行间距
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:self.contentLabel.text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:3];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.contentLabel.text.length)];
    self.contentLabel.attributedText = attributedString;
    CGSize labelSize = [self.contentLabel sizeThatFits:size];
    // 得到label的高度
    CGFloat labelH = labelSize.height ;
    // 得到label的frame
    self.contentLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    self.lineImageView.image = [UIImage imageNamed:@"colLine"];
    
    CGFloat lineY = CGRectGetMaxY(self.contentLabel.frame)+15;
    CGFloat lineH = 0.5;
    self.lineImageView.frame = CGRectMake(labelX, lineY, labelW, lineH);
    
    self.answerImageView.image = [UIImage imageNamed:@"ans_img"];
    self.answerImageView.frame = CGRectMake(labelX, lineY + 10, 36, 36);
    
    self.answerName.text = model.strAnswerTitle;
    self.answerName.frame = CGRectMake(self.questionLabel.frame.origin.x,  lineY + 3, self.questionLabel.frame.size.width, self.questionLabel.frame.size.height);

    self.answerContentLabel.text = model.strAnswerContent;
    self.answerContentLabel.font = [UIFont systemFontOfSize:14];
    self.answerContentLabel.numberOfLines = 0;
    
    // 设置label的frame
    CGFloat answerX = 15;
    CGFloat answerY = CGRectGetMaxY(self.answerImageView.frame)+ 10;
    CGFloat answerW = 345;
    
    // 根据固定的宽度,以及文字内容 来动态计算出控件的高度
    CGSize sizeA = CGSizeMake(answerW, CGFLOAT_MAX);
    // 设置行间距
    NSMutableAttributedString * attributedString2 = [[NSMutableAttributedString alloc]initWithString:self.answerContentLabel.text];
    NSMutableParagraphStyle * paragraphStyle2 = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle2 setLineSpacing:3];
    [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.answerContentLabel.text.length)];
    self.answerContentLabel.attributedText = attributedString2;
    CGSize labelSize2 = [self.answerContentLabel sizeThatFits:sizeA];
    // 得到label的高度
    CGFloat answerH = labelSize2.height ;
    // 得到label的frame
    self.answerContentLabel.frame = CGRectMake(answerX, answerY, labelW, answerH);
    
    // 点赞
    [self.likeNumberBtn setTitle:model.strPraiseNumber forState:UIControlStateNormal];
    [self.likeNumberBtn setImage:[UIImage imageNamed:@"home_like"] forState:UIControlStateNormal];
    self.likeNumberBtn.frame = CGRectMake(302, CGRectGetMaxY(self.answerContentLabel.frame)+15, 73, 28);
    // 拉伸图片(width表示水平方向从哪拉， height表示垂直方向从哪拉)
    UIImage * bgImage = [UIImage imageNamed:@"home_likeBg"];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:31 topCapHeight:28];
    [self.likeNumberBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
    // 移动文字的位置
    self.likeNumberBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    // 响应事件
    [self.likeNumberBtn addTarget:self action:@selector(likeNumberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGFloat maxY = CGRectGetMaxY(self.likeNumberBtn.frame) +20;
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width, maxY);
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
