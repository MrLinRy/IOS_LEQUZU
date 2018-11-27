//
//  View_One.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/6.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "View_One.h"
#import "MainController.h"
#import "SizeHeader.h"

#define LEFTSZIE LRYScreenpW(32)
#define BTNWIDTH LRYScreenpW(93)
#define BTNHEIHT LRYScreenpH(132)
#define BTNANDRNTW LRYScreenpW(147)
#define BTNANDRNTH LRYScreenpH(162)
#define  BTNTAG(S) 1000+S
@interface View_One ()<MainControllerDelegate>

@property (nonatomic,strong)UIButton *Btn;
@property (nonatomic,strong)NSMutableArray *titleArry;
@property (nonatomic,strong)NSMutableArray *imageArry;
@end


@implementation View_One


#pragma mark -- init

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
       

        
    }
    return self;
}

-(void)setNeedsLayout{
    [self Btn];
}

#pragma mark -- TitleArry and imageArry

-(NSMutableArray *)titleArry{
    if (!_titleArry) {
        _titleArry = [NSMutableArray arrayWithCapacity:100];
    }
    return _titleArry;
}

-(NSMutableArray *)imageArry{
    if (!_imageArry) {
        _imageArry = [NSMutableArray arrayWithCapacity:100];
    }
    return _imageArry;
}


#pragma mark -- titleArry and imageArry delegate method

//赋值
-(void)SetTitleArry:(NSMutableArray *)titleArry{
    self.titleArry = titleArry;
    
    
}

-(void)SetImageArry:(NSMutableArray *)imageArry{
    self.imageArry = imageArry;
    
}

#pragma mark -- Btn

-(UIButton *)Btn{
    if (!_Btn) {
        
        for (int i=0 ; i< self.titleArry.count ; i++) {
            if (i < 5 ) {
                _Btn =[self createBtn:CGRectMake(LEFTSZIE+(BTNANDRNTW*i),0,BTNWIDTH,BTNHEIHT) title:self.titleArry[i] backColor:[UIColor whiteColor] iconImage:[UIImage imageNamed:self.imageArry[i]] backgroundImage:nil tag:BTNTAG(i) fontSize:11 textColor:LRYCOLOR(0x323232)  withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
            }
            else{
                _Btn =[self createBtn:CGRectMake(LEFTSZIE+(BTNANDRNTW*(i-5)),BTNANDRNTH,BTNWIDTH,BTNHEIHT) title:self.titleArry[i] backColor:[UIColor whiteColor] iconImage:[UIImage imageNamed:self.imageArry[i]] backgroundImage:nil tag:BTNTAG(i) fontSize:11 textColor:LRYCOLOR(0x323232)  withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
                
            }
            // button标题的偏移量
            _Btn.titleEdgeInsets = UIEdgeInsetsMake(_Btn.imageView.frame.size.height+5, -_Btn.imageView.bounds.size.width, 0,0);
            // button图片的偏移量
            _Btn.imageEdgeInsets = UIEdgeInsetsMake(0, _Btn.titleLabel.frame.size.width/2, _Btn.titleLabel.frame.size.height+5, -_Btn.titleLabel.frame.size.width/2);
            [_Btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_Btn];

        }
        
    }
    return _Btn;
}

#pragma mark -- btn 

-(void)BtnClick:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(ClickBtn:)]) {
        [_delegate ClickBtn:sender];
    }
}







@end
