//
//  SelectionView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "SelectionView.h"

@implementation SelectionView

-(void)tableinit{
    
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.frame = CGRectMake(0, 0, 390, self.bounds.size.height);
    _scrollview.contentSize = CGSizeMake(390*5, 0);
    [self addSubview:_scrollview];
    _scrollview.pagingEnabled = YES;
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.showsVerticalScrollIndicator = NO;
    _scrollview.bounces = YES;
    
    //分页
    _Page = [[UIPageControl alloc] initWithFrame:CGRectMake(10, self.bounds.size.height-200 , self.bounds.size.width-20, 100)];
    [_Page setNumberOfPages:5];
    [_Page setCurrentPage:0];
    [self addSubview:_Page];
    
    
    
    
        //  热门微博
        _HotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 390, self.frame.size.height)];
        _HotTableView.backgroundColor = [UIColor grayColor];
        [_scrollview addSubview:_HotTableView];
        //热门微博
        _RecreationTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, 390, self.frame.size.height)];
        _RecreationTableView.backgroundColor = [UIColor grayColor];

        [_scrollview addSubview:_RecreationTableView];
        //热门微博
        _EmotionTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width*2, 0, 390, self.frame.size.height)];
        _EmotionTableView.backgroundColor = [UIColor grayColor];

        [_scrollview addSubview:_EmotionTableView];
        //热门微博
        _TravelTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width*3, 0, 390, self.frame.size.height)];
        [_scrollview addSubview:_TravelTableView];
        //热门微博
        _CartoonTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width*4, 0, self.frame.size.width, self.frame.size.height)];
        _CartoonTableView.backgroundColor = [UIColor grayColor];
        [_scrollview addSubview:_CartoonTableView];
    
    
    
    
    

//    
//    
//    //热门微博
//    _HotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 390, self.frame.size.height)];
//    _HotTableView.backgroundColor = [UIColor grayColor];
//    [_scrollview addSubview:_HotTableView];
//    //热门微博
//    _RecreationTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, 390, self.frame.size.height)];
//    [_scrollview addSubview:_RecreationTableView];
//    //热门微博
//    _EmotionTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width*2, 0, 390, self.frame.size.height)];
//    [_scrollview addSubview:_EmotionTableView];
//    //热门微博
//    _SportsTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width*3, 0, 390, self.frame.size.height)];
//    [_scrollview addSubview:_SportsTableView];
//    //热门微博
//    _CartoonTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width*4, 0, self.frame.size.width, self.frame.size.height)];
//    _CartoonTableView.backgroundColor = [UIColor blueColor];
//    [_scrollview addSubview:_CartoonTableView];
//    
    
    
   

    
   
    
}

@end
