//
//  TextFieldView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/4.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "STextFieldView.h"
#import "SizeHeader.h"


#define ACCOUNTFIELD 1000
#define VERIFICAEIELD 1001
#define PASSWORDFIELD 1002
#define SEENBTN 1004

@interface STextFieldView ()<UITextFieldDelegate>

@property (nonatomic,strong)UITextField *accountTField;
@property (nonatomic,strong)UILabel *line_0;
@property (nonatomic,strong)UITextField *VerificaTField;
@property (nonatomic,strong)UILabel *line_1;
@property (nonatomic,strong)UITextField *passwordTField;
@property (nonatomic,strong)UILabel *line_2;
@property (nonatomic,strong)JKCountDownButton *countDownCode;
@property (nonatomic,strong)UIButton *seenBtn;

@end

@implementation STextFieldView
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
#pragma mark-----accountTField
        [self accountTField];
        
#pragma mark------line_0
        [self line_0];
        
#pragma mark------VerificaTField
        [self VerificaTField];

#pragma mark------line_1
        [self line_1];
        
#pragma mark------passwordTField
        [self passwordTField];
#pragma mark------line_2
        [self line_2];
        
        
        [self countDownCode];
        [self seenBtn];
    }
    return self;
}
-(UITextField *)accountTField{
    if (!_accountTField) {
        _accountTField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, LRYScreenpW(600), LRYScreenpH(32))];
        [_accountTField setTag:ACCOUNTFIELD];
        //        设置代理
        _accountTField.delegate = self;
        
        //        设置输入框提示语与字体颜色
        [_accountTField setPlaceholder:@"请输入您的手机号"];
        //[accountTField.placeholder setValue:LRYUIColorFromRGB(0x787878, 1.0) forKey:@"_placeholderLabel.textColor"];
        
        //        设置字体
        [_accountTField setTextColor:LRYCOLOR(0xAAAAAA)];
        [_accountTField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
        
        //        设置边框样式，只有设置了才会显示边框样式
        [_accountTField setBorderStyle:UITextBorderStyleNone];
        
        //        设置背景颜色
        [_accountTField setBackgroundColor:[UIColor clearColor]];
        
        //        输入框中是否有个x号，在什么时候显示，可用于一次性删除输入框中的内容
        _accountTField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        //        再次编辑是否清空
        [_accountTField setClearsOnBeginEditing:YES];
        //        设置监听
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:_accountTField];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accountTFieldDidChange:) name:UITextFieldTextDidChangeNotification object:_accountTField];
        [self addSubview:_accountTField];
        
    }
    return _accountTField;
}

-(UILabel *)line_0{
    if (!_line_0) {
        _line_0 = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.accountTField.frame)+LRYScreenpH(45),CGRectGetWidth(self.accountTField.frame), LRYScreenpH(1))];
        [_line_0 setBackgroundColor:LRYCOLOR(0xAAAAAA)];
        [self addSubview:_line_0];
        
    }
    return _line_0;
}

-(UITextField *)VerificaTField{
    if (!_VerificaTField) {
        _VerificaTField = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.line_0.frame)+LRYScreenpH(45), CGRectGetWidth(self.frame)-LRYScreenpW(146), CGRectGetHeight(self.accountTField.frame))];
        [_VerificaTField setTag:VERIFICAEIELD];
        //        设置代理
        _VerificaTField.delegate = self;
        
        //        设置输入框提示语与字体颜色
        [_VerificaTField setPlaceholder:@"请输入验证码"];
        
        //        设置字体
        [_VerificaTField setTextColor:LRYCOLOR(0xAAAAAA)];
        [_VerificaTField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
        
        //        设置边框样式，只有设置了才会显示边框样式
        [_VerificaTField setBorderStyle:UITextBorderStyleNone];
        
        //        设置背景颜色
        [_VerificaTField setBackgroundColor:[UIColor clearColor]];
        
        //        输入框中是否有个x号，在什么时候显示，可用于一次性删除输入框中的内容
        _VerificaTField.clearButtonMode = UITextFieldViewModeNever;
        
        //        再次编辑是否清空
        [_VerificaTField setClearsOnBeginEditing:YES];
        //        设置监听
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:_VerificaTField];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(verificaTFieldDidChange:) name:UITextFieldTextDidChangeNotification object:_VerificaTField];
        
        //        是否隐藏输入文本（密文输入）
        [_VerificaTField setSecureTextEntry:NO];
        [self addSubview:_VerificaTField];
        
    }
    return _VerificaTField;
}


-(UILabel *)line_1{
    if (!_line_1) {
        _line_1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.VerificaTField.frame)+LRYScreenpH(45), CGRectGetWidth(self.accountTField.frame), LRYScreenpH(1))];
        [_line_1 setBackgroundColor:LRYCOLOR(0xAAAAAA)];
        [self addSubview:_line_1];
    }
    return _line_1;
}


