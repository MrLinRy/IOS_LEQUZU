//
//  BaseView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/10/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView



-(UIButton *)createBtn:(CGRect)frame title:(NSString *)title backColor:(UIColor *)bgColor iconImage:(UIImage *)iconImage backgroundImage:(UIImage *)bgImage tag:(int)tag fontSize:(int)fontSize textColor:(UIColor *)textColor withShowlayer:(BOOL)show Radius:(int)sum shadowWidth:(int)width BorderColor:(UIColor *)BColor;
-(UILabel *)createLabel:(CGRect)frame title:(NSString *)title fontSize:(int)fontSize textColor:(UIColor *)textColor;

@end
