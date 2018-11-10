//
//  signButtonView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/4.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"

@protocol signButtonViewDelegate <NSObject>

-(void)LoginBtnClick;
-(void)ProtocolBtnClick;
-(void)SignBtnClick;

@end
@interface signButtonView : BaseView



@property (nonatomic,weak)id<signButtonViewDelegate> delegate;
@end
