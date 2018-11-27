//
//  HeadView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadViewDelagate <NSObject>

-(void)MoreClick:(UIButton *)sender Title:(NSString *)titleStr;

@end



@interface HeadView : UIView
-(void)SetHeadTitle:(NSString *)titleStr;

@property (nonatomic,strong)id<HeadViewDelagate>delegate;
@end
