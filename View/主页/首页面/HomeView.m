//
//  HomeView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "HomeView.h"

@implementation HomeView

-(void)tableinit{
    _scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 390*2, self.bounds.size.height-50)];
    _scrollview.contentSize=CGSizeMake(self.bounds.size.width*2, self.bounds.size.height);
    [self addSubview:_scrollview];
    _scrollview.pagingEnabled=YES;
    _scrollview.showsHorizontalScrollIndicator=NO;
//    _scrollview.showsVerticalScrollIndicator=YES;
    _scrollview.bounces=NO;//关闭弹簧效果
    //首页微博
    _hometableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 390, self.bounds.size.height)];
    [_scrollview addSubview:_hometableview];
    //我发布的微博列表
    _mytableview=[[UITableView alloc] initWithFrame:CGRectMake(390, 0, 390, self.bounds.size.height)];
    [_scrollview addSubview:_mytableview];
    
    self.placeholder=[[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width+100, 100, 250, 50)];
    self.placeholder.font = [UIFont systemFontOfSize:22];
    self.placeholder.text=@"你的微博空空如也";
    self.placeholder.textColor=[UIColor grayColor];
    [_scrollview addSubview:_placeholder];

    
    _btnsearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnsearch setFrame:CGRectMake(15,10,350,35)];
    [_btnsearch setBackgroundImage:[UIImage imageNamed:@"矩形"] forState:UIControlStateNormal];
    [self addSubview:_btnsearch];
    
    _imagesearch=[[UIImageView alloc] init];
    _imagesearch.frame=CGRectMake(25,15,26,26);
    _imagesearch.image=[UIImage imageNamed:@"图标 2"];
    [self addSubview:_imagesearch];
    
    _imagesearch2=[[UIImageView alloc] init];
    _imagesearch2.frame=CGRectMake(320,15,26,26);
    _imagesearch2.image=[UIImage imageNamed:@"图标"];
    [self addSubview:_imagesearch2];
    
}




@end
