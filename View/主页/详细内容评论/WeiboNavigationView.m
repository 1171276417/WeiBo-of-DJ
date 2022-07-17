//
//  WeiboNavigationView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/21.
//

#import "WeiboNavigationView.h"

@implementation WeiboNavigationView

- (void)SetPostNavigationBar{
    
    self.frame=CGRectMake(0, 0, 390, 96);
    self.backgroundColor=[UIColor orangeColor];
    
    self.back=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.back setFrame:CGRectMake(15, 55, 30, 30)];
    [self.back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self addSubview:self.back];
    
    self.collect = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.collect setFrame:CGRectMake(350, 55, 30, 30)];
    [self.collect setBackgroundImage:[UIImage imageNamed:@"dislike"] forState:UIControlStateNormal];
    [self addSubview:self.collect];
    
    self.title=[[UILabel alloc] initWithFrame:CGRectMake(165, 60, 100, 20)];
    self.title.font = [UIFont systemFontOfSize:18];
    self.title.text=@"微博详情";
    self.title.textColor=[UIColor blackColor];
    [self addSubview:self.title];
    
    
}
@end
