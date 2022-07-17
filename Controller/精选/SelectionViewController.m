//
//  SelectionViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "SelectionViewController.h"

@interface SelectionViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**加载View*/
    _selectionview=[[SelectionView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [_selectionview tableinit];
    _selectionview.tableview.delegate=self;
    _selectionview.tableview.dataSource=self;
    [self.view addSubview:_selectionview];

    //[self SetNetworkDataAndpage:1];

}


//加载数据   按照点赞数降序排列
//- (void)SetNetworkDataAndpage:(int)page{
//    self.networkdata=[[NetworkData alloc] init];
//    __weak typeof(self) weakSelf = self;
//    [self.networkdata LoadListDataBlock:^(NSArray<GetListItem *> * _Nonnull dataArray) {
//        __strong typeof(weakSelf) strongSelf = weakSelf; //防止Block循环引用
//        Singleton *single=[[Singleton alloc] init];
//        single.HomeArray=(NSMutableArray *)dataArray;
//        [strongSelf.selectionview.tableview reloadData];
//
//        GetListItem *item1=[[GetListItem alloc] init];
//        GetListItem *item2=[[GetListItem alloc] init];
//        for(NSUInteger i=0;i<single.HomeArray.count-1;i++)
//            for(NSUInteger k=1;k<single.HomeArray.count-i;k++){
//                item1=(GetListItem *)single.HomeArray[i];
//                item2=(GetListItem *)single.HomeArray[k+i];
//
//                if(item1.attitudes_count<item2.attitudes_count){
//                    NSDictionary *dic=single.HomeArray[i];
//                    single.HomeArray[i]=single.HomeArray[k+i];
//                    single.HomeArray[k+i]=dic;
//                }
//            }
//        NSLog(@"");
//    } andpage:page];
//
//}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 //   [self SetNetworkDataAndpage:1];
}



//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Singleton *single=[[Singleton alloc] init];
    return single.HomeArray.count;

}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
        [self.homecell HomelayoutTableViewCellWithItem:[single.HomeArray objectAtIndex:indexPath.row]];
        return self.homecell.HomeCellHeight;


}

//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    NSLog(@"");
        static NSString *ID=@"";
        self.homecell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!self.homecell){
            self.homecell=[[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        [self.homecell HomelayoutTableViewCellWithItem:(GetListItem *)[single.HomeArray objectAtIndex:indexPath.row]];
        return self.homecell;

}


////点击cell进入微博内容
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    WeiboViewController *weibo=[[WeiboViewController alloc] init];
//    [self.navigationController pushViewController:weibo animated:YES];
//    //self.navigationController.navigationBarHidden=NO;
//
//    Singleton *single=[[Singleton alloc] init];
//
//    single.WeiboDictionary=[single.HomeArray objectAtIndex:indexPath.row];
//
//    [single.HistoryArray addObject:[single.HomeArray objectAtIndex:indexPath.row]];
//
//    GetListItem *list=[[GetListItem alloc] init];
//    list=(GetListItem *)single.WeiboDictionary;
//
//}







@end
