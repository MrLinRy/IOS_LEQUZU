//
//  scrollView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "scrollView.h"
#import "SizeHeader.h"

@interface scrollView ()
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIView *titleView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UIButton *Btn;


@end

@implementation scrollView

#pragma mark -- imageView
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView =[[UIImageView alloc]initWithImage:self.image];
        [_imageView setFrame:CGRectMake((CGRectGetWidth(self.frame)-self.image.size.width)/2, CGRectGetHeight(self.frame)-self.image.size.height-LRYScreenpH(110), self.image.size.width, self.image.size.height)];
        [self addSubview:_imageView];
    }
    return _imageView;
}

#pragma mark -- titleView

-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+LRYScreenpH(20), self.frame.size.width, self.frame.size.height-CGRectGetMaxY(self.imageView.frame)-LRYScreenpH(20))];
        [_titleView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_titleView];
    }
    return _titleView;
}

#pragma mark -- titleLabel
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, LRYScreenpH(10), self.frame.size.width, LRYScreenpH(24))];
        [_titleLabel setText:self.title];
        [_titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:LRYCOLOR(0x787878)];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [self.titleView addSubview:_titleLabel];
    }
    return _titleLabel;
}

#pragma mark -- priceLabel

-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+LRYScreenpH(26), self.frame.size.width, LRYScreenpH(23))];
        [_priceLabel setText:self.price];
        [_priceLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
        [_priceLabel setTextAlignment:NSTextAlignmentCenter];
        [_priceLabel setTextColor:LRYCOLOR(0x000000)];
        [_priceLabel setBackgroundColor:[UIColor clearColor]];
        [self.titleView addSubview:_priceLabel];
    }
    return _priceLabel;
}

#pragma mark -- btn
-(UIButton *)Btn{
    if (!_Btn) {
        _Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_Btn setFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height )];
        [_Btn setBackgroundColor:[UIColor clearColor]];
        [_Btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_Btn];
    }
    return _Btn;
}


#pragma mark -- init

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:LRYCOLOR(0xF4F4F4)];
        [self.layer setMasksToBounds:YES];
        [self.layer setBorderWidth:0.5f];
        [self.layer setCornerRadius:10.0f];
        [self.layer setBorderColor:LRYCOLOR(0xD7D7D7).CGColor];
        
        
        
        
    }
    return self;
}

//刷新UI
-(void)setNeedsLayout{
    [self imageView];
    [self titleView];
    [self titleLabel];
    [self priceLabel];
    [self Btn];
}

-(void)BtnClick:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(ClickBtn:titleStr:)]){
        [_delegate ClickBtn:sender titleStr:self.title];
    }
}

@end
