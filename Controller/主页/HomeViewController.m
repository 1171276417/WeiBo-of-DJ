//
//  HomeViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIScrollViewDelegate>

@end

@implementation HomeViewController

extern int page = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    /**加载View*/
    _homeview=[[HomeView alloc] initWithFrame:CGRectMake(0,96, self.view.frame.size.width*2, self.view.frame.size.height-96)];
    [_homeview tableinit];
    _homeview.hometableview.delegate=self;
    _homeview.hometableview.dataSource=self;
    _homeview.mytableview.delegate=self;
    _homeview.mytableview.dataSource=self;
    _homeview.searchview.delegate=self;
    [self.view addSubview:_homeview];
    
    /**加载NavigationBar*/
    _navView=[[NavigationBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 96)];
    [_navView SetNavigationBar];
    [self.view addSubview:_navView];
    [self.navView.post addTarget:self action:@selector(post)  forControlEvents:UIControlEventTouchUpInside];
    [self.homeview.btnsearch addTarget:self action:@selector(search)  forControlEvents:UIControlEventTouchUpInside];

    //定时刷新 180s刷新一次
    __unused NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:360 target:self selector:@selector(LoadupData) userInfo:nil repeats:YES];
     
    //加载下拉刷新控件
    self.homeview.hometableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(LoadupData)];
    //上拉加载
    self.homeview.hometableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(Loadmore)];
        

}
- (void)search{
    SearchViewController *search=[[SearchViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];

}

- (void)LoadupData{
    [self SetNetworkDataAndpage:1];//重载数据
    [self.homeview.hometableview.mj_header endRefreshing];    //结束刷新
}

- (void)Loadmore{
    Singleton *single = [[Singleton alloc] init];
    NSMutableArray *array = @[].mutableCopy;
    array = single.HomeArray.mutableCopy;
    page++;
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single=[[Singleton alloc] init];
        single.HomeArray = (NSMutableArray *)dataArray;
        [array addObjectsFromArray:single.HomeArray];
        single.HomeArray = array;
        [strongSelf.homeview.hometableview reloadData];
    } andpage:page];
}

//加载数据
- (void)SetNetworkDataAndpage:(int)page{
    self.networkdata=[[NetworkData alloc] init];
    _homearr=[[NSMutableArray alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.networkdata LoadListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single=[[Singleton alloc] init];
        strongSelf.self.homearr=(NSMutableArray *)dataArray;
        single.HomeArray=(NSMutableArray *)dataArray;
        [strongSelf.homeview.hometableview reloadData];
        NSLog(@"");
    } andpage:page];
    
}

//发表微博
- (void)post{
    PostViewController *post=[[PostViewController alloc] init];
    [self.navigationController pushViewController:post animated:YES];

}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    [self.homeview.mytableview reloadData];
    Singleton *single=[[Singleton alloc] init];
    if(single.PostArray.count){
        self.homeview.placeholder.hidden=YES;
    }
    //加载视图时候重新加载数据
    [self SetNetworkDataAndpage:1];

    
    id item = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/dengjie/Desktop/微博数据持久化/Weibo.txt"];
    single.HistoryArray = (GetListItem *)item;
    
    
}


//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Singleton *single=[[Singleton alloc] init];
    if(tableView==_homeview.hometableview){
    return single.HomeArray.count;
    }
    else{
        return single.PostArray.count;
    }
}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    if(tableView==_homeview.hometableview){
//        [self.homecell HomelayoutTableViewCellWithItem:[single.HomeArray objectAtIndex:indexPath.row]];
//        return self.homecell.HomeCellHeight;
//        return [self.homeview.hometableview cellHeightForIndexPath:indexPath model:(GetListItem *)single.HomeArray[indexPath.row] keyPath:@"model" cellClass:[CommentTableViewCell class] contentViewWidth:390];
        return [self.homeview.hometableview cellHeightForIndexPath:indexPath model:(GetListItem *)single.HomeArray[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.bounds.size.width];

        
    }
    else{
        [self.postcell PostlayoutCell:[single.PostArray objectAtIndex:indexPath.row]];
        return self.postcell.PostCellHeight;
    }
    
}

//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    NSLog(@"");
    if(tableView==_homeview.hometableview){
//        static NSString *ID=@"";
//        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
//
//        if(self.homecell==nil){
//            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        }
//        else{
//            while ([self.homecell.contentView.subviews lastObject]!=nil) {
//              [(UIView*)[self.homecell.contentView.subviews lastObject] removeFromSuperview];//强制装换为UIView类型 ，移除所有子视图
//                [self.homecell.contentView addSubview:self.homecell2];
//            }
//        }
//        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.HomeArray objectAtIndex:indexPath.row]];
//        return self.homecell;
//
        
        static NSString *CellIdentifier = @"Cell";
        self.homecell = [tableView cellForRowAtIndexPath:indexPath]; //根据indexPath准确地取出一行，而不是从cell重用队列中取出
        if (self.homecell == nil) {
        self.homecell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.HomeArray objectAtIndex:indexPath.row]];
        return self.homecell;



        
        
        
        
        
        
        
        
        
    }
            

    else{
        NSString *Id=@"123";
        self.postcell=[tableView dequeueReusableCellWithIdentifier:Id];
        if(!self.postcell){
            self.postcell=[[PostTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
        }
        [self.postcell PostlayoutCell:(PostListItem *)[single.PostArray objectAtIndex:indexPath.row]];
        return self.postcell;
    }
}


//点击cell进入微博内容
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeiboViewController *weibo=[[WeiboViewController alloc] init];
    [self.navigationController pushViewController:weibo animated:YES];

    Singleton *single=[[Singleton alloc] init];
    
    single.WeiboDictionary=[single.HomeArray objectAtIndex:indexPath.row];
    
    [single.HistoryArray insertObject:[single.HomeArray objectAtIndex:indexPath.row] atIndex:0];

    
    
  

}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"x=%f,y=%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

@end
