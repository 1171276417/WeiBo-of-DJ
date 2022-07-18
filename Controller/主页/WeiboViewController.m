//
//  WeiboViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "WeiboViewController.h"
#import "SDAutoLayout.h"

@interface WeiboViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**加载View*/
    _weiboview=[[WeiboView alloc] initWithFrame:CGRectMake(0,88, self.view.frame.size.width, self.view.frame.size.height-88)];
    [_weiboview tableinit];
    _weiboview.tableview.delegate=self;
    _weiboview.tableview.dataSource=self;
    [self.view addSubview:_weiboview];
    
    //加载下拉刷新控件
    self.refresh=[[UIRefreshControl alloc] init];
    self.refresh.tintColor=[UIColor grayColor];
    self.refresh.attributedTitle=[[NSAttributedString alloc] initWithString:@"Loading..."];
    [self.refresh addTarget:self action:@selector(LoadupData) forControlEvents:UIControlEventValueChanged];
    self.weiboview.tableview.refreshControl=self.refresh;
    
    /**网页链接*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginURL) name:@"点击进入网址" object:nil];
    /**评论*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logincomment) name:@"评论" object:nil];
    
    
    /**加载NavigationBar*/
    _navView=[[WeiboNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 96)];
    [_navView SetPostNavigationBar];
    [self.view addSubview:_navView];
    [self.navView.back addTarget:self action:@selector(back)  forControlEvents:UIControlEventTouchUpInside];
    [self.navView.collect addTarget:self action:@selector(collect)  forControlEvents:UIControlEventTouchUpInside];
    

    /**加载评论数据*/
    Singleton *single=[[Singleton alloc] init];    //获取点击该cell的信息，转为模型，取得该cell的ID来载入评论
    GetListItem *list=[[GetListItem alloc] init];
    list=(GetListItem *)single.WeiboDictionary;
    [self LoadCommentData:list.ID];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

- (void)loginURL{
    WebViewController *web=[[WebViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];
}

- (void)logincomment{
    PostCommentViewController *comVC = [[PostCommentViewController alloc] init];
    [self.navigationController pushViewController:comVC animated:YES];
}

- (void)collect{
    Singleton *single=[[Singleton alloc] init];
    [single.CollectArray insertObject:single.WeiboDictionary atIndex:0];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    //移除所有通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**加载评论数据*/
- (void)LoadCommentData:(NSNumber *)ID{
    self.CommentData=[[NetworkData alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.CommentData LoadCommentListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
        Singleton *single=[[Singleton alloc] init];
        single.CommentArray=(NSMutableArray *)dataArray;
        [strongSelf.weiboview.tableview reloadData];
        NSLog(@"");
    } andID:ID];
}

/**刷新加载数据*/
- (void)LoadupData{
    Singleton *single=[[Singleton alloc] init];    //获取点击该cell的信息，转为模型，取得该cell的ID来载入评论
    GetListItem *list=[[GetListItem alloc] init];
    list=(GetListItem *)single.WeiboDictionary;
    [self.refresh beginRefreshing];//开始刷新
    [self LoadCommentData:list.ID];//重载数据
    [self.refresh endRefreshing];    //结束刷新
}



//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Singleton *single=[[Singleton alloc] init];
    return single.CommentArray.count+1;
}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    /**第一行是微博内容*/
    if(indexPath.row==0){
//        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)single.WeiboDictionary];

        return [self.weiboview.tableview cellHeightForIndexPath:indexPath model:(GetListItem *)single.HomeArray[indexPath.row] keyPath:@"model" cellClass:[HomeTableViewCell class] contentViewWidth:self.view.bounds.size.width];
    }
    /**后面为评论区*/
    else {
//        [self.commentcell CommentlayoutCell:(GetListItem *)[single.CommentArray objectAtIndex:indexPath.row-1]];
//        return self.commentcell.CommentCellHeight;
        return [self.weiboview.tableview cellHeightForIndexPath:indexPath model:(GetListItem *)single.CommentArray[indexPath.row-1] keyPath:@"model" cellClass:[CommentTableViewCell class] contentViewWidth:390];


    }
}

//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    NSLog(@"");

    if(indexPath.row==0){
        static NSString *ID=@"1";
        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!self.homecell){
            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)single.WeiboDictionary];

        return self.homecell;
    }
    else{
        static NSString *IDD=@"";
        self.commentcell=[tableView dequeueReusableCellWithIdentifier:IDD];
        if(!self.commentcell){
            self.commentcell=[[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDD];
        }
//            [self.commentcell CommentlayoutCell:(GetListItem *)[single.CommentArray objectAtIndex:indexPath.row-1]];
//        return self.commentcell;
        self.commentcell.model = (GetListItem *)single.CommentArray[indexPath.row-1];
        [self.commentcell useCellFrameCacheWithIndexPath:indexPath tableView:self.weiboview.tableview];
        return self.commentcell;
        
        
            
    }
}





@end
