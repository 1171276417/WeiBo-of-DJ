//
//  WeiboNavigationView.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeiboNavigationView : UIView

@property(nonatomic,strong)UIButton *back;
@property(nonatomic,strong)UIButton *collect;
@property(nonatomic,strong)UILabel *title;

- (void)SetPostNavigationBar;

@end

NS_ASSUME_NONNULL_END
