//
//  PostTableViewCell.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>
#import "PostListItem.h"

NS_ASSUME_NONNULL_BEGIN
@class PostListItem;

@interface PostTableViewCell : UITableViewCell

/**发表*/
@property(nonatomic,strong)UIImageView *profile_image_url;//我的头像
@property(nonatomic,strong)UILabel *screen_name;//我的昵称
@property(nonatomic,strong)UILabel *created_at;//发博时间
@property(nonatomic,strong)UILabel *source;//微博来源
@property(nonatomic,strong)UILabel *text;//微博内容

@property(nonatomic,strong,readwrite)UIButton *btnreposts;//转发按钮
@property(nonatomic,strong,readwrite)UILabel *reposts_count;//转发数
@property(nonatomic,strong,readwrite)UIImageView *reposts;//转发图标

@property(nonatomic,strong,readwrite)UIButton *btncomments;//评论按钮
@property(nonatomic,strong,readwrite)UILabel *comments_count;//评论数
@property(nonatomic,strong,readwrite)UIImageView *comments;//评论图标

@property(nonatomic,strong,readwrite)UIButton *btnattitudes;//点赞按钮
@property(nonatomic,strong,readwrite)UILabel *attitudes_count;//点赞数
@property(nonatomic,strong,readwrite)UIImageView *attitudes;//点赞图标

@property(nonatomic)CGFloat PostCellHeight;

- (void)PostlayoutCell:(PostListItem *)item;




@end

NS_ASSUME_NONNULL_END
