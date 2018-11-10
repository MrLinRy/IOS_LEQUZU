//
//  forgetButtonView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/5.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"

@protocol forgetButtonViewDelegate <NSObject>

-(void)LoginBtnClick;
-(void)ProtocolBtnClick;
-(void)SignBtnClick;

@end
@interface forgetButtonView : BaseView



@property (nonatomic,weak)id<forgetButtonViewDelegate> delegate;
@end