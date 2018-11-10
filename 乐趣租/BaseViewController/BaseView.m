//
//  BaseView.m
//  乐趣租
//
//  Created by Mr.Lin on 18/10/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"
#import "SizeHeader.h"

@interface BaseView ()

@end

@implementation BaseView
//创建btn
-(UIButton *)createBtn:(CGRect)frame title:(NSString *)title backColor:(UIColor *)bgColor iconImage:(UIImage *)iconImage backgroundImage:(UIImage *)bgImage tag:(int)tag fontSize:(int)fontSize textColor:(UIColor *)textColor withShowlayer:(BOOL)show Radius:(int)sum shadowWidth:(int)width BorderColor:(UIColor *)BColor
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.tag = tag;
    btn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    if (bgColor !=nil) {
        [btn setBackgroundColor:bgColor];
    }
    if(textColor != nil)
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    if(bgImage != nil)
        [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    if(iconImage != nil)
        [btn setImage:iconImage forState:UIControlStateNormal];
    if(title != nil)
        [btn setTitle:title forState:UIControlStateNormal];
    if (fontSize!= 0) {
        btn.titleLabel.font = [UIFont systemFontOfSize:LRYsystemFontOfSize(fontSize)];
    }
    if(show !=NO){
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:sum];
        [btn.layer setBorderColor:BColor.CGColor];
        [btn.layer setBorderWidth:width];
    }
    //[btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}



//创建label
-(UILabel *)createLabel:(CGRect)frame title:(NSString *)title fontSize:(int)fontSize textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    if(textColor != nil)
        label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}

@end
