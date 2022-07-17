//
//  CollectionViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    /**加载View*/
    _collectionview=[[CollectionView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [_collectionview tableinit];
    [self.view addSubview:_collectionview];
    _collectionview.tableview.delegate=self;
    _collectionview.tableview.dataSource=self;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 2;
    Singleton *single=[[Singleton alloc] init];
    return single.CollectArray.count;
    
}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    [self.listcell ListlayoutTableViewCellWithItem:[single.CollectArray objectAtIndex:single.CollectArray.count-indexPath.row-1]];
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
        [self.listcell ListlayoutTableViewCellWithItem:[single.CollectArray objectAtIndex:indexPath.row]];
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
