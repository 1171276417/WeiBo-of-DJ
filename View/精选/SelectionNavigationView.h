//
//  SelectionNavigationView.h
//  微博4.0
//
//  Created by 邓杰 on 2022/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectionNavigationView : UIView

@property(nonatomic,strong)UIButton *btnHot;
@property(nonatomic,strong)UIButton *btnRecreation;
@property(nonatomic,strong)UIButton *btnEmotion;
@property(nonatomic,strong)UIButton *btnTravel;
@property(nonatomic,strong)UIButton *btnCartoon;
@property(nonatomic,strong)UIView *slide1;
@property(nonatomic,strong)UIView *slide2;
@property(nonatomic,strong)UIView *slide3;
@property(nonatomic,strong)UIView *slide4;
@property(nonatomic,strong)UIView *slide5;


- (void)SetNavigationBar;

@end

NS_ASSUME_NONNULL_END
