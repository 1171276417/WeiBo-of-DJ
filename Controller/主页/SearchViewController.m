//
//  SearchViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/21.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**加载View*/
    _searchview=[[SearchView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [_searchview tableinit];
    _searchview.tableview.delegate=self;
    _searchview.tableview.dataSource=self;
    self.searchController.searchBar.delegate = self;
    [self.view addSubview:_searchview];
    
    //创建搜索控制器
    self.searchController=[[UISearchController alloc] initWithSearchResultsController:nil];
    //搜索栏设为表头
    _searchview.tableview.tableHeaderView=self.searchController.searchBar;
    //监听输入
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(import) name:UITextFieldTextDidChangeNotification object:self.searchController.textInputContextIdentifier];
    
    self.navigationItem.title=@"搜索";
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}




//搜索的函数
- (void)import{
     
    Singleton *single=[[Singleton alloc] init];
    single.SearchArray=[[NSMutableArray alloc] init];
    NSArray *result = [[NSArray alloc] init];
    NSString *str = [self.searchController.searchBar text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@",str];
    result = [(NSMutableArray *)single.HomeArray filteredArrayUsingPredicate:predicate];
    NSMutableArray *arr = [result mutableCopy];
    NSLog(@"");

    
    
    
    
    //对每一个text进行比较
    for(NSUInteger i=0;i<single.HomeArray.count;i++){
        _list=(GetListItem *)single.HomeArray[i]; //模型化每一条微博的信息
        NSString *text = [[NSString alloc] init];
        NSString *text1 = [[NSString alloc] init];
//        text = _list.text;
//        text1 = [self.searchController.searchBar text];
//        NSPredicate *predicate = [NSPredicate  predicateWithFormat:@"text CONTAINS[cd] text1"];
//        NSDictionary *dict = [[NSDictionary alloc] init];
//        dict = [text ]
        

//        //将字符串的每一个字符存入数组中
//        NSMutableArray *array = [[NSMutableArray alloc] init];
//        NSUInteger len = [_list.text length];//当条微博的内容长度
//        /**对所有组合进行比较*/
//        for(NSUInteger j=1;j<=len;j++)
//            for(NSUInteger k=0;k<=len-j;k++){
//                NSRange range=NSMakeRange(k, j);
//                NSString *String=[_list.text substringWithRange:range];
//                [array addObject:String];
//            }
//        NSUInteger count=array.count;
//        for(NSUInteger m=0;m<count;m++){
//            if([[self.searchController.searchBar text] compare:array[m]]==NSOrderedSame){
//                BOOL whether=NO;
//                if(single.SearchArray.count!=0){
//                    for(NSUInteger n=0;n<single.SearchArray.count;n++){//single.HomeArray[i]==single.CollectArray[n]
//                        if([single.HomeArray[i] isEqual:single.SearchArray[n]]!=1){
//                            whether=YES;continue;
//                        }
//                    }
//                }
//                if(single.SearchArray.count==0){
//                    whether=YES;
//                }
//                if(whether==YES){
//                    [single.SearchArray addObject:single.HomeArray[i]];
//                }continue;
//            }
//        }
    }
    [self.searchview.tableview reloadData];
    
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Singleton *single=[[Singleton alloc] init];
    return single.SearchArray.count;
    
}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    [self.listcell ListlayoutTableViewCellWithItem:[single.SearchArray objectAtIndex:single.SearchArray.count-indexPath.row-1]];
    return self.listcell.ListCellHeight;
    }

//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"";
    Singleton *single=[[Singleton alloc] init];
    self.listcell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!self.listcell){
        self.listcell=[[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
        [self.listcell ListlayoutTableViewCellWithItem:[single.SearchArray objectAtIndex:indexPath.row]];
    return self.listcell;
}

//点击cell进入微博内容
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeiboViewController *weibo=[[WeiboViewController alloc] init];
    [self.navigationController pushViewController:weibo animated:YES];
    self.navigationController.navigationBarHidden=YES;

    Singleton *single=[[Singleton alloc] init];
    
    single.WeiboDictionary=[single.HomeArray objectAtIndex:indexPath.row];
    
    [single.HistoryArray insertObject:[single.HomeArray objectAtIndex:indexPath.row] atIndex:0];

}
    
    
    







@end
