//
//  HeadView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "HeadView.h"
#import "MainController.h"
#import "SizeHeader.h"

#define LEFTSZIE LRYScreenpW(32)



@interface HeadView ()<MainControllerDelegate>
@property (nonatomic,strong) UIImageView *imageOne;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *moreBtn;

@end


@implementation HeadView



#pragma mark -- init

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        [self imageOne];
        [self titleLabel];
        [self moreBtn];
        
        
        
        
    }
    return self;
}


-(UIImageView *)imageOne{
    if (!_imageOne) {
        _imageOne =[[UIImageView alloc]initWithFrame:CGRectMake(LEFTSZIE, 0, LRYScreenpW(6), LRYScreenpH(30))];
        [_imageOne setImage:[UIImage imageNamed:@"icon_stage"]];
        [self addSubview:_imageOne];
    }
    return _imageOne;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageOne.frame)+LRYScreenpW(15), CGRectGetMinY(self.imageOne.frame)-LRYScreenpH(2), LRYScreenpW(215), LRYScreenpH(33))];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setTextColor:LRYCOLOR(0x000000)];
        [_titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreBtn setTag:1000];
        [_moreBtn setFrame:CGRectMake(ScreenWidth-LRYScreenpW(109), LRYScreenpH(2), LRYScreenpW(77), LRYScreenpH(25))];
        [_moreBtn setBackgroundColor:[UIColor whiteColor]];
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:LRYCOLOR(0x787878) forState:UIControlStateNormal];
        [_moreBtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)]];
        [_moreBtn setImage:[UIImage imageNamed:@"icon_arrow"] forState:UIControlStateNormal];
        //设置文字在左，图片在右
        _moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_moreBtn.titleLabel.frame.origin.x+20), 0, 0);
        
        _moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, (_moreBtn.frame.size.width - _moreBtn.imageView.frame.origin.x - _moreBtn.imageView.frame.size.width), 0, -(_moreBtn.frame.size.width - _moreBtn.imageView.frame.origin.x - _moreBtn.imageView.frame.size.width));
    
        [_moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_moreBtn];
    }
    return _moreBtn;
}

-(void)SetHeadTitle:(NSString *)titleStr{
    [self.titleLabel setText:titleStr];
}

-(void)moreClick:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(MoreClick:Title:)]) {
        [_delegate MoreClick:sender Title:self.titleLabel.text];
    }
}

@end
