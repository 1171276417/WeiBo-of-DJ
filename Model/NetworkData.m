//
//  NetworkData.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "NetworkData.h"

@implementation NetworkData

/**获取微博内容数据*/
- (void)LoadListDataBlock:(WeiboListItemLoadBlock)finishBlock andpage:(int)page{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"access_token":@"2.00b5biSHdh2B8B78b926ec07U12SWD",
        @"page":[NSNumber numberWithInt:page]
    };
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSArray *dataArray = [((NSDictionary *)responseObject)objectForKey:@"statuses"];
        for(NSDictionary *info in dataArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list WeiboconfigWithDictionary:info];
            [listItemArray addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


/**获取微博评论数据*/
- (void)LoadCommentListDataBlock:(CommentListItemLoadBlock)finishBlock andID:(NSNumber *)ID{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"access_token":@"2.00b5biSHdh2B8B78b926ec07U12SWD",
        @"id":ID
    };
    [manager GET:@"https://api.weibo.com/2/comments/show.json" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemCommentArray = @[].mutableCopy;
        NSArray *CommentArray = [((NSDictionary *)responseObject)objectForKey:@"comments"];
        for(NSDictionary *info in CommentArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list CommentconfigwithDictionary:info];
            [listItemCommentArray addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemCommentArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}




@end
