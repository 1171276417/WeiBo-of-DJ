//
//  ListTableViewCell.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>
#import "GetListItem.h"

NS_ASSUME_NONNULL_BEGIN
@class GetListItem;

@interface ListTableViewCell : UITableViewCell

@property(nonatomic,strong,readwrite)UIImageView *profile_image_url;//用户头像
@property(nonatomic,strong,readwrite)UILabel *screen_name;//用户昵称
@property(nonatomic,strong,readwrite)UILabel *text;//微博内容

@property(nonatomic)CGFloat ListCellHeight;



- (void)ListlayoutTableViewCellWithItem:(GetListItem *)item;



@end

NS_ASSUME_NONNULL_END
