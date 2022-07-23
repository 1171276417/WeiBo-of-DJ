//
//  SelectionNavigationView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/7/23.
//

#import "SelectionNavigationView.h"

@implementation SelectionNavigationView

- (void)SetNavigationBar{
    
    self.frame=CGRectMake(0, 0, 390, 96);
    self.backgroundColor=[UIColor whiteColor];
    
    self.btnHot=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnHot setFrame:CGRectMake(10, 50, 50, 25)];
    [self.btnHot setTitle:@"热门" forState:UIControlStateNormal];
    [self.btnHot setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.btnHot];
    self.slide1 = [[UIView alloc] initWithFrame:CGRectMake(19, 75, 30, 5)];
    self.slide1.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.slide1];
    
    
    self.btnRecreation=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnRecreation setFrame:CGRectMake(97, 50, 50, 25)];
    [self.btnRecreation setTitle:@"娱乐" forState:UIControlStateNormal];
    [self.btnRecreation setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.btnRecreation];
    self.slide2 = [[UIView alloc] initWithFrame:CGRectMake(106, 75, 30, 5)];
    self.slide2.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.slide2];
    
    
    self.btnEmotion = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnEmotion setFrame:CGRectMake(174, 50, 50, 25)];
    [self.btnEmotion setTitle:@"情感" forState:UIControlStateNormal];
    [self.btnEmotion setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.btnEmotion];
    self.slide3 = [[UIView alloc] initWithFrame:CGRectMake(183, 75, 30, 5)];
    self.slide3.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.slide3];
    
    
    self.btnTravel = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnTravel setFrame:CGRectMake(251, 50, 50, 25)];
    [self.btnTravel setTitle:@"旅行" forState:UIControlStateNormal];
    [self.btnTravel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.btnTravel];
    self.slide4 = [[UIView alloc] initWithFrame:CGRectMake(260, 75, 30, 5)];
    self.slide4.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.slide4];
    
    
    self.btnCartoon = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnCartoon setFrame:CGRectMake(328, 50, 50, 25)];
    [self.btnCartoon setTitle:@"动漫" forState:UIControlStateNormal];
    [self.btnCartoon setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.btnCartoon];
    self.slide5 = [[UIView alloc] initWithFrame:CGRectMake(337, 75, 30, 5)];
    self.slide5.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.slide5];
    
    
}

@end
