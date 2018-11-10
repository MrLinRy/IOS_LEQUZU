//
//  ThirdLoginView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/10/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "ThirdLoginView.h"
#import "SizeHeader.h"

#define LEFT LRYScreenpW(75)
#define WECHATTAG 1003
#define QQTAG 1004

@interface ThirdLoginView()
@property (nonatomic,strong)UILabel *thirdTitle;
@property (nonatomic,strong)UIButton *QQBtn;
@property (nonatomic,strong)UIButton *WeChatBtn;
@end


@implementation ThirdLoginView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self thirdTitle];
        [self QQBtn];
        [self WeChatBtn];
        
    }
    return self;
}
-(UILabel *)thirdTitle{
    if (!_thirdTitle) {
        _thirdTitle =[self createLabel:CGRectMake(0, 0, CGRectGetWidth(self.frame), LRYScreenpH(32)) title:@"其他方式登录" fontSize:17 textColor:LRYCOLOR(0x787878)];
        [_thirdTitle setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_thirdTitle];

    }
    return _thirdTitle;
}

-(UIButton *)QQBtn{
    if (!_QQBtn) {
        _QQBtn =[self createBtn:CGRectMake(LRYScreenpW(220)-LEFT, CGRectGetMaxY(self.thirdTitle.frame)+LRYScreenpH(40), LRYScreenpW(90), LRYScreenpH(90)) title:nil backColor:nil iconImage:nil backgroundImage:nil tag:QQTAG fontSize:0 textColor:nil withShowlayer:YES Radius:LRYScreenpW(45) shadowWidth:2.0 BorderColor:LRYCOLOR(0xFCC093)];
    
//渲染前景图片颜色
        UIImage *img = [UIImage imageNamed:@"QQ"];
        [_QQBtn.imageView setTintColor:LRYCOLOR(0xFCC093)];
        [_QQBtn setImage:[img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        
        [_QQBtn addTarget:self action:@selector(qqBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_QQBtn];

    }
    return _QQBtn;
}

-(UIButton *)WeChatBtn{
    if (!_WeChatBtn) {
        _WeChatBtn =[self createBtn:CGRectMake(CGRectGetMaxX(self.QQBtn.frame)+LRYScreenpW(125), CGRectGetMaxY(self.thirdTitle.frame)+LRYScreenpH(40), LRYScreenpW(90), LRYScreenpH(90)) title:nil backColor:nil iconImage:nil backgroundImage:nil tag:WECHATTAG fontSize:0 textColor:nil withShowlayer:YES Radius:LRYScreenpW(45) shadowWidth:0 BorderColor:LRYCOLOR(0xFCC093)];
//        对图片进行渲染
        UIImage *img = [UIImage imageNamed:@"WeChat"];
        //设置渲染颜色
        [_WeChatBtn.imageView setTintColor:LRYCOLOR(0xFCC093)];
        //设置渲染状态
        [_WeChatBtn setImage: [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [_WeChatBtn setImage:[img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
        
        
        [_WeChatBtn addTarget:self action:@selector(wechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_WeChatBtn];
    }
    return _WeChatBtn;
}
-(void)qqBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(QQBtnClick)]) {
        [_delegate QQBtnClick];
    }
}
-(void)wechatBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(WeChatBtnClick)]) {
        [_delegate WeChatBtnClick];
    }
}



@end
