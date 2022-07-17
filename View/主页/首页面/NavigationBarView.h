//
//  NavigationBarView.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavigationBarView : UIView

@property(nonatomic,strong)UIButton *attention;
@property(nonatomic,strong)UIButton *my;
@property(nonatomic,strong)UIButton *post;


- (void)SetNavigationBar;

@end

NS_ASSUME_NONNULL_END
