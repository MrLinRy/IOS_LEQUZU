//
//  tabelViewCell.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "tabelViewCell.h"

#import "SizeHeader.h"

@interface tabelViewCell ()

@end

@implementation tabelViewCell



-(scrollView *)itemViewOne{
    if (!_itemViewOne) {
        
        _itemViewOne = [[scrollView alloc]initWithFrame:CGRectMake(LRYScreenpW(32), LRYScreenpH(37), LRYScreenpW(260), LRYScreenpH(300))];
        
    }
    return _itemViewOne;
}

-(scrollView *)itemViewTwo{
    if (!_itemViewTwo) {
        
        _itemViewTwo = [[scrollView alloc]initWithFrame:CGRectMake(LRYScreenpW(332), LRYScreenpH(37), LRYScreenpW(260), LRYScreenpH(300))];
        
    }
    return _itemViewTwo;
}
-(scrollView *)itemViewThree{
    if (!_itemViewThree) {
        
        _itemViewThree = [[scrollView alloc]initWithFrame:CGRectMake(LRYScreenpW(632), LRYScreenpH(37), LRYScreenpW(260), LRYScreenpH(300))];
        
    }
    return _itemViewThree;
}

-(UIScrollView *)sv{
    if (!_sv) {
        _sv=[[UIScrollView  alloc]initWithFrame:CGRectMake( 0, 0, LRYScreenpW(750), LRYScreenpH(342))];
        [_sv setBackgroundColor:[UIColor clearColor]];
        //允许视图翻页并设置滚动范围
        _sv.pagingEnabled=YES;
        _sv.contentSize=CGSizeMake(LRYScreenpW(920), 0);
        
        //指定初始呈现视图
        _sv.contentOffset=CGPointMake(0,0);
        
        [_sv addSubview: self.itemViewOne];
        [_sv addSubview: self.itemViewTwo];
        [_sv addSubview: self.itemViewThree];
        
        [self addSubview:_sv];
        
    }
    return _sv;
}

#pragma mark -- init

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self sv];
        
        
    }
    return self;
}

@end
