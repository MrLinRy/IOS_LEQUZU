//
//  TextFieldView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/10/27.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "TextFieldView.h"
#import "SizeHeader.h"

#define ACCOUNTFIELD 1000
#define PASSWORDFIELD 1001

@interface TextFieldView ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *accountTField;
@property (nonatomic,strong)UILabel *line_0;
@property (nonatomic,strong)UITextField *passwordTField;
@property (nonatomic,strong)UILabel *line_1;
@end

@implementation TextFieldView
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
#pragma mark-----accountTField
        [self accountTField];
        
        
#pragma mark------line_0
        [self line_0];
#pragma mark------passwordTField
        [self passwordTField];
#pragma mark------line_1
        [self line_1];
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
-(UITextField *)passwordTField{
    if (!_passwordTField) {
        _passwordTField = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.line_0.frame)+LRYScreenpH(45), CGRectGetWidth(self.line_0.frame), CGRectGetHeight(self.accountTField.frame))];
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
        _passwordTField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
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

-(UILabel *)line_1{
    if (!_line_1) {
        _line_1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.passwordTField.frame), LRYScreenpH(1))];
        [_line_1 setBackgroundColor:LRYCOLOR(0xAAAAAA)];
        [self addSubview:_line_1];
    }
    return _line_1;
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

-(void)passwordTFieldDidChange:(UITextField *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(PasswordTFieldDidChange:)]) {
        [_delegate PasswordTFieldDidChange:sender];
    }
}


@end
