//
//  SearchView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/21.
//

#import "SearchView.h"

@implementation SearchView

-(void)tableinit{
    
    _tableview=[[UITableView alloc] initWithFrame:self.bounds];
    
    [self addSubview:_tableview];
}

@end
