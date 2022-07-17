//
//  PostListItem.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostListItem : NSObject

@property(nonatomic,copy,readwrite)NSString *myscreen_name;//用户昵称
@property(nonatomic,copy,readwrite)NSString *myprofile_image_url;//用户头像图片url
@property(nonatomic,copy,readwrite)NSString *mycreated_at;//发博时间
@property(nonatomic,copy,readwrite)NSString *mysource;//来源
@property(nonatomic,copy,readwrite)NSString *mytext;//微博内容
@property(nonatomic,copy,readwrite)NSString *myimage;//微博图片
@property(nonatomic,copy,readwrite)NSNumber *myreposts_count;//转发数
@property(nonatomic,copy,readwrite)NSNumber *mycomments_count;//评论数
@property(nonatomic,copy,readwrite)NSNumber *myattitudes_count;//表态数

- (void)PostWeiboDataDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
