//
//  View_One.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/6.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"

@protocol  ViewOneDelegate<NSObject>

-(void)ClickBtn:(UIButton *)sender;

@end


@interface View_One : BaseView

@property(nonatomic,weak)id<ViewOneDelegate>delegate;

@end
