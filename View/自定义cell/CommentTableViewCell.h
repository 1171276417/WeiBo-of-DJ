//
//  CommentTableViewCell.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>
#import "GetListItem.h"
#import "CommentCellModel.h"

NS_ASSUME_NONNULL_BEGIN
@class GetListItem;

@interface CommentTableViewCell : UITableViewCell

/**评论*/
@property(nonatomic,strong)UIImageView *profile_image_url;//用户头像
@property(nonatomic,strong)UILabel *screen_name;//用户昵称
@property(nonatomic,strong)UILabel *created_at;//发评论时间
@property(nonatomic,strong)UILabel *source;//评论来源
@property(nonatomic,strong)UILabel *text;//评论内容
@property(nonatomic,strong)GetListItem *model;

@property(nonatomic,strong)CommentCellModel *model1111;


@property(nonatomic)CGFloat CommentCellHeight;

- (void)CommentlayoutCell:(GetListItem *)item;

@end

NS_ASSUME_NONNULL_END
