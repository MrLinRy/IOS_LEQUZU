//
//  STextFieldView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/4.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"
#import "JKCountDownButton.h"
@protocol STextFieldViewDelegate <NSObject>

-(void)PasswordTFieldDidChange:(UITextField *)sender;
-(void)VerificationDidChange:(UITextField *)sender;
-(void)AccountTFieldDidChange:(UITextField *)sender;
-(void)CountDownCodeClick:(JKCountDownButton *)sender;
-(void)SeenClick:(UIButton *)sender TextField:(UITextField *)TF;
@end

@interface STextFieldView : BaseView

@property (nonatomic,weak) id<STextFieldViewDelegate>delegate;
@end