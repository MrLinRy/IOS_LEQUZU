//
//  SignController.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/4.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "SignController.h"
#import "STextFieldView.h"
#import "signButtonView.h"
#import "SizeHeader.h"
#import "ViewManager.h"




#define LEFT LRYScreenpW(75)
#define PASSWORDTAG 1000
@interface SignController ()<STextFieldViewDelegate,signButtonViewDelegate>

@property (nonatomic ,strong) UIButton *canceBtn;
@property (nonatomic,strong)UILabel *titleLabe;
@property (nonatomic,strong)STextFieldView *TFView;
@property (nonatomic,strong)signButtonView *SBView;


@end

@implementation SignController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [topBarView setHidden:YES];
    

    [self canceBtn];
    
    [self titleLabe];
    
    [self TFView];
    [self SBView];
    
}
-(UIButton *)canceBtn{
    if(!_canceBtn){
        _canceBtn = [self createBtn:CGRectMake(LRYScreenpW(33), LRYScreenpH(75), LRYScreenpW(27), LRYScreenpH(27)) title:@"x" backColor:nil iconImage:nil backgroundImage:nil tag:1001 fontSize:17 textColor:LRYCOLOR(0x434343) withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
        [_canceBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_canceBtn];
        
    }
    return _canceBtn;
}

-(UILabel *)titleLabe{
    if (!_titleLabe) {
        _titleLabe = [self createLabel:CGRectMake(LRYScreenpW(69), LRYScreenpH(261), LRYScreenpW(445), LRYScreenpH(58)) title:@"欢迎来到乐趣租" fontSize:LRYsystemFontOfSize(30) textColor:LRYCOLOR(0x000000)];
        [self.view addSubview:_titleLabe];
    }
    return _titleLabe;
}

-(STextFieldView *)TFView{
    if (!_TFView) {
        _TFView = [[STextFieldView alloc]initWithFrame:CGRectMake(LEFT, CGRectGetMaxY(self.titleLabe.frame)+LRYScreenpH(176), ScreenWidth-2*LEFT,LRYScreenpH(325))];
        _TFView.delegate = self;
        [self.view addSubview:_TFView];
    }
    return _TFView;
}

-(signButtonView *)SBView{
    if (!_SBView) {
        _SBView = [[signButtonView alloc]initWithFrame:CGRectMake(LEFT, CGRectGetMaxY(self.TFView.frame)+LRYScreenpH(120), ScreenWidth-LEFT*2, ScreenHeight-CGRectGetMaxY(self.TFView.frame)-LRYScreenpH(120))];
        _SBView.delegate = self;
        [self.view addSubview:_SBView];
    }
    return  _SBView;
}

#pragma mark----cancel按钮行为
-(void)cancelClick:(UIButton *)sender{
    [[ViewManager shareInstance].NavigationController popViewControllerAnimated:YES];
}





#pragma mark----TFView按钮代理行为
-(void)CountDownCodeClick:(JKCountDownButton *)sender{
    
    [sender addToucheHandler:^(JKCountDownButton*sendder, NSInteger tag) {
        //手指头点击之后，一般在这个位置进行获取验证码的网络请求
        
        //不允许点击了
        sendder.enabled = NO;
        //倒计时
        [sendder startWithSecond:5];
        
        [sendder didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
            //倒计时过程中的时候的状态：颜色文字等
            countDownButton.enabled = NO;
            NSString *title = [NSString stringWithFormat:@"%d秒后重发",second];
            return title;
        }];
        //倒计时结束后的操作
        
        [sendder didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;
            return @"重新发送";
            
        }];
        
    }];

}
-(void)SeenClick:(UIButton *)sender TextField:(UITextField *)TF{
    
    if (sender.selected == NO) {
        [sender setSelected:YES];
        [TF setSecureTextEntry:NO];
    }else{
        [sender setSelected:NO];
        [TF setSecureTextEntry:YES];

    }
}
#pragma mark----SBView按钮代理行为
-(void)SignBtnClick{
    
}
-(void)LoginBtnClick{
    
    [[ViewManager shareInstance].NavigationController popViewControllerAnimated:YES];
}
-(void)ProtocolBtnClick{
    
}

//监听通知的行为
-(void)AccountTFieldDidChange:(UITextField *)sender{
    NSLog(@"acc change");
}
-(void)PasswordTFieldDidChange:(UITextField *)sender{
    
}
-(void)VerificationDidChange:(UITextField *)sender{
    
}

@end
