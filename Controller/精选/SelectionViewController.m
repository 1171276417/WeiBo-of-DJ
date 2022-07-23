//
//  SelectionViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "SelectionViewController.h"
#import "BNDeepCopy.h"

@interface SelectionViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIScrollViewDelegate>

@end

@implementation SelectionViewController

extern int pager = 0;

- (void)viewDidLoad {
    [super viewDidLoad];

    /**加载View*/
    _selectionview=[[SelectionView alloc] initWithFrame:CGRectMake(0,88, self.view.frame.size.width, self.view.frame.size.height-88)];
    [_selectionview tableinit];
    _selectionview.HotTableView.delegate = self;
    _selectionview.HotTableView.dataSource = self;
    
    _selectionview.RecreationTableView.delegate = self;
    _selectionview.RecreationTableView.dataSource = self;
    
    _selectionview.EmotionTableView.delegate = self;
    _selectionview.EmotionTableView.dataSource = self;
    
    _selectionview.TravelTableView.delegate = self;
    _selectionview.TravelTableView.dataSource = self;
    
    _selectionview.CartoonTableView.delegate = self;
    _selectionview.CartoonTableView.dataSource = self;
    
    _selectionview.scrollview.delegate = self;
    [self.view addSubview:_selectionview];
    
    [_selectionview.Page setCurrentPage:0];
    
    /**加载NavigationBar*/
    _navView=[[SelectionNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 96)];
    [_navView SetNavigationBar];
    [self.view addSubview:_navView];
    [self.navView.btnHot addTarget:self action:@selector(btnHot)  forControlEvents:UIControlEventTouchUpInside];
    [self.navView.btnRecreation addTarget:self action:@selector(btnRecreation)  forControlEvents:UIControlEventTouchUpInside];
    [self.navView.btnEmotion addTarget:self action:@selector(btnEmotion)  forControlEvents:UIControlEventTouchUpInside];
    [self.navView.btnTravel addTarget:self action:@selector(btnTravel)  forControlEvents:UIControlEventTouchUpInside];
    [self.navView.btnCartoon addTarget:self action:@selector(btnCartoon)  forControlEvents:UIControlEventTouchUpInside];

    
    
    //加载下拉刷新控件
    self.selectionview.HotTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(LoadupData)];
    //上拉加载
    self.selectionview.HotTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(Loadmore)];
}

- (void)LoadupData{
    [self SetNetworkAndURLHot:@"https://weibo.com/ajax/feed/hottimeline?since_id=0&group_id=102803&containerid=102803&extparam=discover%7Cnew_feed&max_id=0&count=10"  andPage:0];//重载数据
    [self.selectionview.HotTableView.mj_header endRefreshing];    //结束刷新
}

- (void)Loadmore{
    Singleton *single = [[Singleton alloc] init];
    NSMutableArray *array = @[].mutableCopy;
   array = single.HotArray.mutableCopy;
        
    pager++;
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadSelectionListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single=[[Singleton alloc] init];
        single.HotArray = (NSMutableArray *)dataArray;
        [array addObjectsFromArray:single.HotArray];
        single.HotArray = array;
        [strongSelf.selectionview.HotTableView reloadData];
    } URL:@"https://weibo.com/ajax/feed/hottimeline?since_id=0&group_id=102803&containerid=102803&extparam=discover%7Cnew_feed&max_id=0&count=10" andPage:pager];
}

