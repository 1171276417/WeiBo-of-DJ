//
//  MyViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "MyViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**加载View*/
    _myview=[[MyView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [_myview tableinit];
    [self.view addSubview:_myview];
    _myview.tableview.delegate=self;
    _myview.tableview.dataSource=self;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

//设置宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.textLabel.text=@"浏览历史";
        cell.detailTextLabel.text=@"123";
        return cell;
    }
    else{
        UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.textLabel.text=@"收藏";
        cell.detailTextLabel.text=@"123";
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        HistoryViewController *history=[[HistoryViewController alloc] init];
        [self.navigationController pushViewController:history animated:YES];
    }
    else{
    CollectionViewController *collect=[[CollectionViewController alloc] init];
    [self.navigationController pushViewController:collect animated:YES];
    }
    
}


@end
