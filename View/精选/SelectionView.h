//
//  SelectionView.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectionView : UIView

@property(nonatomic,strong)UITableView *HotTableView; //热门
@property(nonatomic,strong)UITableView *RecreationTableView;//娱乐
@property(nonatomic,strong)UITableView *EmotionTableView;//情感
@property(nonatomic,strong)UITableView *TravelTableView;//运动
@property(nonatomic,strong)UITableView *CartoonTableView;//动漫


@property(nonatomic,strong)UIPageControl *Page;
@property(nonatomic)NSInteger currentPage;//当前页码

 
@property(strong,nonatomic)UILabel *placeholder;

@property(nonatomic,strong)UIScrollView *scrollview;

@property(nonatomic,strong)UITextField *searchview;

-(void)tableinit;

@end

NS_ASSUME_NONNULL_END
