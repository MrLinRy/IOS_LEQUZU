//
//  ThirdLoginView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/10/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"

@protocol ThirdLoginViewDelegate <NSObject>

-(void)QQBtnClick;
-(void)WeChatBtnClick;

@end
@interface ThirdLoginView : BaseView

@property (nonatomic,strong) id<ThirdLoginViewDelegate>delegate;
@end
