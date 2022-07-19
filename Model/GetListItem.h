//
//  GetListItem.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetListItem : NSObject

/**博客内容*/
@property(nonatomic,copy,readwrite)NSString *created_at;//发博时间
@property(nonatomic,copy,readwrite)NSString *source;//来源
@property(nonatomic,copy,readwrite)NSString *text;//微博内容
@property(nonatomic,copy,readwrite)NSString *text_raw;//微博内容1

@property(nonatomic,copy,readwrite)NSString *thumbnail_pic;//缩略图url
@property(nonatomic,copy,readwrite)NSString *bmiddle_pic;//中尺寸图片url
@property(nonatomic,copy,readwrite)NSString *original_pic;//原图url
@property(nonatomic,copy,readwrite)NSNumber *reposts_count;//转发数
@property(nonatomic,copy,readwrite)NSNumber *comments_count;//评论数
@property(nonatomic,copy,readwrite)NSNumber *attitudes_count;//表态数
@property(nonatomic,copy,readwrite)NSNumber *ID;//用户ID
@property(nonatomic,copy,readwrite)NSArray *pic_urls;//图片数组

/**用户信息*/
@property(nonatomic,copy,readwrite)NSString *screen_name;//用户昵称
@property(nonatomic,copy,readwrite)NSString *location;//用户位置
@property(nonatomic,copy,readwrite)NSString *describe;//用户描述
@property(nonatomic,copy,readwrite)NSString *profile_image_url;//用户头像图片url
@property(nonatomic,copy,readwrite)NSString *gender;//用户性别
@property(nonatomic,copy,readwrite)NSNumber *followers_count;//粉丝数
@property(nonatomic,copy,readwrite)NSNumber *friends_count;//关注数
@property(nonatomic,copy,readwrite)NSNumber *statuses_count;//微博数
@property(nonatomic,copy,readwrite)NSNumber *favourites_count;//收藏数
@property(nonatomic,copy,readwrite)NSString *created_atuser;//用户注册时间
@property(nonatomic,copy,readwrite)NSString *verified;//是否为V
@property(nonatomic,copy,readwrite)NSString *uid;//是否为V


/**评论信息*/
@property(nonatomic,copy,readwrite)NSString *COMscreen_name;//用户昵称
@property(nonatomic,copy,readwrite)NSString *COMprofile_image_url;//用户头像图片url
@property(nonatomic,copy,readwrite)NSString *COMverified;//是否为V
@property(nonatomic,copy,readwrite)NSString *COMtext;//评论内容
@property(nonatomic,copy,readwrite)NSString *COMcreated_at;//评论时间
@property(nonatomic,copy,readwrite)NSString *COMsource;//来源
@property(nonatomic,copy,readwrite)NSString *COMtext_raw;//评论内容



- (void)WeiboconfigWithDictionary:(NSDictionary *)dictionary;

- (void)CommentconfigwithDictionary:(NSDictionary *)dictionary;






@end

NS_ASSUME_NONNULL_END
