//
//  View_One.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/6.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "View_One.h"
#import "SizeHeader.h"

@interface View_One ()

@property (nonatomic,strong)UIButton *Btn;
@property (nonatomic,strong)NSMutableArray *titleArry;
@end


@implementation View_One


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

//-(UIButton *)Btn{
//    if (!_Btn) {
//        _Btn =[self createBtn:CGRectMake(,,,) title:@"" backColor:nil iconImage:nil backgroundImage:nil tag:FORGETAG fontSize:14 textColor:  withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
//        [_Btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:_Btn];
//    }
//    return Btn;
//}




@end
