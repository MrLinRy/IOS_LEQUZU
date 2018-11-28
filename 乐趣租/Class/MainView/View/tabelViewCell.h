//
//  tabelViewCell.h
//  乐趣租
//
//  Created by Mr.Lin on 18/11/28.
//  Copyright © 2018年 Mr.LinRy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scrollView.h"


@interface tabelViewCell : UITableViewCell
@property (nonatomic,strong)scrollView *itemViewOne;
@property (nonatomic,strong)scrollView *itemViewTwo;
@property (nonatomic,strong)scrollView *itemViewThree;
@property (nonatomic,strong)UIScrollView *sv;
@end