- (void)btnHot{
    self.selectionview.scrollview.contentOffset = CGPointMake(0, 0);
    self.navView.slide1.backgroundColor = [UIColor orangeColor];
    self.navView.slide2.backgroundColor = [UIColor whiteColor];
    self.navView.slide3.backgroundColor = [UIColor whiteColor];
    self.navView.slide4.backgroundColor = [UIColor whiteColor];
    self.navView.slide5.backgroundColor = [UIColor whiteColor];
}
- (void)btnRecreation{
    self.selectionview.scrollview.contentOffset = CGPointMake(390, 0);
    self.navView.slide1.backgroundColor = [UIColor whiteColor];
    self.navView.slide2.backgroundColor = [UIColor orangeColor];
    self.navView.slide3.backgroundColor = [UIColor whiteColor];
    self.navView.slide4.backgroundColor = [UIColor whiteColor];
    self.navView.slide5.backgroundColor = [UIColor whiteColor];
    
}
- (void)btnEmotion{
    self.selectionview.scrollview.contentOffset = CGPointMake(390*2, 0);
    self.navView.slide1.backgroundColor = [UIColor whiteColor];
    self.navView.slide2.backgroundColor = [UIColor whiteColor];
    self.navView.slide3.backgroundColor = [UIColor orangeColor];
    self.navView.slide4.backgroundColor = [UIColor whiteColor];
    self.navView.slide5.backgroundColor = [UIColor whiteColor];
}
- (void)btnTravel{
    self.selectionview.scrollview.contentOffset = CGPointMake(390*3, 0);
    self.navView.slide1.backgroundColor = [UIColor whiteColor];
    self.navView.slide2.backgroundColor = [UIColor whiteColor];
    self.navView.slide3.backgroundColor = [UIColor whiteColor];
    self.navView.slide4.backgroundColor = [UIColor orangeColor];
    self.navView.slide5.backgroundColor = [UIColor whiteColor];
}
- (void)btnCartoon{
    self.selectionview.scrollview.contentOffset = CGPointMake(390*4, 0);
    self.navView.slide1.backgroundColor = [UIColor whiteColor];
    self.navView.slide2.backgroundColor = [UIColor whiteColor];
    self.navView.slide3.backgroundColor = [UIColor whiteColor];
    self.navView.slide4.backgroundColor = [UIColor whiteColor];
    self.navView.slide5.backgroundColor = [UIColor orangeColor];
}




- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self SetNetworkAndURLHot:@"https://weibo.com/ajax/feed/hottimeline?since_id=0&group_id=102803&containerid=102803&extparam=discover%7Cnew_feed&max_id=0&count=10" andPage:pager];
    [self SetNetworkAndURLRecreation:@"https://weibo.com/ajax/feed/hottimeline?since_id=0&group_id=1028034288&containerid=102803_ctg1_4288_-_ctg1_4288&extparam=discover%7Cnew_feed&max_id=0&count=10" andPage:pager];
    [self SetNetworkAndURLEmotion:@"https://weibo.com/ajax/feed/hottimeline?since_id=0&group_id=1028031988&containerid=102803_ctg1_1988_-_ctg1_1988&extparam=discover%7Cnew_feed&max_id=0&count=10" andPage:pager];
    [self SetNetworkAndURLTravel:@"https://weibo.com/ajax/feed/hottimeline?since_id=0&group_id=1028032588&containerid=102803_ctg1_2588_-_ctg1_2588&extparam=discover%7Cnew_feed&max_id=0&count=10" andPage:pager];
    [self SetNetworkAndURLCartoon:@"https://weibo.com/ajax/feed/hottimeline?since_id=0&group_id=1028032388&containerid=102803_ctg1_2388_-_ctg1_2388&extparam=discover%7Cnew_feed&max_id=0&count=10" andPage:pager];
    self.tabBarController.tabBar.hidden = NO;
}


//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Singleton *single=[[Singleton alloc] init];
    if(tableView == _selectionview.HotTableView){
        return single.HotArray.count;
    }
    if(tableView == _selectionview.RecreationTableView){
        return single.RecreationArray.count;
    }
    if(tableView == _selectionview.EmotionTableView){
        return single.EmotionArray.count;
    }
    if(tableView == _selectionview.TravelTableView){
        return single.TravelArray.count;
    }
    if(tableView == _selectionview.CartoonTableView){
        return single.CartoonArray.count;
    }
    else
        return 0;

}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
 
    if(tableView == _selectionview.HotTableView){
        return [self.selectionview.HotTableView cellHeightForIndexPath:indexPath model:(GetListItem *)single.HotArray[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.bounds.size.width];
    }
    if(tableView == _selectionview.RecreationTableView){
        return [self.selectionview.RecreationTableView cellHeightForIndexPath:indexPath model:(GetListItem *)single.RecreationArray[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.bounds.size.width];
    }
    if(tableView == _selectionview.EmotionTableView){
        return [self.selectionview.EmotionTableView cellHeightForIndexPath:indexPath model:(GetListItem *)single.EmotionArray[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.bounds.size.width];
    }
    if(tableView == _selectionview.TravelTableView){
        return [self.selectionview.TravelTableView cellHeightForIndexPath:indexPath model:(GetListItem *)single.TravelArray[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.bounds.size.width];
    }
    if(tableView == _selectionview.CartoonTableView){
        return [self.selectionview.CartoonTableView cellHeightForIndexPath:indexPath model:(GetListItem *)single.CartoonArray[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.bounds.size.width];
    }
    else
        return 0;
}

////设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];

    if(tableView == _selectionview.HotTableView){
        static NSString *ID=@"";
        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!self.homecell){
            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.HotArray objectAtIndex:indexPath.row]];
        return self.homecell;
    }
    if(tableView == _selectionview.RecreationTableView){
        static NSString *ID=@"";
        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!self.homecell){
            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        NSLog(@"");
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.RecreationArray objectAtIndex:indexPath.row]];
        return self.homecell;
    }
    if(tableView == _selectionview.EmotionTableView){
        static NSString *ID=@"";
        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!self.homecell){
            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.EmotionArray objectAtIndex:indexPath.row]];
        return self.homecell;
    }
    if(tableView == _selectionview.TravelTableView){
        static NSString *ID=@"";
        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!self.homecell){
            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.TravelArray objectAtIndex:indexPath.row]];
        return self.homecell;
    }
    if(tableView == _selectionview.CartoonTableView){
        static NSString *ID=@"";
        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!self.homecell){
            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.CartoonArray objectAtIndex:indexPath.row]];
        return self.homecell;
    }
    else
        return 0;
}


