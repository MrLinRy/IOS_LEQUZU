//
//  signButtonView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/4.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "signButtonView.h"
#import "SizeHeader.h"

#define LOGINTAG 1001
#define FORGETAG 1002

@interface signButtonView()
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *signBtn;
@property (nonatomic,strong) UILabel *agreeTable;
@property (nonatomic,strong) UIButton *protocolBtn;


@end


@implementation signButtonView
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self loginBtn];
        [self agreeTable];
        [self protocolBtn];
        [self signBtn];
        
    }
    return self;
}





-(UIButton *)signBtn{
    if (!_signBtn) {
        _signBtn = [self createBtn:CGRectMake(0, 0, CGRectGetWidth(self.frame), LRYScreenpH(88)) title:@"注册" backColor:LRYCOLOR(0xF19149) iconImage:nil backgroundImage:nil tag:LOGINTAG fontSize:17 textColor:LRYCOLOR(0xFFFFFF) withShowlayer:YES Radius:22 shadowWidth:1 BorderColor:[UIColor whiteColor]];
        [_signBtn addTarget:self action:@selector(signBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_signBtn];
        
    }
    return _signBtn;
}

-(UILabel *)agreeTable{
    if (!_agreeTable) {
        _agreeTable = [self createLabel:CGRectMake(LRYScreenpW(65), CGRectGetHeight(self.frame)-LRYScreenpH(41), LRYScreenpW(185), LRYScreenpH(23)) title:@"注册代表您已同意" fontSize:12 textColor:LRYCOLOR(0x787878)];
        [self addSubview:_agreeTable];
        
    }
    return _agreeTable;
}
-(UIButton *)protocolBtn{
    if (!_protocolBtn) {
        _protocolBtn =[self createBtn:CGRectMake(CGRectGetMaxX(self.agreeTable.frame), CGRectGetMinY(self.agreeTable.frame), LRYScreenpW(282), LRYScreenpH(23)) title:@"《服务协议与隐私条款》" backColor:nil iconImage:nil backgroundImage:nil tag:FORGETAG fontSize:14 textColor:LRYCOLOR(0x323232) withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
        [_protocolBtn addTarget:self action:@selector(protocolBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_protocolBtn];
    }
    return _protocolBtn;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn =[self createBtn:CGRectMake(CGRectGetWidth(self.frame)-LRYScreenpW(266), CGRectGetMaxY(self.signBtn.frame)+LRYScreenpH(33), LRYScreenpW(266), LRYScreenpH(28)) title:@"已有账户，立即登录" backColor:nil iconImage:nil backgroundImage:nil tag:FORGETAG fontSize:14 textColor:LRYCOLOR(0x787878) withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginBtn];
    }
    return _loginBtn;
}

-(void)loginBtnClick{
    if (_delegate&&[_delegate respondsToSelector:@selector(LoginBtnClick)]) {
        
        [_delegate LoginBtnClick];
    }
}

-(void)protocolBtnClick{
    
    if (_delegate && [_delegate respondsToSelector:@selector(ProtocolBtnClick)]) {
        [_delegate ProtocolBtnClick];
    }
}

-(void)signBtnClick{
    if (_delegate && [_delegate respondsToSelector:@selector(SignBtnClick)]) {
        [_delegate SignBtnClick];
    }
}
@end
