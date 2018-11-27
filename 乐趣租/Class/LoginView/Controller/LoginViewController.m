//
//  LoginViewController.m
//  乐趣租
//
//  Created by Mr.Lin on 18/10/27.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "LoginViewController.h"
#import "SizeHeader.h"
#import "ViewManager.h"
#import "TextFieldView.h"
#import "LoginBtnView.h"
#import "ThirdLoginView.h"
#import "SignController.h"
#import "ForgetController.h"
#import "MainController.h"
#import "OrderController.h"
#import "MyselfController.h"


#define LEFT LRYScreenpW(75)

@interface LoginViewController ()<TextFieldViewDelegate,LoginBtnViewDelegate,ThirdLoginViewDelegate>


@property (nonatomic,strong)UITabBarController *tabBarController;
@property (nonatomic,strong)MainController *mainVew;
@property (nonatomic,strong)OrderController *orderView;
@property (nonatomic,strong)MyselfController *myselfView;

@property (nonatomic,strong)UIButton *canceBtn;
@property (nonatomic,strong)UILabel *titleLabe;
@property (nonatomic,strong)TextFieldView *TFView;
@property (nonatomic,strong)LoginBtnView *loginBtnview;
@property (nonatomic,strong)ThirdLoginView *ThirdLoginView;
@end

@implementation LoginViewController


-(MainController *)mainVew{
    if (!_mainVew) {
        _mainVew = [[MainController alloc]init];
        
        [_mainVew.tabBarItem setTitle:@" 首页"];
        [_mainVew.tabBarItem setImage:[UIImage imageNamed:@"icon_home_normal"]];
        [_mainVew.tabBarItem setSelectedImage:[UIImage imageNamed:@"icon_home_pressed"]];
        
        
        
    }
    return _mainVew;
}


-(OrderController *)orderView{
    if (!_orderView) {
        _orderView =[[OrderController alloc]init];
        
        [_orderView.tabBarItem setTitle:@"订单"];
        [_orderView.tabBarItem setImage:[UIImage imageNamed:@"icon_order_normal"]];
        [_orderView.tabBarItem setSelectedImage:[UIImage imageNamed:@"icon_order_pressed"]];
        
    }
    return _orderView;
}

-(MyselfController *)myselfView{
    if (!_myselfView) {
        _myselfView = [[MyselfController alloc]init];
        
        [_myselfView.tabBarItem setTitle:@"我的"];
        [_myselfView.tabBarItem setImage:[UIImage imageNamed:@"icon_mine_normal"]];
        [_myselfView.tabBarItem setSelectedImage:[UIImage imageNamed:@"icon_mine_pressed"]];
        
        
    }
    return _myselfView;
}

-(UITabBarController *)tabBarController{
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc]init];
        
      
        
        [_tabBarController.tabBar setBackgroundColor:[UIColor whiteColor]];
        
        // 分栏控制器会自动将其管理的视图控制器的分栏按钮(UITabBarItem)放到分栏上显示
        _tabBarController.viewControllers = @[self.mainVew, self.orderView,self.myselfView];
        
        
        //修改tabarItem的文字标题不同状态下的不同颜色
        //[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:LRYCOLOR(0xFF7C08),NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil]forState:UIControlStateSelected];
        
        // 始终绘制图片原始状态，不使用Tint Color。
        //img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        //修改tabarItem的点击状态下文字、图片的颜色
        [_tabBarController.tabBar setTintColor:LRYCOLOR(0xFF7C08)];
    }
    return _tabBarController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [topBarView setHidden:YES];
    
    [self canceBtn];
    
    [self titleLabe];
    
    [self TFView];
    
    [self loginBtnview];
    
    [self ThirdLoginView];
    
}

-(UIButton *)canceBtn{
    if(!_canceBtn){
        _canceBtn = [self createBtn:CGRectMake(LRYScreenpW(33), LRYScreenpH(75), LRYScreenpW(27), LRYScreenpH(27)) title:@"x" backColor:nil iconImage:nil backgroundImage:nil tag:1001 fontSize:17 textColor:LRYCOLOR(0x434343) withShowlayer:NO Radius:0 shadowWidth:0 BorderColor:nil];
        [self.view addSubview:_canceBtn];

    }
    return _canceBtn;
}

-(UILabel *)titleLabe{
    if (!_titleLabe) {
        _titleLabe = [self createLabel:CGRectMake(LRYScreenpW(69), LRYScreenpH(261), LRYScreenpW(445), LRYScreenpH(58)) title:@"欢迎来到乐趣租" fontSize:LRYsystemFontOfSize(30) textColor:LRYCOLOR(0x000000)];
        [self.view addSubview:_titleLabe];
    }
    return _titleLabe;
}

-(TextFieldView *)TFView{
    if (!_TFView) {
        _TFView = [[TextFieldView alloc]initWithFrame:CGRectMake(LEFT, CGRectGetMaxY(self.titleLabe.frame)+LRYScreenpH(176), ScreenWidth-2*LEFT,LRYScreenpH(170))];
        _TFView.delegate = self;
        [self.view addSubview:_TFView];
    }
    return _TFView;
}

-(UIView *)loginBtnview{
    if (!_loginBtnview) {
        _loginBtnview =[[LoginBtnView alloc]initWithFrame:CGRectMake(LEFT, CGRectGetMaxY(self.TFView.frame)+LRYScreenpH(120), ScreenWidth-LEFT*2, LRYScreenpH(148))];
        _loginBtnview.delegate = self;
        [self.view addSubview:_loginBtnview];
    }
    return _loginBtnview;
}

-(UIView *)ThirdLoginView{
    if (!_ThirdLoginView) {
        _ThirdLoginView =[[ThirdLoginView alloc]initWithFrame:CGRectMake(LEFT, CGRectGetMaxY(self.loginBtnview.frame)+LRYScreenpH(148), ScreenWidth-LEFT*2, LRYScreenpH(188))];
        _ThirdLoginView.delegate =self;
        [self.view addSubview:_ThirdLoginView];
    
    }
    return _ThirdLoginView;
}


#pragma mark----按钮代理行为
-(void)LoginBtnClick{
    
    
    [[ViewManager shareInstance].NavigationController pushViewController:self.tabBarController animated:YES];

}

-(void)ForgetBtnClick{
    ForgetController *forgetView =[ForgetController new];
    [[ViewManager shareInstance].NavigationController pushViewController:forgetView animated:YES];
}

-(void)SignBtnClick{
    SignController *signView =[SignController new];
    [[ViewManager shareInstance].NavigationController pushViewController:signView animated:YES];
}

-(void)QQBtnClick{
    
}
-(void)WeChatBtnClick{
    
}
//监听通知的行为
-(void)AccountTFieldDidChange:(UITextField *)sender{
    NSLog(@"acc change");
}
-(void)PasswordTFieldDidChange:(UITextField *)sender{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
