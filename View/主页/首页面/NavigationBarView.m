//
//  NavigationBarView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "NavigationBarView.h"

@implementation NavigationBarView

- (void)SetNavigationBar{
    
    self.frame=CGRectMake(0, 0, 390, 96);
    self.backgroundColor=[UIColor orangeColor];
    
    self.attention=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.attention setFrame:CGRectMake(125, 60, 55, 25)];
    [self.attention setTitle:@"关注" forState:UIControlStateNormal];
    [self.attention setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.attention];
    
    self.my=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.my setFrame:CGRectMake(210, 60, 55, 25)];
    [self.my setTitle:@"我的" forState:UIControlStateNormal];
    [self.my setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.my];
    
    self.post = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.post setFrame:CGRectMake(355, 60, 30, 30)];
    [self.post setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self addSubview:self.post];
    
    
}


@end
