//
//  HistoryViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    /**加载View*/
    _historyview=[[HistoryView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [_historyview tableinit];
    [self.view addSubview:_historyview];
    _historyview.tableview.delegate=self;
    _historyview.tableview.dataSource=self;


}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 2;
    Singleton *single=[[Singleton alloc] init];
    return single.HistoryArray.count;
    
}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Singleton *single=[[Singleton alloc] init];
    [self.listcell ListlayoutTableViewCellWithItem:[single.HistoryArray objectAtIndex:single.HistoryArray.count-indexPath.row-1]];
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
        [self.listcell ListlayoutTableViewCellWithItem:[single.HistoryArray objectAtIndex:single.HistoryArray.count-indexPath.row-1]];
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
