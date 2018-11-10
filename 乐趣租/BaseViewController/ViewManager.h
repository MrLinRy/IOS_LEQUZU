//
//  ViewManager.h
//  projectBase
//
//  Created by Mr.LinRy on 16-9-11.
//  Copyright (c) 2016年 Mr.LinRy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ViewManager : NSObject
{
@private
    UINavigationController *_navigationController;
}

@property (nonatomic, readonly) UINavigationController *NavigationController;

+ (ViewManager*)shareInstance;

-(void)toMainPlat;

@end
