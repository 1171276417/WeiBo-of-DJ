//
//  HomeTableViewCell.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <UIKit/UIKit.h>
#import "GetListItem.h"
#import "Singleton.h"
#import "SDWebImage.h"
//#import "WebViewController.h"

//#import "WeiboViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class GetListItem;

@interface HomeTableViewCell : UITableViewCell

@property(nonatomic,strong)GetListItem *model;

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

/**位置坐标信息*/
@property(nonatomic)CGFloat HomeCellHeight;
@property(nonatomic)CGFloat imageHeigh;
@property(nonatomic)CGFloat text_Y;
@property(nonatomic)CGFloat text_Height;
@property(nonatomic)CGFloat url_Height;
@property(nonatomic)NSUInteger urlcount;


@property(nonatomic,strong)NSString *urlstr;

@property(nonatomic,strong)NSDictionary *dicURL;

- (void)HomelayoutTableViewCellWithItem:(GetListItem *)item;


@end

NS_ASSUME_NONNULL_END
