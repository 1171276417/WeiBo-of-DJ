//
//  PostCommentView.m
//  微博4.0
//
//  Created by 邓杰 on 2022/7/17.
//

#import "PostCommentView.h"

@implementation PostCommentView

- (void)LoadPoatTextField{
    
    self.backgroundColor=[UIColor whiteColor];
    
    self.text=[[UITextView alloc] initWithFrame:CGRectMake(10, 50, [UIScreen mainScreen].bounds.size.width - 20, 400)];
    self.text.font = [UIFont systemFontOfSize:20];
    self.text.textAlignment = NSTextAlignmentLeft;
    self.text.showsHorizontalScrollIndicator=NO;
    self.text.showsVerticalScrollIndicator=NO;
    [self addSubview:_text];
    
    self.placeholder=[[UILabel alloc] initWithFrame:CGRectMake(20, 57, 200, 30)];
    self.placeholder.font = [UIFont systemFontOfSize:20];
    self.placeholder.text=@"发表评论...";
    self.placeholder.textColor=[UIColor grayColor];
    [self addSubview:_placeholder];

}

@end
