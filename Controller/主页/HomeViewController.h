//
//  HomeViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <UIKit/UIKit.h>
#import "HomeView.h"
#import "HomeTableViewCell.h"
#import "GetListItem.h"
#import "NetworkData.h"
#import "Singleton.h"
#import "WeiboViewController.h"
#import "NavigationBarView.h"
#import "PostViewController.h"
#import "PostTableViewCell.h"
#import "SearchViewController.h"
#import "MJRefresh.h"
#import "SDAutoLayout.h"


@class GetListItem;
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController

@property(nonatomic,strong)HomeView *homeview;
@property(nonatomic,strong)HomeTableViewCell *homecell;
@property(nonatomic,strong)HomeTableViewCell *homecell2;

@property(nonatomic,strong)PostTableViewCell *postcell;
@property(nonatomic,strong)NetworkData *networkdata;
@property(nonatomic,strong)NavigationBarView *navView;
@property(nonatomic,strong)UIRefreshControl *refresh;
@property(nonatomic,strong)NSMutableArray *homearr;
@property(nonatomic,strong)GetListItem *list;



/**微博内容*/
@property(nonatomic,strong,readwrite)UIImageView *profile_image_url;//用户头像
@property(nonatomic,strong,readwrite)UILabel *screen_name;//用户昵称
@property(nonatomic,strong,readwrite)UILabel *created_at;//发微博时间
@property(nonatomic,strong,readwrite)UILabel *source;//微博来源
@property(nonatomic,strong,readwrite)UILabel *text;//微博内容
@property(nonatomic,strong,readwrite)UIButton *btnURL;//网页链接
@property(nonatomic,strong,readwrite)UILabel *URL;//网页链接

@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic1;//微博缩略图九张
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic2;
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic3;
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic4;
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic5;
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic6;
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic7;
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic8;
@property(nonatomic,strong,readwrite)UIImageView *thumbnail_pic9;

@property(nonatomic,strong,readwrite)UIButton *btnreposts;//转发按钮
@property(nonatomic,strong,readwrite)UILabel *reposts_count;//转发数
@property(nonatomic,strong,readwrite)UIImageView *reposts;//转发图标

@property(nonatomic,strong,readwrite)UIButton *btncomments;//评论按钮
@property(nonatomic,strong,readwrite)UILabel *comments_count;//评论数
@property(nonatomic,strong,readwrite)UIImageView *comments;//评论图标

@property(nonatomic,strong,readwrite)UIButton *btnattitudes;//点赞按钮
@property(nonatomic,strong,readwrite)UILabel *attitudes_count;//点赞数
@property(nonatomic,strong,readwrite)UIImageView *attitudes;//点赞图标

@property(nonatomic,copy,readwrite)NSArray *pic_urls;//图片数组

@property(nonatomic,copy,readwrite)NSString *ID;//用户ID

@end

NS_ASSUME_NONNULL_END
