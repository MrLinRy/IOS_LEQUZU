//
//  LoginBtnView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/10/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "LoginBtnView.h"
#import "SizeHeader.h"

#define LOGINTAG 1001
#define FORGETAG 1002

@interface LoginBtnView()
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *forgetBtn;
@property (nonatomic,strong) UIButton *signBtn;


@end


@implementation LoginBtnView
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self loginBtn];
        [self forgetBtn];
        [self signBtn];
        
    }
    return self;
}





-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [self createBtn:CGRectMake(0, 0, CGRectGetWidth(self.frame), LRYScreenpH(88)) title:@"登录" backColor:LRYCOLOR(0xF19149) iconImage:nil backgroundImage:nil tag:LOGINTAG fontSize:17 textColor:LRYCOLOR(0xFFFFFF) withShowlayer:YES Radius:22 shadowWidth:1 BorderColor:[UIColor whiteColor]];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginBtn];

    }
    return _loginBtn;
}

-(UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn =[self createBtn:CGRectMake(0, CGRectGetMaxY(self.loginBtn.frame)+LRYScreenpH(32), LRYScreenpW(134), LRYScreenpH(27)) title:@"忘记密码?" backColor:nil iconImage:nil backgroundImage:nil tag:FORGETAG fontSize:14 textColor:LRYCOLOR(0x787878) withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
        [_forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_forgetBtn];
    }
    return _forgetBtn;
}

-(UIButton *)signBtn{
    if (!_signBtn) {
        _signBtn =[self createBtn:CGRectMake(CGRectGetWidth(self.frame)-LRYScreenpW(117), CGRectGetMaxY(self.loginBtn.frame)+LRYScreenpH(32), LRYScreenpW(117), LRYScreenpH(27)) title:@"快速注册" backColor:nil iconImage:nil backgroundImage:nil tag:FORGETAG fontSize:14 textColor:LRYCOLOR(0x787878) withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
        [_signBtn addTarget:self action:@selector(signBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_signBtn];
    }
    return _signBtn;
}

-(void)loginBtnClick{
    if (_delegate&&[_delegate respondsToSelector:@selector(LoginBtnClick)]) {
        [_delegate LoginBtnClick];
    }
}

-(void)forgetBtnClick{
    
    if (_delegate && [_delegate respondsToSelector:@selector(ForgetBtnClick)]) {
        [_delegate ForgetBtnClick];
    }
}

-(void)signBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(SignBtnClick)]) {
        [_delegate SignBtnClick];
    }
}
@end
