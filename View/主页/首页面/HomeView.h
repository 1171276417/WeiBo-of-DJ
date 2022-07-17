//
//  HomeView.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView

@property(nonatomic,strong)UITableView *hometableview;//主页微博内容
@property(nonatomic,strong)UITableView *mytableview;//我发布的微博
@property(strong,nonatomic)UILabel *placeholder;

@property(nonatomic,strong)UIScrollView *scrollview;

@property(nonatomic,strong)UITextField *searchview;

@property(nonatomic,strong)UIButton *btnsearch;
@property(nonatomic,strong)UIImageView *imagesearch;
@property(nonatomic,strong)UIImageView *imagesearch2;


-(void)tableinit;

@end

NS_ASSUME_NONNULL_END
