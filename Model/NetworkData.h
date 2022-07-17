//
//  NetworkData.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <Foundation/Foundation.h>
#import "GetListItem.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN
@class GetListItem;//声明getListItem

/**定义一个block*/
typedef void(^WeiboListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//返回一个ListItem类型的数组
typedef void(^CommentListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//返回一个ListItem类型的数组

@interface NetworkData : NSObject

- (void)LoadListDataBlock:(WeiboListItemLoadBlock)finishBlock andpage:(int)page;//获取微博数据
- (void)LoadCommentListDataBlock:(CommentListItemLoadBlock)finishBlock andID:(NSNumber *)ID;//获取评论数据





@end

NS_ASSUME_NONNULL_END
