//
//  PostNavigationView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "PostNavigationView.h"

@implementation PostNavigationView

- (void)SetPostNavigationBar{
    
    self.frame=CGRectMake(0, 0, 390, 96);
    self.backgroundColor=[UIColor orangeColor];
    
    self.back=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.back setFrame:CGRectMake(15, 55, 30, 30)];
    [self.back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self addSubview:self.back];
    
    self.post = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.post setFrame:CGRectMake(355, 55, 30, 30)];
    [self.post setBackgroundImage:[UIImage imageNamed:@"发送"] forState:UIControlStateNormal];
    [self addSubview:self.post];
    
    self.title=[[UILabel alloc] initWithFrame:CGRectMake(165, 60, 100, 20)];
    self.title.font = [UIFont systemFontOfSize:18];
    self.title.text=@"发微博";
    self.title.textColor=[UIColor blackColor];
    [self addSubview:self.title];
    
    
}

@end
