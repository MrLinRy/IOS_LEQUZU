//
//  ViewManager.m
//  projectBase
//
//  Created by Mr.LinRy on 16-9-11.
//  Copyright (c) 2016年 Mr.LinRy. All rights reserved.
//

#import "ViewManager.h"
#import "SizeHeader.h"
#import "ViewController.h"
#import "LoginViewController.h"




@implementation ViewManager

static ViewManager* mInstance;

@synthesize NavigationController = _navigationController;


+ (ViewManager*)shareInstance
{
    if (nil == mInstance)
    {
        mInstance = [[ViewManager alloc] init];
    }
    
    return mInstance;
}


-(id)init
{
    self = [super init];
    if(self != nil)
    {
        LoginViewController *login = [LoginViewController new];
        _navigationController = [[UINavigationController alloc] initWithRootViewController:login];
//        _navigationController = [[UINavigationController alloc] initWithRootViewController:[self createYMTTabBarController]];
    }
    
    
    _navigationController.navigationBar.hidden = YES;
    _navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    
    return self;
}



-(void)toMainPlat
{
//    [_navigationController pushViewController:[self createYMTTabBarController] animated:YES];
}


@end
