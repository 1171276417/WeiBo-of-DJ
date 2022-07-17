//
//  WeiboView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "WeiboView.h"

@implementation WeiboView

-(void)tableinit{
    
    self.backgroundColor=[UIColor whiteColor];
    _tableview=[[UITableView alloc] initWithFrame:self.bounds];
    
    [self addSubview:_tableview];
    
}

@end