////点击cell进入微博内容
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];

    GetListItem *list=[[GetListItem alloc] init];
    list=(GetListItem *)single.WeiboDictionary;
    
    if(tableView == _selectionview.HotTableView){
        WeiboViewController *weibo=[[WeiboViewController alloc] init];
        single.WeiboDictionary=[single.HotArray objectAtIndex:indexPath.row];
        [single.HistoryArray addObject:[single.HotArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:weibo animated:YES];
        NSLog(@"");
    }
    if(tableView == _selectionview.RecreationTableView){
        WeiboViewController *weibo=[[WeiboViewController alloc] init];
        single.WeiboDictionary=[single.RecreationArray objectAtIndex:indexPath.row];
        [single.HistoryArray addObject:[single.RecreationArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:weibo animated:YES];
    }
    if(tableView == _selectionview.EmotionTableView){
        WeiboViewController *weibo=[[WeiboViewController alloc] init];
        single.WeiboDictionary=[single.EmotionArray objectAtIndex:indexPath.row];
        [single.HistoryArray addObject:[single.EmotionArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:weibo animated:YES];
    }
    if(tableView == _selectionview.TravelTableView){
        WeiboViewController *weibo=[[WeiboViewController alloc] init];
        single.WeiboDictionary=[single.TravelArray objectAtIndex:indexPath.row];
        [single.HistoryArray addObject:[single.TravelArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:weibo animated:YES];
    }
    if(tableView == _selectionview.CartoonTableView){
        WeiboViewController *weibo=[[WeiboViewController alloc] init];
        single.WeiboDictionary=[single.CartoonArray objectAtIndex:indexPath.row];
        [single.HistoryArray addObject:[single.CartoonArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:weibo animated:YES];
    }
}


- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"x=%f,y=%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

- (void)SetNetworkAndURLHot:(NSString *)URL andPage:(int)page{
    self.networkdata=[[NetworkData alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadSelectionListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single = [[Singleton alloc] init];
        single.HotArray = (NSMutableArray *)dataArray;
        [strongSelf.selectionview.HotTableView reloadData];
    } URL:URL andPage:page];
}

- (void)SetNetworkAndURLRecreation:(NSString *)URL andPage:(int)page{
    self.networkdata=[[NetworkData alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadSelectionListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single = [[Singleton alloc] init];
        single.RecreationArray = (NSMutableArray *)dataArray;
        [strongSelf.selectionview.RecreationTableView reloadData];
    } URL:URL andPage:page];
}

- (void)SetNetworkAndURLEmotion:(NSString *)URL andPage:(int)page{
    self.networkdata=[[NetworkData alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadSelectionListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single = [[Singleton alloc] init];
        single.EmotionArray = (NSMutableArray *)dataArray;
        [strongSelf.selectionview.EmotionTableView reloadData];
    } URL:URL andPage:page];
}

- (void)SetNetworkAndURLTravel:(NSString *)URL andPage:(int)page{
    self.networkdata=[[NetworkData alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadSelectionListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single = [[Singleton alloc] init];
        single.TravelArray = (NSMutableArray *)dataArray;
        [strongSelf.selectionview.TravelTableView reloadData];
    } URL:URL andPage:page];
}

- (void)SetNetworkAndURLCartoon:(NSString *)URL andPage:(int)page{
    self.networkdata=[[NetworkData alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadSelectionListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single = [[Singleton alloc] init];
        single.CartoonArray = (NSMutableArray *)dataArray;
        [strongSelf.selectionview.CartoonTableView reloadData];
    } URL:URL andPage:page];
}


@end