-(UITextField *)passwordTField{
    if (!_passwordTField) {
        _passwordTField = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.line_1.frame)+LRYScreenpH(45), CGRectGetWidth(self.VerificaTField.frame), CGRectGetHeight(self.accountTField.frame))];
        [_passwordTField setTag:PASSWORDFIELD];
        //        设置代理
        _passwordTField.delegate = self;
        
        //        设置输入框提示语与字体颜色
        [_passwordTField setPlaceholder:@"请输入密码"];
        //[passwordTField.placeholder setValue:LRYUIColorFromRGB(0x787878, 1.0) forKey:@"_placeholderLabel.textColor"];
        
        //        设置字体
        [_passwordTField setTextColor:LRYCOLOR(0xAAAAAA)];
        [_passwordTField setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
        
        //        设置边框样式，只有设置了才会显示边框样式
        [_passwordTField setBorderStyle:UITextBorderStyleNone];
        
        //        设置背景颜色
        [_passwordTField setBackgroundColor:[UIColor clearColor]];
        
        //        输入框中是否有个x号，在什么时候显示，可用于一次性删除输入框中的内容
        _passwordTField.clearButtonMode = UITextFieldViewModeNever;
        
        //        再次编辑是否清空
        [_passwordTField setClearsOnBeginEditing:YES];
        //        设置监听
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:_passwordTField];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passwordTFieldDidChange:) name:UITextFieldTextDidChangeNotification object:_passwordTField];
        
        //        是否隐藏输入文本（密文输入）
        [_passwordTField setSecureTextEntry:YES];
        [self addSubview:_passwordTField];
        
    }
    return _passwordTField;
}

-(UILabel *)line_2{
    if (!_line_2) {
        _line_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetHeight(self.frame)-LRYScreenpH(1),CGRectGetWidth(self.accountTField.frame), LRYScreenpH(1))];
        [_line_2 setBackgroundColor:LRYCOLOR(0xAAAAAA)];
        [self addSubview:_line_2];
        
    }
    return _line_2;
}

-(JKCountDownButton *)countDownCode{
    if (!_countDownCode) {
        _countDownCode = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
        _countDownCode.frame = CGRectMake(CGRectGetWidth(self.frame)-LRYScreenpW(146),CGRectGetMaxY(self.line_0.frame)+LRYScreenpH(48), LRYScreenpW(146), LRYScreenpH(27));
        [_countDownCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        _countDownCode.backgroundColor = [UIColor whiteColor];
        [_countDownCode setTitleColor:LRYCOLOR(0xFF9E4C) forState:UIControlStateNormal];
        _countDownCode.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_countDownCode addTarget:self action:@selector(countDownCodeClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_countDownCode];
    }
    return _countDownCode;
}

-(UIButton *)seenBtn{
    if (!_seenBtn) {
        //未被点击时按钮样式
        _seenBtn = [self createBtn:CGRectMake(CGRectGetWidth(self.frame)-LRYScreenpW(40), CGRectGetMaxY(self.line_1.frame)+LRYScreenpH(48), LRYScreenpW(40), LRYScreenpH(24)) title:nil backColor:[UIColor whiteColor] iconImage:[UIImage imageNamed:@"seen"] backgroundImage:nil tag:SEENBTN fontSize:0 textColor:nil withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
        //点击后按钮样式（图片渲染）
        UIImage *image =[UIImage imageNamed:@"seen"];
        [_seenBtn.imageView setTintColor:LRYCOLOR(0xFCC093)];
        [_seenBtn setImage: [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
        [_seenBtn setSelected:NO];
        
        [_seenBtn addTarget:self action:@selector(seenClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_seenBtn];
        
    }
    return _seenBtn;
}




#pragma mark----委托方法

//按return键键盘往下收
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}


//点击界面空白处退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    UITextField *a_text = [self viewWithTag:ACCOUNTFIELD];
    UITextField *p_text =[self viewWithTag:PASSWORDFIELD];
    [a_text resignFirstResponder];
    [p_text resignFirstResponder];
}


#pragma mark-----委托方法
-(void)accountTFieldDidChange:(UITextField *)sender{
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(AccountTFieldDidChange:)]) {
        [_delegate AccountTFieldDidChange:(UITextField *)sender];
    }
    
}
-(void)verificaTFieldDidChange:(UITextField *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(VerificationDidChange:)]) {
        [_delegate VerificationDidChange:sender];
    }
}
-(void)passwordTFieldDidChange:(UITextField *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(PasswordTFieldDidChange:)]) {
        [_delegate PasswordTFieldDidChange:sender];
    }
}

-(void)countDownCodeClick:(JKCountDownButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(CountDownCodeClick:)]) {
       
        [_delegate CountDownCodeClick:sender];
    }
}
-(void)seenClick:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(SeenClick:TextField:)]) {
       
        [_delegate SeenClick:sender TextField:self.passwordTField];
    }
}
@end
