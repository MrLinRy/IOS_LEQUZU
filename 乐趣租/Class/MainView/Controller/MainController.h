//
//  MainController.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/6.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "BaseViewController.h"

@protocol  MainControllerDelegate<NSObject>

@optional
-(void)SetTitleArry:(NSMutableArray *)titleArry;
-(void)SetImageArry:(NSMutableArray *)imageArry;


@end

@interface MainController : BaseViewController

@property(nonatomic,weak)id<MainControllerDelegate>delegate;

@end
