//
//  TextFieldView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/10/27.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldViewDelegate <NSObject>

-(void)PasswordTFieldDidChange:(UITextField *)sender;
-(void)AccountTFieldDidChange:(UITextField *)sender;

@end

@interface TextFieldView : UIView

@property (nonatomic,weak) id<TextFieldViewDelegate>delegate;
@end
