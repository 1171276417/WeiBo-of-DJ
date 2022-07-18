//
//  PostCommentNavigationView.h
//  微博4.0
//
//  Created by 邓杰 on 2022/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostCommentNavigationView : UIView

@property(nonatomic,strong)UIButton *back;
@property(nonatomic,strong)UIButton *post;
@property(nonatomic,strong)UILabel *title;

- (void)SetPostNavigationBar;

@end

NS_ASSUME_NONNULL_END
