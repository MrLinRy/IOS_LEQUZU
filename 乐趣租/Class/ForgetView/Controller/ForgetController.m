//
//  ForgetController.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/5.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "ForgetController.h"
#import "STextFieldView.h"
#import "forgetButtonView.h"
#import "SizeHeader.h"
#import "ViewManager.h"

#define LEFT LRYScreenpW(75)
#define PASSWORDTAG 1000
@interface ForgetController ()<STextFieldViewDelegate,forgetButtonViewDelegate>
@property (nonatomic,strong)STextFieldView *TFView;
@property (nonatomic,strong)forgetButtonView *FBView;
@end

@implementation ForgetController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [topBarView setTopTitle:@"找回密码"];
    [self setTopBgColor:[UIColor whiteColor]];
    [self setBackBtnImage:[UIImage imageNamed:@"返回"]];
    

    
    [self TFView];
    [self FBView];
    
}


-(STextFieldView *)TFView{
    if (!_TFView) {
        _TFView = [[STextFieldView alloc]initWithFrame:CGRectMake(LEFT, TopAndSystemHeight+LRYScreenpH(109), ScreenWidth-2*LEFT,LRYScreenpH(325))];
        _TFView.delegate = self;
        [self.view addSubview:_TFView];
    }
    return _TFView;
}

-(forgetButtonView *)FBView{
    if (!_FBView) {
        _FBView = [[forgetButtonView alloc]initWithFrame:CGRectMake(LEFT, CGRectGetMaxY(self.TFView.frame)+LRYScreenpH(120), ScreenWidth-LEFT*2, ScreenHeight-CGRectGetMaxY(self.TFView.frame)-LRYScreenpH(120))];
        _FBView.delegate =self;
        [self.view addSubview:_FBView];
    }
    return  _FBView;
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

//监听textfield通知的行为
-(void)AccountTFieldDidChange:(UITextField *)sender{
    NSLog(@"acc change");
}
-(void)PasswordTFieldDidChange:(UITextField *)sender{
    
}
-(void)VerificationDidChange:(UITextField *)sender{
    
}

@end
