//
//  CommentCellModel.h
//  微博4.0
//
//  Created by 邓杰 on 2022/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentCellModel : NSObject

@property(nonatomic,strong)NSString *profile_image_url;//用户头像
@property(nonatomic,strong)NSString *screen_name;//用户昵称
@property(nonatomic,strong)NSString *created_at;//发评论时间
@property(nonatomic,strong)NSString *source;//评论来源
@property(nonatomic,strong)NSString *text;//评论内容

@end

NS_ASSUME_NONNULL_END
