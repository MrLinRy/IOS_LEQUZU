//
//  MainController.m
//  乐趣租
//
//  Created by Mr.Lin on 18/11/6.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import "MainController.h"
#import "SizeHeader.h"
#import "SGFocusImageFrame.h"


@interface MainController ()<UITableViewDelegate,UITableViewDataSource,SGFocusImageFrameDelegate>
@property (nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *bannerList;
@property(nonatomic,strong)NSMutableArray *imageList;
@property(nonatomic,strong)UIView *banner;

@end

@implementation MainController
-(UITableView *)tableview
{
    if (!_tableview)
    {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,TopAndSystemHeight,ScreenWidth ,ScreenHeight-TopAndSystemHeight) style:UITableViewStylePlain];
        
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableview.delegate = self;
        _tableview.dataSource = self;
        
        [self.view addSubview:_tableview];
        
    }
    return _tableview;
}
-(NSMutableArray *)imageList
{
    if (!_imageList )
    {
        _imageList = [NSMutableArray arrayWithObjects:@"画板 1",@"画板 1-1",@"banner开学季", nil];
    }
    return _imageList;
}

-(NSMutableArray *)bannerList
{
    if (!_bannerList)
    {
        _bannerList = [NSMutableArray array];
        for(int index = 0;index < 3;index++)
        {
            SGFocusImageItem *item = [[SGFocusImageItem alloc] init];
            item.image = self.imageList[index];
            item.bannerId = [NSString stringWithFormat:@"%d",index];
            //            item.type = cell.type;
            //            item.imageUrl = cell.ad_link;
            //            item.sliderUrl = [NSURL URLWithString:cell.link_id];
            //            item.title = cell.ad_name;
            [_bannerList addObject:item];
        }
    }
    return _bannerList;
}

//banner
-(UIView *)banner
{
    if (!_banner)
    {
        _banner = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableview.frame.size.width, 350)];
        
        
        
        //banner列表添加
        SGFocusImageFrame *bottomImageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, LRYScreenpH(350)) delegate:self focusImageItemsArrray:self.bannerList];
        bottomImageFrame.autoScrolling = YES;
        
        [_banner addSubview:bottomImageFrame];
        
        
    }
    return _banner;
}



-(void)viewDidLoad{
    [super viewDidLoad];
    [topBarView setTopTitle:@"租凭"];
    [topBarView setTopTitleColor:LRYCOLOR(0xFF7C08)];
    [topBarView setTopBgColor:[UIColor whiteColor]];
    [self setBackBtnHide:YES];
    [self tableview];
    
}
#pragma mark foucusImageFrame的代理方法
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame
           didSelectItem:(SGFocusImageItem *)item
{
    if ([item.bannerId isEqualToString:@"0"])
    {
        NSLog(@"1");
    }
    else if([item.bannerId isEqualToString:@"1"])
    {
        NSLog(@"2");
    }
    else
    {
        NSLog(@"3");
    }
}

#pragma mark  UITableViewDataSource数据源方法，设置区数，行数
// 返回组/区数,没实现该方法,默认为1

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}
// 返回某section中有多少行，行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else if (section == 1){
        return 0;
    }else{
        return 1;
    }
}



#pragma mark  设置每行cell，header，footer的高度的代理方法

// 设置某行cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 0;
    }else if(indexPath.section == 1){
        return 0;
    }else{
        return LRYScreenpH(323);
    }
    
}
// 设置每个区header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return LRYScreenpH(350);
    }else if (section == 1){
        return LRYScreenpH(293);
    }else{
        return LRYScreenpH(33);
    }
    
}
// 设置每个区footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return LRYScreenpH(50);
    }else if (section == 1){
        return LRYScreenpH(80);
    }else{
        return LRYScreenpH(54);
    }
}
#pragma mark  设置分组的HeadView /FootView的方法
// 设置第section分组的header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.banner;
    }else if (section == 1){
        UIView *view = [[UIView alloc]init];
        return view;
    }else{
        UIView *view = [[UIView alloc]init];
        return view;
    }
    
}
// 设置第section分组的footer
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *FootV = [[UIView alloc]init];
    [FootV setBackgroundColor:[UIColor redColor]];
    return FootV;
}

#pragma mark  设置cell的视图内容

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //可重用表示符
    static NSString *CellID = @"CellID";
    UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
    //    alloc dealloc
    //如果没有找到可重用cell
    if (CellView == nil)
    {
        CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        //设置row被点击之后无颜色、样式反应
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        //写UI
        
        
        
    }
    //取出数据模型
    
    //写数据
    
    
    return CellView;
}

#pragma mark  操作cell时调用的方法

// cell选中时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}
// cell取消选中时调用
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){
    
    NSLog(@"deselect ");
    
}



@end
