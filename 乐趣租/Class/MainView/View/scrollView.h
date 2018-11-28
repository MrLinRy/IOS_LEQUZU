//
//  scrollView.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseView.h"

@protocol  scrollViewDelegate<NSObject>

-(void)ClickBtn:(UIButton *)sender titleStr:(NSString *)titlestr;

@end


@interface scrollView : BaseView
@property (nonatomic,strong)UIImage *image;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *price;
@property (nonatomic,weak)id<scrollViewDelegate>delegate;
@end
