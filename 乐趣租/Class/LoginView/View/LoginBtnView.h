//
//  LoginBtnView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/10/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"

@protocol LoginBtnViewDelegate <NSObject>

-(void)LoginBtnClick;
-(void)ForgetBtnClick;
-(void)SignBtnClick;

@end
@interface LoginBtnView : BaseView



@property (nonatomic,weak)id<LoginBtnViewDelegate> delegate;
@end
