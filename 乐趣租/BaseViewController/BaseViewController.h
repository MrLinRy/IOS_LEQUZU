//
//  BaseViewController.h
//  projectBase
//
//  Created by Mr.LinRy on 16-9-11.
//  Copyright (c) 2016年 Mr.LinRy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarView.h"
#import "ViewManager.h"



@interface BaseViewController : UIViewController<TopBarViewDelegate>
{
@protected
    TopBarView *topBarView;
}

-(void)setTopTitle:(NSString *)titleStr;
-(void)initUI;
-(void)setBackBtnHide:(BOOL)hide;
-(void)onchangeskin;
-(void)setBackBtnImage:(UIImage *)image;
-(void)setTopBgColor:(UIColor *)backgroundColor;
-(void)setTopTitleColor:(UIColor *)color;
-(void)setTopLineHide:(BOOL)hide;
-(void)setTopTitleFont:(UIFont *)font;




-(UIButton *)createBtn:(CGRect)frame title:(NSString *)title backColor:(UIColor *)bgColor iconImage:(UIImage *)iconImage backgroundImage:(UIImage *)bgImage tag:(int)tag fontSize:(int)fontSize textColor:(UIColor *)textColor withShowlayer:(BOOL)show Radius:(int)sum shadowWidth:(int)width BorderColor:(UIColor *)BColor;
-(UILabel *)createLabel:(CGRect)frame title:(NSString *)title fontSize:(int)fontSize textColor:(UIColor *)textColor;

@end
